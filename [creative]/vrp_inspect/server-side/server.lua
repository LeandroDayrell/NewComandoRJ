-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_inspect",cRP)
vCLIENT = Tunnel.getInterface("vrp_inspect")


local webhooklinkrevistar = "https://discord.com/api/webhooks/837164435138936872/Dk5kyAebJSysuaHK9Q0ZwXSMevALy3Nt9C8zKMCnn79cxzDjTdg3XzsZ1HCdk2FWNjRA"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local opened = {}
--[[ -----------------------------------------------------------------------------------------------------------------------------------------
-- REVISTAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("revistar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local nplayer = vRPclient.nearestPlayer(source,5)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			if not vRP.hasPermission(nuser_id,"Police") then
				if vRP.hasPermission(user_id,"Police") then
					vCLIENT.toggleCarry(nplayer,source)

					local weapons = vRPclient.replaceWeapons(nplayer)
					for k,v in pairs(weapons) do
						vRP.giveInventoryItem(nuser_id,k,1)
						if v.ammo > 0 then
							vRP.giveInventoryItem(nuser_id,vRP.itemAmmoList(k),v.ammo)
						end
					end

					vRPclient.updateWeapons(nplayer)
					opened[user_id] = parseInt(nuser_id)
					vCLIENT.openInspect(source)
				else
					if not vRP.wantedReturn(nuser_id) then
						local policia = vRP.numPermission("Police")
						if parseInt(#policia) > 1 then
							if vRPclient.getHealth(nplayer) > 101 then
								local request = vRP.request(nplayer,"Você está sendo revistado, você permite?",60)
								if request then
									vRPclient._playAnim(nplayer,true,{"random@arrests@busted","idle_a"},true)
									vCLIENT.toggleCarry(nplayer,source)

									local weapons = vRPclient.replaceWeapons(nplayer)
									for k,v in pairs(weapons) do
										vRP.giveInventoryItem(nuser_id,k,1)
										if v.ammo > 0 then
											vRP.giveInventoryItem(nuser_id,vRP.itemAmmoList(k),v.ammo)
										end
									end

									vRP.wantedTimer(user_id,60)
									vRPclient.updateWeapons(nplayer)
									opened[user_id] = parseInt(nuser_id)
									vCLIENT.openInspect(source)
								else
									TriggerClientEvent("Notify",source,"negado","Pedido de revista recusado.",5000)
								end
							end
						else
							TriggerClientEvent("Notify",source,"negado","Sistema indisponível no momento.",5000)
						end
					end
				end
			else 
				TriggerClientEvent("Notify",source,"negado","Voce nao pode revistar um Policial",5000)
			end
		end
	end
end) ]]


-----------------------------------------------------------------------------------------------------------------------------------------
-- REVISTAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("revistar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local nplayer = vRPclient.nearestPlayer(source,5)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			if not vRP.hasPermission(nuser_id,"Police") then
				if vRP.hasPermission(user_id,"Police") then
					vCLIENT.toggleCarry(nplayer,source)
					vRPclient._playAnim(nplayer,true,{"random@arrests@busted","idle_a"},true)
					local weapons = vRPclient.replaceWeapons(nplayer)
					for k,v in pairs(weapons) do
						vRP.giveInventoryItem(nuser_id,k,1)
						if v.ammo > 0 then
							vRP.giveInventoryItem(nuser_id,vRP.itemAmmoList(k),v.ammo)
						end
					end

					vRPclient.updateWeapons(nplayer)
					opened[user_id] = parseInt(nuser_id)
					vCLIENT.openInspect(source)
				else
					if not vRP.wantedReturn(nuser_id) then
						local policia = vRP.numPermission("Police")
						if parseInt(#policia) > 1 then
							if vRPclient.getHealth(nplayer) > 101 then
								local request = vRP.request(nplayer,"Você está sendo revistado, você permite?",60)
								if request then
									vRPclient._playAnim(nplayer,true,{"random@arrests@busted","idle_a"},true)
									vCLIENT.toggleCarry(nplayer,source)
							
									local weapons = vRPclient.replaceWeapons(nplayer)
									for k,v in pairs(weapons) do
										vRP.giveInventoryItem(nuser_id,k,1)
										if v.ammo > 0 then
											vRP.giveInventoryItem(nuser_id,vRP.itemAmmoList(k),v.ammo)
										end
									end
									TriggerClientEvent("Notify",nplayer,"aviso","Voce esta sendo revistado",5000)

									vRP.wantedTimer(user_id,60)
									vRPclient.updateWeapons(nplayer)
									opened[user_id] = parseInt(nuser_id)
									vCLIENT.openInspect(source)
								else
									TriggerClientEvent("Notify",source,"negado","Pedido de revista recusado.",5000)
								end
							else
									--print('Teste')
									vCLIENT.toggleCarry(nplayer,source)
									local weapons = vRPclient.replaceWeapons(nplayer)
									for k,v in pairs(weapons) do
										vRP.giveInventoryItem(nuser_id,k,1)
										
										if v.ammo > 0 then
											vRP.giveInventoryItem(nuser_id,vRP.itemAmmoList(k),v.ammo)
										end
									end
									vRP.wantedTimer(user_id,60)
									vRPclient.updateWeapons(nplayer)
									opened[user_id] = parseInt(nuser_id)
									vCLIENT.openInspect(source)
									TriggerClientEvent("Notify",nuser_id,"aviso","Voce esta sendo revistado",5000)

							end
						else
							TriggerClientEvent("Notify",source,"negado","Sistema indisponível no momento.",5000)
						end
					end
				end
			else 
				TriggerClientEvent("Notify",source,"negado","Voce nao pode revistar um Policial",5000)
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.openChest()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if opened[user_id] ~= nil then

			local ninventory = {}
			local myInv = vRP.getInventory(user_id)
			for k,v in pairs(myInv) do
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

				ninventory[k] = v
			end

			local uinventory = {}
			local othInv = vRP.getInventory(opened[user_id])
			for k,v in pairs(othInv) do
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

				uinventory[k] = v
			end

			local identity = vRP.getUserIdentity(user_id)
			return ninventory,uinventory,vRP.computeInvWeight(user_id),vRP.getBackpack(user_id),vRP.computeInvWeight(opened[user_id]),vRP.getBackpack(opened[user_id]),{ identity.name.." "..identity.name2,user_id,parseInt(identity.bank),parseInt(vRP.getUserGems(user_id)),identity.phone,identity.registration }
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:populateSlot")
AddEventHandler("vrp_inspect:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:updateSlot")
AddEventHandler("vrp_inspect:updateSlot",function(itemName,slot,target,amount)
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

		TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUMSLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:sumSlot")
AddEventHandler("vrp_inspect:sumSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(target)] and inv[tostring(target)].item == itemName then
				if vRP.tryGetInventoryItem(opened[user_id],itemName,amount,false,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
					TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUM2SLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:sum2Slot")
AddEventHandler("vrp_inspect:sum2Slot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inv = vRP.getInventory(opened[user_id])
		if inv[tostring(target)] and inv[tostring(target)].item == item then
			if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
				vRP.giveInventoryItem(opened[user_id],itemName,amount,false,target)
				TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.storeItem(itemName,slot,amount,target)
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		if user_id then
			if vRP.computeInvWeight(opened[user_id]) + vRP.itemWeightList(itemName) * parseInt(amount) <= vRP.getBackpack(opened[user_id]) then
				if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
					vRP.giveInventoryItem(opened[user_id],itemName,amount,true,target)
					SendWebhookMessage(webhooklinkrevistar,  "STORE > UserID: [" ..user_id.."] Revistou: " ..target.. " pegou " ..itemName.. " qnt " ..amount.. " teste . ")
					TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
				end
			else
				TriggerClientEvent("Notify",source,"negado","Mochila cheia.",5000)
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.takeItem(itemName,slot,amount,target)
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		if user_id then
			if vRP.computeInvWeight(user_id) + vRP.itemWeightList(itemName) * parseInt(amount) <= vRP.getBackpack(user_id) then
				if vRP.tryGetInventoryItem(opened[user_id],itemName,amount,true,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
					TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
					if amount ~= nil then
					SendWebhookMessage(webhooklinkrevistar,  "TAKE > UserID: [" ..user_id.."] Revistou: " ..target.. " pegou " ..itemName.. " qnt " ..amount.. ".")
					end
					
				end
			else
				TriggerClientEvent("Notify",source,"negado","Mochila cheia.",5000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESETINSPECT
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.resetInspect()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local nplayer = vRPclient.nearestPlayer(source,5)
		if nplayer then
			vRPclient._stopAnim(nplayer,false)
			vCLIENT.toggleCarry(nplayer,source)
		end

		if opened[user_id] ~= nil then
			opened[user_id] = nil
		end
		vRPclient._stopAnim(source,false)
	end
end