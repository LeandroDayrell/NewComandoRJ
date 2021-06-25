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
Tunnel.bindInterface("vrp_rotapm",cRP)
vSERVER = Tunnel.getInterface("vrp_rotapm")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local inRace = false
local startX = -1126.6
local startY = -864.31
local startZ = 13.56
local racePos = 0
--local raceTime = 0
local raceSelect = 0
local blipRace = {}
local timeSeconds = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local race = {
 	[1] = {
		{ -1169.13,-847.81,13.95 },
		{ -835.15,-1163.11,6.35 },
		{ -657.91,-1485.74,10.72 },
		{ 18.89,-1692.16,29.34 },
		{ 135.34,-1373.46,29.35 },
		{ 255.42,-611.75,42.42 },
		{ 62.42,251.41,109.64 },
		{ -755.36,219.54,75.72 },
		{ -1455.91,-441.3,35.51 },
		{ -301.9,-402.82,30.14 },
		{ 1014.5,-200.73,70.24 },
		{ 1160.95,-1038.17,43.17 },
	},
	[2] = {
		{ -1169.13,-847.81,13.95 },
		{ -835.15,-1163.11,6.35 },
		{ -657.91,-1485.74,10.72 },
		{ 18.89,-1692.16,29.34 },
		{ 135.34,-1373.46,29.35 },
		{ 255.42,-611.75,42.42 },
		{ 62.42,251.41,109.64 },
		{ -755.36,219.54,75.72 },
		{ -1455.91,-441.3,35.51 },
		{ -301.9,-402.82,30.14 },
		{ 1014.5,-200.73,70.24 },
		{ 1160.95,-1038.17,43.17 },
	},
	[3] = {
		{ -1169.13,-847.81,13.95 },
		{ -835.15,-1163.11,6.35 },
		{ -657.91,-1485.74,10.72 },
		{ 18.89,-1692.16,29.34 },
		{ 135.34,-1373.46,29.35 },
		{ 255.42,-611.75,42.42 },
		{ 62.42,251.41,109.64 },
		{ -755.36,219.54,75.72 },
		{ -1455.91,-441.3,35.51 },
		{ -301.9,-402.82,30.14 },
		{ 1014.5,-200.73,70.24 },
		{ 1160.95,-1038.17,43.17 },
	},
	
}
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTARTRACE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 100
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)

			if not inRace then
				local distance = #(coords - vector3(startX,startY,startZ))
				if distance <= 10 then
					--print("TESTE 01")
					timeDistance = 4
					DrawMarker(23,startX,startY,startZ-0.8,0,0,0,0,0,0,5.0,5.0,1.0,255,255,255,50,0,0,0,0)
					if distance <= 12.5 then
						--print("TESTE 02")
						local vehicle = GetVehiclePedIsUsing(ped)
						if IsControlJustPressed(1,38) and GetPedInVehicleSeat(vehicle,-1) == ped then
							--timeSeconds = 2
						--	print("TESTE 03")
							if vSERVER.permissao() then -- VERFIICAR PERMISSAO DO POLICIAL PARA INICIAR A ROTA
								--if vSERVER.checkTicket() then
								--print("TESTE 04")
									racePos = 1
									inRace = true
									raceSelect = vSERVER.startRace()
									makeBlipMarked(raceSelect)
									SetNewWaypoint(race[raceSelect][racePos][1]+0.0001,race[raceSelect][racePos][2]+0.0001)
								--end
							end
						end
					end
				end
			else
				local distance = #(coords - vector3(race[raceSelect][racePos][1],race[raceSelect][racePos][2],race[raceSelect][racePos][3]))
				if distance <= 200 then
					timeDistance = 4
					DrawMarker(1,race[raceSelect][racePos][1],race[raceSelect][racePos][2],race[raceSelect][racePos][3]-3,0,0,0,0,0,0,12.0,12.0,8.0,255,255,255,25,0,0,0,0)
					DrawMarker(21,race[raceSelect][racePos][1],race[raceSelect][racePos][2],race[raceSelect][racePos][3]+1,0,0,0,0,180.0,130.0,3.0,3.0,2.0,255,0,0,50,1,0,0,1)
					if distance <= 10 then
						if DoesBlipExist(blipRace[racePos]) then
							RemoveBlip(blipRace[racePos])
							blipRace[racePos] = nil
						end

						if racePos >= #race[raceSelect] then
							vSERVER.paymentMethod(GetVehicleNumberPlateText(GetVehiclePedIsUsing(ped)))
							PlaySoundFrontend(-1,"RACE_PLACED","HUD_AWARDS",false)
							inRace = false
							vSERVER.finishRacePagamento()
						else
								racePos = racePos + 1
								SetNewWaypoint(race[raceSelect][racePos][1]+0.0001,race[raceSelect][racePos][2]+0.0001)
								local x,y,z = GetEntityCoords(ped)
									local ped = PlayerPedId()
								vSERVER.pagamentoPolice()
						end
					end
				end
			end

		end

		Citizen.Wait(timeDistance)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKEBLIPRACE
-----------------------------------------------------------------------------------------------------------------------------------------
function makeBlipMarked(number)
	for k,v in pairs(race[number]) do
		--print(k)
		--print(v)
		--print(pairs(race[number]))
		blipRace[k] = AddBlipForCoord(v[1],v[2],v[3])
		SetBlipSprite(blipRace[k],1)
		SetBlipColour(blipRace[k],0)
		SetBlipAsShortRange(blipRace[k],true)
		SetBlipScale(blipRace[k],0.8)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Checkpoint")
		EndTextCommandSetBlipName(blipRace[k])
		ShowNumberOnBlip(blipRace[k],parseInt(k))
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DWTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function dwText(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end
--[[ -----------------------------------------------------------------------------------------------------------------------------------------
-- DEFUSE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.defuseRace()
	inRace = false
	timeSeconds = 0

	for k,v in pairs(blipRace) do
		if DoesBlipExist(blipRace[k]) then
			RemoveBlip(blipRace[k])
			blipRace[k] = nil
		end
	end
end ]]