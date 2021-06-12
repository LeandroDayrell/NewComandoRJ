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
Tunnel.bindInterface("vrp_rotasamu",cRP)
vSERVER = Tunnel.getInterface("vrp_rotasamu")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local inRace = false
local startX = -492.92
local startY = -342.0
local startZ = 34.37
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
		{ -468.12,-376.54,33.25 },
		{ -212.5,-888.88,28.62 },
		{ -862.96,-1167.34,4.65 },
		{ -1174.89,-1772.43,3.03 },
		{ -626.52,-959.58,20.61 },
		{ 315.28,-1446.43,28.98 },
		{ 1199.11,-1453.32,34.17 },
		{ 1368.56,-584.14,73.56 },
		{ 660.28,-20.64,81.81 },
		{ 290.19,-589.03,42.36 },
		{ 220.0,-1633.32,28.34 },
		{ -1052.75,-884.35,4.14 },
	},
	[2] = {
		{ -468.12,-376.54,33.25 },
		{ -212.5,-888.88,28.62 },
		{ -862.96,-1167.34,4.65 },
		{ -1174.89,-1772.43,3.03 },
		{ -626.52,-959.58,20.61 },
		{ 315.28,-1446.43,28.98 },
		{ 1199.11,-1453.32,34.17 },
		{ 1368.56,-584.14,73.56 },
		{ 660.28,-20.64,81.81 },
		{ 290.19,-589.03,42.36 },
		{ 220.0,-1633.32,28.34 },
		{ -1052.75,-884.35,4.14 },
	},
	[3] = {
		{ -468.12,-376.54,33.25 },
		{ -212.5,-888.88,28.62 },
		{ -862.96,-1167.34,4.65 },
		{ -1174.89,-1772.43,3.03 },
		{ -626.52,-959.58,20.61 },
		{ 315.28,-1446.43,28.98 },
		{ 1199.11,-1453.32,34.17 },
		{ 1368.56,-584.14,73.56 },
		{ 660.28,-20.64,81.81 },
		{ 290.19,-589.03,42.36 },
		{ 220.0,-1633.32,28.34 },
		{ -1052.75,-884.35,4.14 },
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
								vSERVER.pagamentoParamedic()
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