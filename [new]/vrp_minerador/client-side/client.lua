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
Tunnel.bindInterface("vrp_minerador",cRP)
vSERVER = Tunnel.getInterface("vrp_minerador")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
local timeSeconds = 0
local mineradorList = {}
local inService = false
local vehModel = -947761570
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADGARBAGE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		if inService then
			local ped = PlayerPedId()
			if not IsPedInAnyVehicle(ped) then
				local coords = GetEntityCoords(ped)

				for k,v in pairs(mineradorList) do
					local distance = #(coords - vector3(v[1],v[2],v[3]))
					if distance <= 30 then
						timeDistance = 4 --
						DrawMarker(21,v[1],v[2],v[3]-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,100,185,230,50,0,0,0,1)
						if distance <= 0.6 and IsControlJustPressed(1,38) and timeSeconds <= 0 and GetEntityModel(GetPlayersLastVehicle()) == vehModel then
							timeSeconds = 2
							vRP._playAnim(false,{"amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham"},true)
							Wait(1000)
								vSERVER.paymentMethod(parseInt(k))
								vRP._stopAnim(false)					
						end
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTminerador
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.getMineradorStatus()
	return inService
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTminerador
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.startminerador()
	inService = true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPminerador
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.stopminerador()
	inService = false
	for k,v in pairs(blips) do
		if DoesBlipExist(blips[k]) then
			RemoveBlip(blips[k])
			blips[k] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEGARBAGELIST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_minerador:updateMineradorList")
AddEventHandler("vrp_minerador:updateMineradorList",function(status)
	mineradorList = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEGARBAGELIST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_minerador:removeMineradorBlips")
AddEventHandler("vrp_minerador:removeMineradorBlips",function(number)
	if DoesBlipExist(blips[number]) then
		RemoveBlip(blips[number])
		blips[number] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INSERTBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_minerador:insertBlips")
AddEventHandler("vrp_minerador:insertBlips",function(statusList)
	if inService then
		for k,v in pairs(blips) do
			if DoesBlipExist(blips[k]) then
				RemoveBlip(blips[k])
				blips[k] = nil
			end
		end

		Citizen.Wait(1000)

		for k,v in pairs(statusList) do
			blips[k] = AddBlipForRadius(v[1],v[2],v[3],10.0)
			SetBlipAlpha(blips[k],255)
			SetBlipColour(blips[k],57)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMESECONDS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if timeSeconds > 0 then
			timeSeconds = timeSeconds - 1
		end
		Citizen.Wait(1000)
	end
end)