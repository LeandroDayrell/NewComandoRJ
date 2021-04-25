-----------------------------------------------------------------------------------------------------------------------------------------
-- DEFAULTCUSTOM
-----------------------------------------------------------------------------------------------------------------------------------------
local customize = {}
for i = 0,19 do
	customize[i] = { 1,0 }
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	local data = vRP.getUserDataTable(user_id)
	if data then
		if data.customization then
			data.customization = nil
		end

		if data.position then
			if data.position.x == nil or data.position.y == nil or data.position.z == nil then
				data.position = { x = 27.66, y = -1763.32, z = 29.32 }
			end
		else
			data.position = { x = 27.66, y = -1763.32, z = 29.32 }
		end
		vRPclient.teleport(source,data.position.x,data.position.y,data.position.z+0.5)

		if data.skin then
			vRPclient.applySkin(source,data.skin)
		end

		if data.health then
			vRPclient.setHealth(source,data.health)
			local colete = data.armour
			SetTimeout(10000,function()
				if data.armour then
					source = vRP.getUserSource(user_id)
					if(source~=nil)then
						vRPclient.setArmour(source,colete)
					end
				end
			end)
			TriggerClientEvent("statusHunger",source,data.hunger)
			TriggerClientEvent("statusThirst",source,data.thirst)
			TriggerClientEvent("statusStress",source,data.stress)
		end

		if data.weaps then
			vRPclient.giveWeapons(source,data.weaps,true)
		end

		vRPclient.playerReady(source)

		Citizen.Wait(1000)

		-- VRP_BARBERSHOP
		local barberData = vRP.query("vRP/selectSkin",{ user_id = parseInt(user_id) })
		if barberData[1] then
			TriggerClientEvent("vrp_barbershop:setCustomization",source,{ 
				parseInt(barberData[1].fathers),
				parseInt(barberData[1].kinship),
				parseInt(barberData[1].eyecolor),
				parseInt(barberData[1].skincolor),
				parseInt(barberData[1].acne),
				parseInt(barberData[1].stains),
				parseInt(barberData[1].freckles),
				parseInt(barberData[1].aging),
				parseInt(barberData[1].hair),
				parseInt(barberData[1].haircolor),
				parseInt(barberData[1].haircolor2),
				parseInt(barberData[1].makeup),
				parseInt(barberData[1].makeupintensity),
				parseInt(barberData[1].makeupcolor),
				parseInt(barberData[1].lipstick),
				parseInt(barberData[1].lipstickintensity),
				parseInt(barberData[1].lipstickcolor),
				parseInt(barberData[1].eyebrow),
				parseInt(barberData[1].eyebrowintensity),
				parseInt(barberData[1].eyebrowcolor),
				parseInt(barberData[1].beard),
				parseInt(barberData[1].beardintentisy),
				parseInt(barberData[1].beardcolor),
				parseInt(barberData[1].blush),
				parseInt(barberData[1].blushintentisy),
				parseInt(barberData[1].blushcolor),
				barberData[1].shapemix,
				barberData[1].eyebrowsheight,
				barberData[1].eyebrowswidth,
				barberData[1].nosewidth,
				barberData[1].noseheight,
				barberData[1].noselength,
				barberData[1].nosebridge,
				barberData[1].nosetip,
				barberData[1].noseshift,
				barberData[1].cheekboneheight,
				barberData[1].cheekbonewidth,
				barberData[1].cheekswidth,
				barberData[1].lipswidth,
				barberData[1].jawwidth,
				barberData[1].jawheight,
				barberData[1].chinlength,
				barberData[1].chinposition,
				barberData[1].chinwidth,
				barberData[1].chinshape,
				barberData[1].neckwidth,
				barberData[1].chestmodel,
				barberData[1].chestcolor,
				barberData[1].sundamagemodel,
				parseInt(barberData[1].chestmodel),
				parseInt(barberData[1].chestcolor),
				parseInt(barberData[1].sundamagemodel)
			})
			Wait(1000)
			TriggerClientEvent("update:skin",source,barberData)

		else
			vRP.execute("vRP/insertSkin",{ user_id = parseInt(user_id) })
		end


		Citizen.Wait(1000)

		-- VRP_SKINSHOP
		local playerData = vRP.getUData(user_id,"Clothings")
		local resultData = json.decode(playerData)
		if resultData == nil then
			resultData = "clean"
		end
		TriggerClientEvent("vrp_skinshop:skinData",source,resultData)
	end
