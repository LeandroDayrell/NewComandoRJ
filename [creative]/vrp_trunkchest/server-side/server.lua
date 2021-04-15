-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vAZgarage = Proxy.getInterface('az-garages')

vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_trunkchest",cRP)
vCLIENT = Tunnel.getInterface("vrp_trunkchest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local vehChest = {}
local vehNames = {}
local vehWeight = {}
local chestOpen = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOCHILA
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.Mochila()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local vehicle,vehNet,vehPlate,vehName = vRPclient.vehList(source,7)--
		if vehicle then
			local plateUserId = vRP.getVehiclePlate(vehPlate)
			if plateUserId then
				local myinventory = {}
				local myvehicle = {}

				if vRPclient.inVehicle(source) then
					vehWeight[user_id] = 7
					vehChest[parseInt(user_id)] = "gloves:"..parseInt(plateUserId)..":"..vehName
				else
					vehWeight[user_id] = parseInt(vRP.vehicleChest(vehName))
					vehChest[parseInt(user_id)] = "chest:"..parseInt(plateUserId)..":"..vehName
				end

				vehNames[parseInt(user_id)] = vehName

				local inv = vRP.getInventory(parseInt(user_id))
				local data = vRP.getSData(vehChest[parseInt(user_id)])
				local sdata = json.decode(data) or {}
				if data and sdata ~= nil then
					for k,v in pairs(sdata) do
						table.insert(myvehicle,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.itemWeightList(k) })
					end
				end

				for k,v in pairs(inv) do
					if string.sub(v.item,1,9) == "toolboxes" then
						local advFile = LoadResourceFile("logsystem","toolboxes.json")
						local advDecode = json.decode(advFile)

						v.durability = advDecode[v.item]
					end

					v.amount = parseInt(v.amount)
					v.name = vRP.itemNameList(v.item)
					v.peso = vRP.itemWeightList(v.item)
					v.index = vRP.itemIndexList(v.item)
					v.key = v.item
					v.slot = k

					myinventory[k] = v
				end

				return myinventory,myvehicle,vRP.computeInvWeight(user_id),vRP.getBackpack(user_id),vRP.computeChestWeight(sdata),parseInt(vehWeight[user_id]),{ identity.name.." "..identity.name2,parseInt(user_id),parseInt(identity.bank),parseInt(vRP.getUserGems(user_id)),identity.phone,identity.registration }
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
local noStore = {
	["water"] = true,
	["dirtywater"] = true,
	["coffee"] = true,
	["hamburger"] = true,
	["cola"] = true,
	["tacos"] = true,
	["fries"] = true,
	["soda"] = true,
	["hotdog"] = true,
	["sandwich"] = true,
	["chocolate"] = true,
	["donut"] = true,
	["ritmoneury"] = true,
	["sinkalmy"] = true,
	["dollars"] = true,
	["dollars2"] = true,
	["absolut"] = true,
	["chandon"] = true,
	["dewars"] = true,
	["hennessy"] = true,
	["identity"] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREVEHS
-----------------------------------------------------------------------------------------------------------------------------------------
local storeVehs = {
	["mule3"] = {
		["bait"] = true,
		["shrimp"] = true,
		["octopus"] = true,
		["carp"] = true
	},
	["ratloader"] = {
		["woodlog"] = true
	},
	["stockade"] = {
		["pouch"] = true
	},
	["trash"] = {
		["plastic"] = true,
		["glass"] = true,
		["rubber"] = true,
		["aluminum"] = true,
		["copper"] = true,
		["emptybottle"] = true
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_trunkchest:populateSlot")
AddEventHandler("vrp_trunkchest:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			TriggerClientEvent("vrp_trunkchest:Update",source,"updateMochila")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_trunkchest:updateSlot")
AddEventHandler("vrp_trunkchest:updateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(slot)] and inv[tostring(target)] and inv[tostring(slot)].item == inv[tostring(target)].item then
				if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
				end
			else
				vRP.swapSlot(user_id,slot,target)
			end
		end

		TriggerClientEvent("vrp_trunkchest:Update",source,"updateMochila")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_trunkchest:sumSlot")
AddEventHandler("vrp_trunkchest:sumSlot",function(itemName,slot,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(slot)] and inv[tostring(slot)].item == itemName then
				if vRP.tryChestItem(user_id,vehChest[parseInt(user_id)],itemName,amount,slot) then
					TriggerClientEvent("vrp_trunkchest:Update",source,"updateMochila")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.storeItem(itemName,slot,amount)
	if itemName then
		local source = source
		local user_id = vRP.getUserId(source)
		if user_id then
			if storeVehs[vehNames[parseInt(user_id)]] then
				if not storeVehs[vehNames[parseInt(user_id)]][itemName] then
					TriggerClientEvent("Notify",source,"importante","Você não pode armazenar este item em veículos.",5000)
					return
				end
			end

			if noStore[itemName] then
				TriggerClientEvent("Notify",source,"importante","Você não pode armazenar este item em veículos.",5000)
				return
			end

			if vRP.storeChestItem(user_id,vehChest[parseInt(user_id)],itemName,amount,parseInt(vehWeight[user_id]),slot) then
				TriggerClientEvent("vrp_trunkchest:Update",source,"updateMochila")
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.takeItem(itemName,slot,amount)
	if itemName then
		local source = source
		local user_id = vRP.getUserId(source)
		if user_id then
			if vRP.tryChestItem(user_id,vehChest[parseInt(user_id)],itemName,amount,slot) then
				TriggerClientEvent("vrp_trunkchest:Update",source,"updateMochila")
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.chestClose()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle = vRP.query('vAZ/GetPlayerVehiclePlate', {plate = plate}) --
		if #vehicle > 0 then
			if not vRPclient.inVehicle(source) then
				TriggerClientEvent("vrp_player:syncDoors",-1,vehNet,"5")
			end

			if chestOpen[user_id] then
				chestOpen[user_id] = nil
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("trunk",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle = vRPclient.getNearVehicle(source,7)
		if vehicle then 
			local plate = vCLIENT.getPlateVehicle(source, vehicle)
			if plate ~= nil then 
				print('Placa: ' ..plate)
				local vehicle = vRP.query('vAZ/GetPlayerVehiclePlate', {plate = plate}) --
				print(vehicle)
				--local vehicle,vehNet,vehPlate,vehName,vehLock,vehBlock,vehHealth = vRPclient.vehList(source,7)
				
				--local vehHealth = vRPclient.GetVehicleBodyHealth(source,7)
				
				if #vehicle > 0 then
					local data = vAZgarage.getServerVehicle('model', vehicle[1].model)
					local maxweight = (data ~= nil) and data.trunk or 0
					local trunk = (vehicle[1].trunk == nil or vehicle[1].trunk == '') and {} or json.decode(vehicle[1].trunk)
					if type(trunk) ~= 'table' then
						trunk = {}
					end
					
					--vCLIENT.trunkOpen(source) --
					--local data = vAZgarage.getServerV
					for k,v in pairs(chestOpen) do
						if v == plate then
							return
						end
					end
					--[[if vCLIENT.getPlateLock() then
						if vehBlock then
							print('teste 07')
							return
						end]]

						--if vehHealth < 100 then
							--return
						--end

						--local plate = vCLIENT.getPlateVehicle(vehPlate)
						if plate then
							chestOpen[user_id] = plate
							vCLIENT.trunkOpen(source) --

							if not vRPclient.inVehicle(source) then
								TriggerClientEvent("vrp_player:syncDoors",-1,vehNet,"5")
							end 
						end -- if plateUserId then
					--end -- if not vCLIENT.getPlateLock() then
				end -- if #vehicle > 0 then
			end -- if plate ~= nil then 
		end -- if vehicle then 
	end-- if user_id then
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERLEAVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerLeave",function(user_id,source)
	if chestOpen[user_id] then
		chestOpen[user_id] = nil
	end
end)