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
Tunnel.bindInterface("vrp_spawn",cRP)
vSERVER = Tunnel.getInterface("vrp_spawn")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local cam = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETUPCHARS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_spawn:setupChars")
AddEventHandler("vrp_spawn:setupChars",function()

	SetEntityVisible(PlayerPedId(),false,false)
	SetEntityInvincible(PlayerPedId(),false) --mqcu

	cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",232.42,-419.45,224.98,360.0,0.0,140.0,60.0,false,0)
	SetCamActive(cam,true)
	RenderScriptCams(true,false,1,true,true)

	Citizen.Wait(1000)

	SendNUIMessage({ action = "show" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETUPMAXCHARS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_spawn:maxChars")
AddEventHandler("vrp_spawn:maxChars",function()
	SendNUIMessage({ action = "show" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNCHAR
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("destroy:cam")
AddEventHandler("destroy:cam",function(status)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)

	SetCamActive(cam,false)
	DestroyCam(cam,true)
	cam = nil

	TriggerEvent("vrp_login:Spawn",status)
end) 
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETCHARACTERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("GetCharacters",function(data,cb)
	local chars = vSERVER.setupChars()
	Citizen.Wait(1000)
	cb(chars)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERCHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("CharacterChosen",function(data,cb)

	TriggerServerEvent("vrp_spawn:charChosen",tonumber(data.id))
	SetNuiFocus(false,false)
	cb("ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERCREATED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("CharacterCreated",function(data,cb)
	TriggerServerEvent("vrp_spawn:createChar",data.name,data.name2,data.sex)
	SetNuiFocus(false,false)
	cb("ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETECHARACTER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("DeleteCharacter",function(data,cb)
	local chars = vSERVER.deleteChar(tonumber(data.id))
	cb(chars)
end)