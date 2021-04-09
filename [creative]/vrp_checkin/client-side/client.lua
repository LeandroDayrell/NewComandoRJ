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
Tunnel.bindInterface("vrp_checkin",cRP)
vSERVER = Tunnel.getInterface("vrp_checkin")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKIN
-----------------------------------------------------------------------------------------------------------------------------------------
local checkIn = {
	{ -435.91,-326.01,34.92,"Santos" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BEDSIN
-----------------------------------------------------------------------------------------------------------------------------------------
local bedsIn = {
	["Santos"] = {
		{ -450.29,-311.04,35.83 },
		{ -448.93,-303.38,35.82 },
		{ -445.47,-307.42,35.83 },
		{ -455.02,-286.52,35.83 },
		{ -451.62,-284.96,35.83 },
		{ -448.41,-283.76,35.83 },
		{ -460.25,-288.74,35.83 },
		{ -460.31,-288.59,35.83 },
		{ -463.53,-290.13,35.83 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCHECKIN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for _,v in pairs(checkIn) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 3 then
					timeDistance = 4
					DrawText3D(v[1],v[2],v[3]-1,"~g~E~w~   ATENDIMENTO")
					if distance <= 1.5 and IsControlJustPressed(1,38) and vSERVER.checkServices() then
						local checkBusy = 0
						local checkSelected = v[4]

						for _,v in pairs(bedsIn[checkSelected]) do
							checkBusy = checkBusy + 1

							local checkPos = nearestPlayer(v[1],v[2],v[3])
							if checkPos == nil then
								if vSERVER.paymentCheckin() then
									SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true)

									if GetEntityHealth(ped) <= 101 then
										TriggerEvent("vrp_survival:CheckIn")
									end

									DoScreenFadeOut(1000)
									Citizen.Wait(1000)

									SetEntityCoords(ped,v[1],v[2],v[3])

									Citizen.Wait(500)
									TriggerEvent("emotes","checkin")

									Citizen.Wait(5000)
									DoScreenFadeIn(1000)
								end

								break
							end
						end

						if checkBusy >= #bedsIn[checkSelected] then
							TriggerEvent("Notify","importante","Todas as macas estão ocupadas, aguarde.",5000)
						end
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/350
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NEARESTPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
function nearestPlayers(x2,y2,z2)
	local r = {}
	local players = vRP.getPlayers()
	for k,v in pairs(players) do
		local player = GetPlayerFromServerId(k)
		if player ~= PlayerId() and NetworkIsPlayerConnected(player) then
			local oped = GetPlayerPed(player)
			local coords = GetEntityCoords(oped)
			local distance = #(coords - vector3(x2,y2,z2))
			if distance <= 2 then
				r[GetPlayerServerId(player)] = distance
			end
		end
	end
	return r
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NEARESTPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
function nearestPlayer(x,y,z)
	local p = nil
	local players = nearestPlayers(x,y,z)
	local min = 2.0001
	for k,v in pairs(players) do
		if v < min then
			min = v
			p = k
		end
	end
	return p
end