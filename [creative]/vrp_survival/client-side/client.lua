-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_survival",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local deadTimers = 600
local deadPlayer = false
local blockControls = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHEALTH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 100
		local ped = PlayerPedId()
		if GetEntityHealth(ped) <= 101 then
			if not deadPlayer then
				timeDistance = 100
				deadTimers = 600
				deadPlayer = true

				local coords = GetEntityCoords(ped)
				NetworkResurrectLocalPlayer(coords,true,true,false)

				SetEntityHealth(ped,101)
				SetEntityInvincible(ped,true)

				TriggerEvent("radio:outServers")
				TriggerServerEvent("vrp_inventory:Cancel")
			else
				timeDistance = 4
				SetEntityHealth(ped,101)

				if deadTimers > 0 then
					drawTxt("AGUARDE ~r~"..deadTimers.."~w~ SEGUNDOS",4,0.5,0.93,0.4,255,255,255,100)
				else
					drawTxt("~y~/GG~w~ PARA RETORNAR AO AEROPORTO",4,0.5,0.93,0.4,255,255,255,100)
				end

				if not IsEntityPlayingAnim(ped,"dead","dead_a",3) and not IsPedInAnyVehicle(ped) then
					vRP.playAnim(false,{"dead","dead_a"},true)
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTXT
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FINISHDEATH
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.finishDeath()
	local ped = PlayerPedId()
	if GetEntityHealth(ped) <= 101 then
		deadTimers = 600
		deadPlayer = false
		ClearPedBloodDamage(ped)
		SetEntityHealth(ped,200)
		SetEntityInvincible(ped,false)
		TriggerServerEvent("clearInventory")

		DoScreenFadeOut(0)
		Citizen.Wait(1000)
		SetEntityCoords(ped,-1041.25,-2744.99,21.35)
		Citizen.Wait(3000)
		DoScreenFadeIn(1000)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HEALTHRECHARGE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		SetPlayerHealthRechargeMultiplier(PlayerId(),0)
		Citizen.Wait(100)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEADPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.deadPlayer()
	return deadPlayer
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REVIVEPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.revivePlayer(health)
	SetEntityHealth(PlayerPedId(),health)
	SetEntityInvincible(PlayerPedId(),false)

	if deadPlayer then
		deadPlayer = false
		ClearPedTasks(PlayerPedId())
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_survival:CheckIn")
AddEventHandler("vrp_survival:CheckIn",function()
	SetEntityHealth(PlayerPedId(),102)
	SetEntityInvincible(PlayerPedId(),false)

	Citizen.Wait(500)

	deadPlayer = false
	blockControls = false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("updatePrison")
AddEventHandler("updatePrison",function()
	SetEntityHealth(PlayerPedId(),110)
	SetEntityInvincible(PlayerPedId(),false)

	if deadPlayer then
		deadPlayer = false
		blockControls = true
		ClearPedTasks(PlayerPedId())
		TriggerEvent("resetBleeding")
		TriggerEvent("resetDiagnostic")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLOCKCONTROLS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 100
		local ped = PlayerPedId()
		if blockControls or deadPlayer then
			timeDistance = 4
			DisablePlayerFiring(ped,true)
			DisableControlAction(1,22,true)
			DisableControlAction(1,73,true)
			DisableControlAction(1,167,true)
			DisableControlAction(1,29,true)
			DisableControlAction(1,182,true)
			DisableControlAction(1,187,true)
			DisableControlAction(1,189,true)
			DisableControlAction(1,190,true)
			DisableControlAction(1,188,true)
			DisableControlAction(1,311,true)
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTCURE
-----------------------------------------------------------------------------------------------------------------------------------------
local cure = false
function cRP.startCure()
	local ped = PlayerPedId()

	if cure then
		return
	end

	cure = true
	TriggerEvent("Notify","sucesso","O tratamento começou, espere o paramédico libera-lo.",3000)

	if cure then
		repeat
			Citizen.Wait(1000)
			if GetEntityHealth(ped) > 101 then
				SetEntityHealth(ped,GetEntityHealth(ped)+1)
			end
		until GetEntityHealth(ped) >= 200 or GetEntityHealth(ped) <= 101
			TriggerEvent("Notify","sucesso","Tratamento concluído.",3000)
			cure = false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if deadTimers > 0 then
			deadTimers = deadTimers - 1
		end
		Citizen.Wait(1000)
	end
end)