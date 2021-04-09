local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local phoneProp = nil
local phoneModel = "prop_npc_phone_02"
local currentStatus = "out"
local lastDict = nil
local lastAnim = nil
local lastIsFreeze = false
local animName = nil

local anims = {
	["cellphone@"] = {
		["out"] = {
			["text"] = "cellphone_text_in",
			["call"] = "cellphone_call_listen_base"
		},
		["text"] = {
			["out"] = "cellphone_text_out",
			["text"] = "cellphone_text_in",
			["call"] = "cellphone_text_to_call"
		},
		["call"] = {
			["out"] = "cellphone_call_out",
			["text"] = "cellphone_call_to_text",
			["call"] = "cellphone_text_to_call"
		}
	},
	["anim@cellphone@in_car@ps"] = {
		["out"] = {
			["text"] = "cellphone_text_in",
			["call"] = "cellphone_call_in"
		},
		["text"] = {
			["out"] = "cellphone_text_out",
			["text"] = "cellphone_text_in",
			["call"] = "cellphone_text_to_call"
		},
		["call"] = {
			["out"] = "cellphone_horizontal_exit",
			["text"] = "cellphone_call_to_text",
			["call"] = "cellphone_text_to_call"
		}
	}
}

function newPhoneProp()
	deletePhone()
	vRP.removeActived()

	local ped = PlayerPedId()
	local mHash = GetHashKey(phoneModel)

	RequestModel(mHash)
	while not HasModelLoaded(mHash) do
		RequestModel(mHash)
		Citizen.Wait(10)
	end

	local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
	phoneProp = CreateObjectNoOffset(mHash,coords.x,coords.y,coords.z,true,false,false)
	AttachEntityToEntity(phoneProp,ped,GetPedBoneIndex(ped,28422),0.0,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
	SetEntityAsMissionEntity(phoneProp,true,true)
	SetModelAsNoLongerNeeded(mHash)

	NetworkRegisterEntityAsNetworked(phoneProp)
	while not NetworkGetEntityIsNetworked(phoneProp) do
		Citizen.Wait(10)
	end

	local netid = ObjToNet(phoneProp)
	SetNetworkIdExistsOnAllMachines(netid,true)
	NetworkSetNetworkIdDynamic(netid,true)
	SetNetworkIdCanMigrate(netid,false)
	for _,i in ipairs(GetActivePlayers()) do
		SetNetworkIdSyncToPlayer(netid,i,true)
	end
end

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if not IsEntityPlayingAnim(ped,"cellphone@",animName,3) and phoneProp ~= nil then
			TaskPlayAnim(ped,"cellphone@",animName,3.0,3.0,-1,50,0,0,0,0)
		end
		Citizen.Wait(1000)
	end
end)

function deletePhone()
	TriggerEvent("binoculos")
	if DoesEntityExist(phoneProp) then
		TriggerServerEvent("tryDeleteEntity",ObjToNet(phoneProp))
		phoneProp = nil

		if IsPedInAnyVehicle(PlayerPedId()) then
			ClearPedSecondaryTask(PlayerPedId())
			ClearPedTasks(PlayerPedId())
		end
	end
end

function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end

function PhonePlayAnim(status,freeze,force)
	local ped = PlayerPedId()

	if status ~= "out" and currentStatus == "out" then
		vRP._DeletarObjeto()
	end

	if currentStatus == status and force ~= true then
		return
	end

	local freeze = freeze or false

	local dict = "cellphone@"
	if IsPedInAnyVehicle(ped,false) then
		dict = "anim@cellphone@in_car@ps"
	end
	loadAnimDict(dict)

	local anim = anims[dict][currentStatus][status]
	if currentStatus ~= "out" then
		StopAnimTask(ped,lastDict,lastAnim,2.0)
	end

	local flag = 50
	if freeze then
		flag = 14
	end

	animName = anim
	TaskPlayAnim(ped,dict,anim,3.0,3.0,-1,flag,0,false,false,false)

	if status ~= "out" and currentStatus == "out" then
		Citizen.Wait(380)
		newPhoneProp()
		SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true)
	end

	lastDict = dict
	lastAnim = anim
	lastIsFreeze = freeze
	currentStatus = status

	if status == "out" then
		Citizen.Wait(180)
		deletePhone()
		StopAnimTask(ped,lastDict,lastAnim,2.0)
	end
end

function PhonePlayOut()
	if GetEntityHealth(PlayerPedId()) > 101 then
		PhonePlayAnim("out")
	end
end

function PhonePlayText()
	if GetEntityHealth(PlayerPedId()) > 101 then
		PhonePlayAnim("text")
	end
end

function PhonePlayCall()
	if GetEntityHealth(PlayerPedId()) > 101 then
		PhonePlayAnim("call")
	end
end

function PhonePlayIn()
	if currentStatus == "out" and GetEntityHealth(PlayerPedId()) > 101 then
		PhonePlayText()
	end
end