-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local crouch = false
local point = false
local object = nil
local celular = false
local coolTimers = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- STATUS:CELULAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("status:celular")
AddEventHandler("status:celular",function(status)
	celular = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COOLTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if coolTimers > 0 then
			coolTimers = coolTimers - 1
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCELULAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if celular then
			timeDistance = 4
			DisableControlAction(1,288,true)
			DisableControlAction(1,289,true)
			DisableControlAction(1,170,true)
			DisableControlAction(1,187,true)
			DisableControlAction(1,189,true)
			DisableControlAction(1,190,true)
			DisableControlAction(1,188,true)
			DisableControlAction(1,73,true)
			DisableControlAction(1,167,true)
			DisableControlAction(1,29,true)
			DisableControlAction(1,182,true)
			DisableControlAction(1,16,true)
			DisableControlAction(1,17,true)
			DisableControlAction(1,24,true)
			DisableControlAction(1,25,true)
			DisableControlAction(1,245,true)
			DisableControlAction(1,68,true)
			DisableControlAction(1,70,true)
			DisableControlAction(1,91,true)
			DisablePlayerFiring(PlayerPedId(),true)
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.request(id,text,time)
	SendNUIMessage({ act = "request", id = id, text = tostring(text), time = time })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NUIPROMPT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("prompt",function(data,cb)
	if data.act == "close" then
		SetNuiFocus(false)
		vRPserver._promptResult(data.result)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROMPT
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.prompt(title,default_text)
	SendNUIMessage({ act = "prompt", title = title, text = tostring(default_text) })
	SetNuiFocus(true)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("request",function(data,cb)
	if data.act == "response" then
		vRPserver._requestResult(data.id,data.ok)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOADANIMSET
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.loadAnimSet(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
local animDict = nil
local animName = nil
local animActived = false
function tvRP.createObjects(dict,anim,prop,flag,mao,altura,pos1,pos2,pos3,pos4,pos5)
	if DoesEntityExist(object) then
		TriggerServerEvent("tryDeleteEntity",ObjToNet(object))
		object = nil
	end

	local ped = PlayerPedId()
	local mHash = GetHashKey(prop)

	RequestModel(mHash)
	while not HasModelLoaded(mHash) do
		RequestModel(mHash)
		Citizen.Wait(10)
	end

	if anim ~= "" then
		tvRP.loadAnimSet(dict)
		TaskPlayAnim(ped,dict,anim,3.0,3.0,-1,flag,0,0,0,0)
	end

	if altura then
		local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
		object = CreateObjectNoOffset(mHash,coords.x,coords.y,coords.z,true,false,false)
		AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,mao),altura,pos1,pos2,pos3,pos4,pos5,true,true,false,true,1,true)
	else
		local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
		object = CreateObjectNoOffset(mHash,coords.x,coords.y,coords.z,true,false,false)
		AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,mao),0.0,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
	end
	SetEntityAsMissionEntity(object,true,true)
	SetModelAsNoLongerNeeded(mHash)

	NetworkRegisterEntityAsNetworked(object)
	while not NetworkGetEntityIsNetworked(object) do
		Citizen.Wait(10)
	end

	animDict = dict
	animName = anim
	animFlags = flag
	animActived = true

	local netid = ObjToNet(object)
	SetNetworkIdExistsOnAllMachines(netid,true)
	NetworkSetNetworkIdDynamic(netid,true)
	SetNetworkIdCanMigrate(netid,false)
	for _,i in ipairs(GetActivePlayers()) do
		SetNetworkIdSyncToPlayer(netid,i,true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEACTIVED
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.removeActived()
	if animActived then
		if DoesEntityExist(object) then
			TriggerServerEvent("tryDeleteEntity",ObjToNet(object))
			object = nil
		end
		animActived = false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADANIM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if not IsEntityPlayingAnim(ped,animDict,animName,3) and animActived then
			TaskPlayAnim(ped,animDict,animName,3.0,3.0,-1,animFlags,0,0,0,0)
		end
		Citizen.Wait(500)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBLOCK
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if animActived then
			timeDistance = 4
			DisableControlAction(1,16,true)
			DisableControlAction(1,17,true)
			DisableControlAction(1,24,true)
			DisableControlAction(1,25,true)
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.removeObjects(status)
	if status == "one" then
		tvRP.stopAnim(true)
	elseif status == "two" then
		tvRP.stopAnim(false)
	else
		tvRP.stopAnim(true)
		tvRP.stopAnim(false)
	end

	animActived = false
	TriggerEvent("camera")
	TriggerEvent("binoculos")
	if DoesEntityExist(object) then
		TriggerServerEvent("tryDeleteEntity",ObjToNet(object))
		object = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLOCKDRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
local blockDrunk = false
RegisterNetEvent("vrp:blockDrunk")
AddEventHandler("vrp:blockDrunk",function(status)
	blockDrunk = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CROUCH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			timeDistance = 4
			if IsDisabledControlJustPressed(1,36) and coolTimers <= 0 and not blockDrunk then
				if crouch then
					--ResetPedStrafeClipset(ped)
					ResetPedMovementClipset(ped,0.25)
					crouch = false
				else
					RequestAnimSet("move_ped_crouched")
					--RequestAnimSet("move_ped_crouched_strafing")

					--SetPedStrafeClipset(ped,"move_ped_crouched_strafing")
					SetPedMovementClipset(ped,"move_ped_crouched",0.25)
					crouch = true
				end

				coolTimers = 3
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POINT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 100
		if point then
			timeDistance = 4
			local ped = PlayerPedId()
			local camPitch = GetGameplayCamRelativePitch()

			if camPitch < -70.0 then
				camPitch = -70.0
			elseif camPitch > 42.0 then
				camPitch = 42.0
			end
			camPitch = (camPitch + 70.0) / 112.0

			local camHeading = GetGameplayCamRelativeHeading()
			local cosCamHeading = Cos(camHeading)
			local sinCamHeading = Sin(camHeading)
			if camHeading < -180.0 then
				camHeading = -180.0
			elseif camHeading > 180.0 then
				camHeading = 180.0
			end
			camHeading = (camHeading + 180.0) / 360.0

			local blocked = 0
			local nn = 0
			local coords = GetOffsetFromEntityInWorldCoords(ped,(cosCamHeading*-0.2)-(sinCamHeading*(0.4*camHeading+0.3)),(sinCamHeading*-0.2)+(cosCamHeading*(0.4*camHeading+0.3)),0.6)
			local ray = Cast_3dRayPointToPoint(coords.x,coords.y,coords.z-0.2,coords.x,coords.y,coords.z+0.2,0.4,95,ped,7);
			nn,blocked,coords,coords = GetRaycastResult(ray)

			Citizen.InvokeNative(0xD5BB4025AE449A4E,ped,"Pitch",camPitch)
			Citizen.InvokeNative(0xD5BB4025AE449A4E,ped,"Heading",camHeading*-1.0+1.0)
			Citizen.InvokeNative(0xB0A6CFD2C69C1088,ped,"isBlocked",blocked)
			Citizen.InvokeNative(0xB0A6CFD2C69C1088,ped,"isFirstPerson",Citizen.InvokeNative(0xEE778F8C7E1142E2,Citizen.InvokeNative(0x19CAFA3C87F7C2FF))==4)
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTONS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()

		DisableControlAction(1,157,false)
		DisableControlAction(1,158,false)
		DisableControlAction(1,160,false)
		DisableControlAction(1,164,false)
		DisableControlAction(1,165,false)
		DisableControlAction(1,159,false)
		DisableControlAction(1,161,false)
		DisableControlAction(1,162,false)
		DisableControlAction(1,163,false)
		DisableControlAction(1,36,true)

		if IsControlJustPressed(1,246) then SendNUIMessage({ act = "event", event = "Y" }) end
		if IsControlJustPressed(1,303) then SendNUIMessage({ act = "event", event = "U" }) end

		if GetEntityHealth(ped) > 101 and not celular then

			-- 1
			if IsDisabledControlJustPressed(1,157) then
                TriggerServerEvent("vrp_inventory:useItem","1",1)
			end

			-- 2
			if IsDisabledControlJustPressed(1,158) then
				TriggerServerEvent("vrp_inventory:useItem","2",1)
			end

			-- 3
			if IsDisabledControlJustPressed(1,160) then				
				TriggerServerEvent("vrp_inventory:useItem","3",1)
			end

			if not IsPedInAnyVehicle(ped) and not animActived then

				-- 4
				if IsDisabledControlJustPressed(1,164) then
					if IsEntityPlayingAnim(ped,"anim@heists@heist_corona@single_team","single_team_loop_boss",3) then
						StopAnimTask(ped,"anim@heists@heist_corona@single_team","single_team_loop_boss",2.0)
						tvRP.stopActived()
					else
						tvRP.playAnim(true,{"anim@heists@heist_corona@single_team","single_team_loop_boss"},true)
					end
				end

				-- 5
				if IsDisabledControlJustPressed(1,165) then
					if IsEntityPlayingAnim(ped,"mini@strip_club@idles@bouncer@base","base",3) then
						StopAnimTask(ped,"mini@strip_club@idles@bouncer@base","base",2.0)
						tvRP.stopActived()
					else
						tvRP.playAnim(true,{"mini@strip_club@idles@bouncer@base","base"},true)
					end
				end

				-- 6
				if IsDisabledControlJustPressed(1,159) then
					if IsEntityPlayingAnim(ped,"anim@mp_player_intupperfinger","idle_a_fp",3) then
						StopAnimTask(ped,"anim@mp_player_intupperfinger","idle_a_fp",2.0)
						tvRP.stopActived()
					else
						tvRP.playAnim(true,{"anim@mp_player_intupperfinger","idle_a_fp"},true)
					end
				end

				-- 7
				if IsDisabledControlJustPressed(1,161) then
					if IsEntityPlayingAnim(ped,"anim@heists@prison_heiststation@cop_reactions","cop_a_idle",3) then
						StopAnimTask(ped,"anim@heists@prison_heiststation@cop_reactions","cop_a_idle",2.0)
						tvRP.stopActived()
					else
						tvRP.playAnim(true,{"anim@heists@prison_heiststation@cop_reactions","cop_a_idle"},true)
					end
				end

				-- 8
				if IsDisabledControlJustPressed(1,162) then
					if IsEntityPlayingAnim(ped,"amb@world_human_cop_idles@female@base","base",3) then
						StopAnimTask(ped,"amb@world_human_cop_idles@female@base","base",2.0)
						tvRP.stopActived()
					else
						tvRP.playAnim(true,{"amb@world_human_cop_idles@female@base","base"},true)
					end
				end

				-- 9
				if IsDisabledControlJustPressed(1,163) then
					if IsEntityPlayingAnim(ped,"random@arrests@busted","idle_a",3) then
						StopAnimTask(ped,"random@arrests@busted","idle_a",2.0)
						tvRP.stopActived()
					else
						tvRP.playAnim(true,{"random@arrests@busted","idle_a"},true)
					end
				end

				-- ARROW LEFT
				if IsControlJustPressed(1,189) then
					tvRP.playAnim(true,{"anim@mp_player_intupperthumbs_up","enter"},false)
				end

				-- ARROW RIGHT
				if IsControlJustPressed(1,190) then
					tvRP.playAnim(true,{"anim@mp_player_intcelebrationmale@face_palm","face_palm"},false)
				end

				-- ARROW UP
				if IsControlJustPressed(1,188) then
					tvRP.playAnim(true,{"anim@mp_player_intcelebrationmale@salute","salute"},false)
				end

				-- ARROW DOWN
				if IsControlJustPressed(1,187) then
					tvRP.playAnim(true,{"rcmnigel1c","hailing_whistle_waive_a"},false)
				end
			end
		end

		Citizen.Wait(4)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCDELETEENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("syncDeleteEntity")
AddEventHandler("syncDeleteEntity",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToEnt(index)
		if DoesEntityExist(v) then
			SetEntityAsMissionEntity(v,false,false)
			DeleteEntity(v)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCCLEANENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("syncCleanEntity")
AddEventHandler("syncCleanEntity",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToEnt(index)
		if DoesEntityExist(v) then
			SetVehicleDirtLevel(v,0.0)
			SetVehicleUndriveable(v,false)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELF6
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cancelf6",function(source,args)
	if coolTimers <= 0 then
		coolTimers = 3
		TriggerServerEvent("vrp_inventory:Cancel")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HANDSUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("handsup",function(source,args)
	local ped = PlayerPedId()
	if IsEntityPlayingAnim(ped,"random@mugging3","handsup_standing_base",3) then
		StopAnimTask(ped,"random@mugging3","handsup_standing_base",2.0)
		tvRP.stopActived()
	else
		tvRP.playAnim(true,{"random@mugging3","handsup_standing_base"},true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POINT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("point",function(source,args)
	local ped = PlayerPedId()
	tvRP.loadAnimSet("anim@mp_point")
	if not point then
		tvRP.stopActived()
		SetPedCurrentWeaponVisible(ped,0,1,1,1)
		SetPedConfigFlag(ped,36,1)
		TaskMoveNetwork(ped,"task_mp_pointing",0.5,0,"anim@mp_point",24)
		point = true
	else
		Citizen.InvokeNative(0xD01015C7316AE176,ped,"Stop")
		if not IsPedInjured(ped) then
			ClearPedSecondaryTask(ped)
		end

		if not IsPedInAnyVehicle(ped) then
			SetPedCurrentWeaponVisible(ped,1,1,1,1)
		end

		SetPedConfigFlag(ped,36,0)
		ClearPedSecondaryTask(ped)
		point = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIGARVEH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("engineveh",function(source,args)
	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsUsing(ped)
	if GetPedInVehicleSeat(vehicle,-1) == ped then
		tvRP.removeObjects("two")
		local running = GetIsVehicleEngineRunning(vehicle)
		SetVehicleEngineOn(vehicle,not running,true,true)
		if running then
			SetVehicleUndriveable(vehicle,true)
		else
			SetVehicleUndriveable(vehicle,false)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KEYMAPPING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("cancelf6","Cancelar animações","keyboard","f6")
RegisterKeyMapping("handsup","Levantar as mãos","keyboard","x")
RegisterKeyMapping("point","Apontar os dedos","keyboard","b")
RegisterKeyMapping("engineveh","Ligar o veículo","keyboard","z")