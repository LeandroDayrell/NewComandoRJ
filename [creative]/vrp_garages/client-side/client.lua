-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cnVRP = {}
src ={}
Tunnel.bindInterface("vrp_garages",cnVRP)
vSERVER = Tunnel.getInterface("vrp_garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local vehicle = {}
local cooldown = 0
local trydoors = {}
local openGarage = ""
local pointGarage = 1
local vehHotwired = false
local anim = "machinic_loop_mechandplayer"
local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHELETRIC
-----------------------------------------------------------------------------------------------------------------------------------------
local vehEletric = {
	["voltic"] = true,
	["raiden"] = true,
	["neon"] = true,
	["tezeract"] = true,
	["cyclone"] = true,
	["surge"] = true,
	["dilettante"] = true,
	["dilettante2"] = true,
	["bmx"] = true,
	["cruiser"] = true,
	["fixter"] = true,
	["scorcher"] = true,
	["tribike"] = true,
	["tribike2"] = true,
	["tribike3"] = true,
	["teslaprior"] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.openGarage(name,status)
	if name and status then
		openGarage = name
		pointGarage = status
	end

	SetNuiFocus(true,true)
	SendNUIMessage({ action = "openNUI" })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEMODS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.vehicleMods(veh,custom)
	if custom and veh then
		SetVehicleModKit(veh,0)

		if not custom.customcolor1 and not custom.customcolor2 then
			if custom.color then
				SetVehicleColours(veh,tonumber(custom.color[1]),tonumber(custom.color[2]))
				SetVehicleExtraColours(veh,tonumber(custom.extracolor[1]),tonumber(custom.extracolor[2]))
			end
		else
			SetVehicleCustomPrimaryColour(veh,tonumber(custom.customcolor1[1]),tonumber(custom.customcolor1[2]),tonumber(custom.customcolor1[3]))
			SetVehicleCustomSecondaryColour(veh,tonumber(custom.customcolor2[1]),tonumber(custom.customcolor2[2]),tonumber(custom.customcolor2[3]))
		end

		if custom.smokecolor then
																									  
			SetVehicleTyreSmokeColor(veh,tonumber(custom.smokecolor[1]),tonumber(custom.smokecolor[2]),tonumber(custom.smokecolor[3]))
		end

		if custom.neon then
			SetVehicleNeonLightEnabled(veh,0,1)
			SetVehicleNeonLightEnabled(veh,1,1)
			SetVehicleNeonLightEnabled(veh,2,1)
			SetVehicleNeonLightEnabled(veh,3,1)
			SetVehicleNeonLightsColour(veh,tonumber(custom.neoncolor[1]),tonumber(custom.neoncolor[2]),tonumber(custom.neoncolor[3]))
		else
			SetVehicleNeonLightEnabled(veh,0,0)
			SetVehicleNeonLightEnabled(veh,1,0)
			SetVehicleNeonLightEnabled(veh,2,0)
			SetVehicleNeonLightEnabled(veh,3,0)
	 

															   
								
																					
		end

		if custom.plateindex then
			SetVehicleNumberPlateTextIndex(veh,tonumber(custom.plateindex))
		end

		if custom.windowtint then
			SetVehicleWindowTint(veh,tonumber(custom.windowtint))
		end

		if custom.bulletProofTyres then
			SetVehicleTyresCanBurst(veh,custom.bulletProofTyres)
		end

		if custom.wheeltype then
			SetVehicleWheelType(veh,tonumber(custom.wheeltype))
		end

		if custom.spoiler then
			SetVehicleMod(veh,0,tonumber(custom.spoiler))
			SetVehicleMod(veh,1,tonumber(custom.fbumper))
			SetVehicleMod(veh,2,tonumber(custom.rbumper))
			SetVehicleMod(veh,3,tonumber(custom.skirts))
			SetVehicleMod(veh,4,tonumber(custom.exhaust))
			SetVehicleMod(veh,5,tonumber(custom.rollcage))
			SetVehicleMod(veh,6,tonumber(custom.grille))
			SetVehicleMod(veh,7,tonumber(custom.hood))
			SetVehicleMod(veh,8,tonumber(custom.fenders))
			SetVehicleMod(veh,10,tonumber(custom.roof))
			SetVehicleMod(veh,11,tonumber(custom.engine))
			SetVehicleMod(veh,12,tonumber(custom.brakes))
			SetVehicleMod(veh,13,tonumber(custom.transmission))
			SetVehicleMod(veh,14,tonumber(custom.horn))
			SetVehicleMod(veh,15,tonumber(custom.suspension))
			SetVehicleMod(veh,16,tonumber(custom.armor))
			SetVehicleMod(veh,23,tonumber(custom.tires),custom.tiresvariation)
		
			if IsThisModelABike(GetEntityModel(veh)) then
				SetVehicleMod(veh,24,tonumber(custom.btires),custom.btiresvariation)
			end
		
			SetVehicleMod(veh,25,tonumber(custom.plateholder))
			SetVehicleMod(veh,26,tonumber(custom.vanityplates))
			SetVehicleMod(veh,27,tonumber(custom.trimdesign)) 
			SetVehicleMod(veh,28,tonumber(custom.ornaments))
			SetVehicleMod(veh,29,tonumber(custom.dashboard))
			SetVehicleMod(veh,30,tonumber(custom.dialdesign))
			SetVehicleMod(veh,31,tonumber(custom.doors))
			SetVehicleMod(veh,32,tonumber(custom.seats))
			SetVehicleMod(veh,33,tonumber(custom.steeringwheels))
			SetVehicleMod(veh,34,tonumber(custom.shiftleavers))
			SetVehicleMod(veh,35,tonumber(custom.plaques))
			SetVehicleMod(veh,36,tonumber(custom.speakers))
			SetVehicleMod(veh,37,tonumber(custom.trunk)) 
			SetVehicleMod(veh,38,tonumber(custom.hydraulics))
			SetVehicleMod(veh,39,tonumber(custom.engineblock))
			SetVehicleMod(veh,40,tonumber(custom.camcover))
			SetVehicleMod(veh,41,tonumber(custom.strutbrace))
			SetVehicleMod(veh,42,tonumber(custom.archcover))
			SetVehicleMod(veh,43,tonumber(custom.aerials))
			SetVehicleMod(veh,44,tonumber(custom.roofscoops))
			SetVehicleMod(veh,45,tonumber(custom.tank))
			SetVehicleMod(veh,46,tonumber(custom.doors))
			SetVehicleMod(veh,48,tonumber(custom.liveries))
			SetVehicleLivery(veh,tonumber(custom.liveries))

			ToggleVehicleMod(veh,20,tonumber(custom.tyresmoke))
			ToggleVehicleMod(veh,22,tonumber(custom.headlights))
			ToggleVehicleMod(veh,18,tonumber(custom.turbo))
		end
		if tonumber(custom.headlights) == 1 then
            SetVehicleHeadlightsColour(veh,tonumber(custom.xenoncolor))
		end
		TriggerEvent('nation:applymods',nveh,vehname)
	end
end

RegisterNetEvent('vrp_garages:mods')
AddEventHandler('vrp_garages:mods',function(vnet,custom)
	src.vehicleMods(NetToVeh(vnet),custom)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.spawnVehicle(vehname,plate,vehengine,vehbody,vehfuel,custom,vehWindows,vehDoors,vehTyres)
	if vehicle[vehname] == nil then
		local checkPos = nil
		local checkslot = 0
		local mHash = GetHashKey(vehname)

		RequestModel(mHash)
		while not HasModelLoaded(mHash) do
			RequestModel(mHash)
			Citizen.Wait(10)
		end

		if HasModelLoaded(mHash) then
			repeat
				Citizen.Wait(1)
				checkslot = checkslot + 1
				if spawn[pointGarage][tostring(checkslot)] ~= nil then
					checkPos = GetClosestVehicle(spawn[pointGarage][tostring(checkslot)][1],spawn[pointGarage][tostring(checkslot)][2],spawn[pointGarage][tostring(checkslot)][3],2.501,0,71)
				end
			until not DoesEntityExist(checkPos) or spawn[pointGarage][tostring(checkslot)] == nil

			if spawn[pointGarage][tostring(checkslot)] == nil then
				TriggerEvent("Notify","importante","Todas as vagas estão atualmente ocupadas.",5000)
			else
				local _,cdz = GetGroundZFor_3dCoord(spawn[pointGarage][tostring(checkslot)][1],spawn[pointGarage][tostring(checkslot)][2],spawn[pointGarage][tostring(checkslot)][3]+1)
				local nveh = CreateVehicle(mHash,spawn[pointGarage][tostring(checkslot)][1],spawn[pointGarage][tostring(checkslot)][2],cdz,spawn[pointGarage][tostring(checkslot)][4],true,false)

				NetworkRegisterEntityAsNetworked(nveh)
				while not NetworkGetEntityIsNetworked(nveh) do
					Citizen.Wait(10)
				end

				if json.decode(vehDoors) ~= nil then
					for k,v in pairs(json.decode(vehDoors)) do
						if v then
							SetVehicleDoorBroken(nveh,parseInt(k),parseInt(v))
						end
					end
				end

				if json.decode(vehWindows) ~= nil then
					for k,v in pairs(json.decode(vehWindows)) do
						if not v then
							SmashVehicleWindow(nveh,parseInt(k))
						end
					end
				end

				if json.decode(vehTyres) ~= nil then
					for k,v in pairs(json.decode(vehTyres)) do
						if v < 2 then
							SetVehicleTyreBurst(nveh,parseInt(k),(v == 1),1000.01)
						end
					end
				end

				SetEntityAsMissionEntity(nveh,true,true)
				SetVehicleOnGroundProperly(nveh)
				SetVehicleNumberPlateText(nveh,plate)
				SetVehRadioStation(nveh,"OFF")
				SetVehicleDirtLevel(nveh,0.0)

				SetVehicleEngineHealth(nveh,vehengine+0.0)
				SetVehicleBodyHealth(nveh,vehbody+0.0)

				if vehEletric[vehname] then
					SetVehicleFuelLevel(nveh,0.0)
				else
					SetVehicleFuelLevel(nveh,vehfuel+0.0)
				end
				--TriggerEvent("nation:applymods",nveh,vehname) SE FOR COLOCAR O NATION
				cnVRP.vehicleMods(nveh,custom)

				vehicle[vehname] = true

				local netid = VehToNet(nveh)
				SetNetworkIdExistsOnAllMachines(netid,true)
				NetworkSetNetworkIdDynamic(netid,true)
				SetNetworkIdCanMigrate(netid,false)
				for _,i in ipairs(GetActivePlayers()) do
					SetNetworkIdSyncToPlayer(netid,i,true)
				end

				SetModelAsNoLongerNeeded(mHash)

				return true,netid
			end
		end
	end
	return false
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.deleteVehicle(vehicle)
	if IsEntityAVehicle(vehicle) then
		local vehDoors = {}
		for i = 0,5 do
			vehDoors[i] = IsVehicleDoorDamaged(vehicle,i)
		end

		local vehWindows = {}
		for i = 0,7 do
			vehWindows[i] = IsVehicleWindowIntact(vehicle,i)
		end

		local vehTyres = {}
		for i = 0,7 do
			local tyre_state = 2
			if IsVehicleTyreBurst(vehicle,i,true) then
				tyre_state = 1
			elseif IsVehicleTyreBurst(vehicle,i,false) then
				tyre_state = 0
			end
			vehTyres[i] = tyre_state
		end

		vSERVER.tryDelete(VehToNet(vehicle),GetVehicleEngineHealth(vehicle),GetVehicleBodyHealth(vehicle),GetVehicleFuelLevel(vehicle),vehDoors,vehWindows,vehTyres,GetVehicleNumberPlateText(vehicle))
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_garages:syncVehicle")
AddEventHandler("vrp_garages:syncVehicle",function(index,plate)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToEnt(index)
		if DoesEntityExist(v) and GetVehicleNumberPlateText(v) == plate then
			SetEntityAsMissionEntity(v,false,false)
			DeleteEntity(v)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCNAMEDELETE
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.syncNameDelete(vehname)
	if vehicle[vehname] then
		vehicle[vehname] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RETURNVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.returnVehicle(name)
	return vehicle[name]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTONCLICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(data,cb)
	SetNuiFocus(false,false)
    SendNUIMessage({ action = "closeNUI" })
    cb("ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("myVehicles",function(data,cb)
	local vehicles = vSERVER.myVehicles(openGarage)
	if vehicles then
		cb({ vehicles = vehicles })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("spawnVehicles",function(data)
	vSERVER.spawnVehicles(data.name,parseInt(pointGarage))
	SetNuiFocus(false,false)
    SendNUIMessage({ action = "closeNUI" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("deleteVehicles",function(data)
	vSERVER.deleteVehicles()
	SetNuiFocus(false,false)
    SendNUIMessage({ action = "closeNUI" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLECLIENTLOCK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_garages:vehicleClientLock")
AddEventHandler("vrp_garages:vehicleClientLock",function(index,lock)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				local locked = GetVehicleDoorLockStatus(v)
				if locked == 1 then
					SetVehicleDoorsLocked(v,2)
				else
					SetVehicleDoorsLocked(v,1)
				end
				SetVehicleLights(v,2)
				Wait(200)
				SetVehicleLights(v,0)
				Wait(200)
				SetVehicleLights(v,2)
				Wait(200)
				SetVehicleLights(v,0)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTONS
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for k,v in pairs(spawn) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 7 then
					timeDistance = 4
					DrawMarker(36, v[1],v[2],v[3] - 0.80, 0,0, 0,0, 0,0, 0.2, 0.2, 0.2, 70, 30, 200, 80, 1, 0, 0, 0)
					DrawMarker(23, v[1],v[2],v[3] - 0.97, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 70, 30, 200, 80, 0, 0, 0, 0)
					if distance <= 2 then
						if IsControlJustPressed(1,38) then
							vSERVER.returnHouses(v[4],k)
						end
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end) ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- COOLDOWN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if cooldown > 0 then
			cooldown = cooldown - 1
		end
		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTONLOCK
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		if cooldown <= 0 then
			timeDistance = 5
			if IsControlJustPressed(1,182) then
				vSERVER.vehicleLock()
				cooldown = 1
			end
		end

		Citizen.Wait(timeDistance)
	end
end) ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCTRYDOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_garages:syncTrydoors")
AddEventHandler("vrp_garages:syncTrydoors",function(doors)
	trydoors = doors
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTANIMHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.startAnimHotwired()
	vehHotwired = true
	while not HasAnimDictLoaded(animDict) do
		RequestAnimDict(animDict)
		Citizen.Wait(10)
	end
	TaskPlayAnim(PlayerPedId(),animDict,anim,3.0,3.0,-1,49,5.0,0,0,0)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPANIMHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.stopAnimHotwired(vehicle)
	while not HasAnimDictLoaded(animDict) do
		RequestAnimDict(animDict)
		Citizen.Wait(10)
	end
	vehHotwired = false
	StopAnimTask(PlayerPedId(),animDict,anim,2.0)
	SetEntityAsMissionEntity(vehicle,true,true)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.updateHotwired(status)
	vehHotwired = status
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOOPHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsUsing(ped)
			local platext = GetVehicleNumberPlateText(vehicle)
			if GetPedInVehicleSeat(vehicle,-1) == ped and not trydoors[platext] or GetEntityHealth(ped) <= 101 then
				SetVehicleEngineOn(vehicle,false,true,true)
				DisablePlayerFiring(ped,true)
				timeDistance = 4
			end

			if vehHotwired and vehicle then
				DisableControlAction(1,75,true)
				DisableControlAction(1,20,true)
				timeDistance = 4
			end
		end

		Citizen.Wait(timeDistance)
	end
end)