end)
vRP.prepare("v".."R".."P".."/".."u".."p".."d".."a".."t".."e".."S".."k".."i".."n".."C".."h".."a".."r".."a".."c".."t".."e".."r","UPDATE ".."v".."r".."p".."_b".."a".."r".."b".."e".."r".."s".."h".."o".."p".." SET fathers = @fathers, kinship = @kinship, eyecolor = @eyecolor, skincolor = @skincolor, acne = @acne, stains = @stains, freckles = @freckles, aging = @aging, hair = @hair, haircolor = @haircolor, haircolor2 = @haircolor2, makeup = @makeup, makeupintensity = @makeupintensity, makeupcolor = @makeupcolor, lipstick = @lipstick, lipstickintensity = @lipstickintensity, lipstickcolor = @lipstickcolor, eyebrow = @eyebrow, eyebrowintensity = @eyebrowintensity, eyebrowcolor = @eyebrowcolor, beard = @beard, beardintentisy = @beardintentisy, beardcolor = @beardcolor, blush = @blush, blushintentisy = @blushintentisy, blushcolor = @blushcolor, shapemix = @shapemix, eyebrowsheight = @eyebrowsheight, eyebrowswidth = @eyebrowswidth, nosewidth = @nosewidth, noseheight = @noseheight, noselength = @noselength, nosebridge = @nosebridge, nosetip = @nosetip, noseshift = @noseshift, cheekboneheight = @cheekboneheight, cheekbonewidth = @cheekbonewidth, cheekswidth = @cheekswidth, lipswidth = @lipswidth, jawwidth = @jawwidth, jawheight = @jawheight, chinlength = @chinlength, chinposition = @chinposition, chinwidth = @chinwidth, chinshape = @chinshape, neckwidth = @neckwidth, chestmodel = @chestmodel, chestcolor = @chestcolor, sundamagemodel = @sundamagemodel WHERE user_id = @user_id ")

-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEPOSITIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.updatePositions(x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.position = { x = tvRP.mathLegth(x), y = tvRP.mathLegth(y), z = tvRP.mathLegth(z) }
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEHOMEPOSITION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.updateHomePosition(user_id,x,y,z)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.position = { x = tvRP.mathLegth(x), y = tvRP.mathLegth(y), z = tvRP.mathLegth(z) }
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEHEALTH
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.updateHealth(health)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.health = health
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEARMOUR
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.updateArmour(armour)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.armour = armour
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.updateWeapons(weapons)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.weaps = weapons
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MATHLEGTH
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.mathLegth(n)
	return math.ceil(n*100)/100
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryDeleteEntity")
AddEventHandler("tryDeleteEntity",function(index)
	TriggerClientEvent("syncDeleteEntity",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYCLEANENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryCleanEntity")
AddEventHandler("tryCleanEntity",function(index)
	TriggerClientEvent("syncCleanEntity",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARINVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("clearInventory")
AddEventHandler("clearInventory",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data.inventorys then

			if vRP.getPremium(user_id) then
				data.backpack = 25
			else
				data.backpack = 5
			end

			data.inventorys = {}
			vRP.upgradeThirst(user_id,100)
			vRP.upgradeHunger(user_id,100)
			vRPclient._clearWeapons(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD THIRST/HUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(90000)
		for k,v in pairs(vRP.users) do
			vRP.downgradeThirst(v,1)
			vRP.downgradeHunger(v,1)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDAGRADETHIRST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.upgradeThirst(user_id,amount)
	local source = vRP.getUserSource(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		if data.thirst == nil then
			data.thirst = 100
		else
			data.thirst = data.thirst + amount
			if data.thirst >= 100 then
				data.thirst = 100
			end
		end

		TriggerClientEvent("statusThirst",source,data.thirst)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADEHUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.upgradeHunger(user_id,amount)
	local source = vRP.getUserSource(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		if data.hunger == nil then
			data.hunger = 100
		else
			data.hunger = data.hunger + amount
			if data.hunger >= 100 then
				data.hunger = 100
			end
		end

		TriggerClientEvent("statusHunger",source,data.hunger)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADETHIRST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.downgradeThirst(user_id,amount)
	local source = vRP.getUserSource(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		if data.thirst == nil then
			data.thirst = 100
		else
			data.thirst = data.thirst - amount
			if data.thirst <= 0 then
				data.thirst = 0
			end
		end

		TriggerClientEvent("statusThirst",source,data.thirst)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADEHUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.downgradeHunger(user_id,amount)
	local source = vRP.getUserSource(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		if data.hunger == nil then
			data.hunger = 100
		else
			data.hunger = data.hunger - amount
			if data.hunger <= 0 then
				data.hunger = 0
			end
		end

		TriggerClientEvent("statusHunger",source,data.hunger)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.upgradeStress(user_id,amount)
	local source = vRP.getUserSource(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		if data.stress == nil then
			data.stress = amount
		else
			data.stress = data.stress + amount
			if data.stress >= 100 then
				data.stress = 100
			end
		end

		TriggerClientEvent("statusStress",source,data.stress)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.downgradeStress(user_id,amount)
	local source = vRP.getUserSource(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		if data.stress == nil then
			data.stress = amount
		else
			data.stress = data.stress - amount
			if data.stress <= 0 then
				data.stress = 0
			end
		end

		TriggerClientEvent("statusStress",source,data.stress)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GRIDCHUNK
-----------------------------------------------------------------------------------------------------------------------------------------
function gridChunk(x)
	return math.floor((x + 8192) / 128)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOCHANNEL
-----------------------------------------------------------------------------------------------------------------------------------------
function toChannel(v)
	return (v.x << 8) | v.y
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETGRIDZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getGridzone(x,y)
	local gridChunk = vector2(gridChunk(x),gridChunk(y))
	return toChannel(gridChunk)
end