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
Tunnel.bindInterface("vrp_barbershop",cRP)
vSERVER = Tunnel.getInterface("vrp_barbershop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local cam = -1
local myClothes = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSkin",function(data)
	myClothes = {}
	myClothes = { tonumber(data.fathers), tonumber(data.kinship), tonumber(data.eyecolor), tonumber(data.skincolor), tonumber(data.acne), tonumber(data.stains), tonumber(data.freckles), tonumber(data.aging), tonumber(data.hair), tonumber(data.haircolor), tonumber(data.haircolor2), tonumber(data.makeup), tonumber(data.makeupintensity), tonumber(data.makeupcolor), tonumber(data.lipstick), tonumber(data.lipstickintensity), tonumber(data.lipstickcolor), tonumber(data.eyebrow), tonumber(data.eyebrowintensity), tonumber(data.eyebrowcolor), tonumber(data.beard), tonumber(data.beardintentisy), tonumber(data.beardcolor), tonumber(data.blush), tonumber(data.blushintentisy), tonumber(data.blushcolor) }

	if data.value then
		SetNuiFocus(false)
		displayBarbershop(false)
		vSERVER.updateSkin(myClothes,true)
		SendNUIMessage({ openBarbershop = false })
	end

	TriggerEvent("vrp_barbershop:setCustomization",myClothes,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATELEFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotate",function(data,cb)
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	if data == "left" then
		SetEntityHeading(ped,heading+10)
	elseif data == "right" then
		SetEntityHeading(ped,heading-10)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETCUSTOMIZATION
-----------------------------------------------------------------------------------------------------------------------------------------

function ll(n)
	n = n + 0.0
	return n
end

RegisterNetEvent("vrp_barbershop:setCustomization")
AddEventHandler("vrp_barbershop:setCustomization",function(status,bool)
	print(bool)
	myClothes = {}
	myClothes = { status[1], status[2], status[3], status[4], status[5], status[6], status[7], status[8], status[9], status[10], status[11], status[12], status[13], status[14], status[15], status[16], status[17], status[18], status[19], status[20], status[21], status[22], status[23], status[24], status[25], status[26],status[27], status[28], status[29], status[30], status[31], status[32], status[33], status[34], status[35], status[36], status[37], status[38], status[39], status[40], status[41], status[42], status[43], status[44], status[45], status[46], status[47], status[48], status[49] }
	local ped = PlayerPedId()

	

	SetPedComponentVariation(ped,2,status[9],0,2)

	SetPedHairColor(ped,status[10],status[11])

	SetPedHeadOverlay(ped,4,status[12],status[13]*0.1)
	SetPedHeadOverlayColor(ped,4,1,status[14],status[14])

	SetPedHeadOverlay(ped,8,status[15],status[16]*0.1)
	SetPedHeadOverlayColor(ped,8,1,status[17],status[17])

	SetPedHeadOverlay(ped,2,status[18],status[19]*0.1)
	SetPedHeadOverlayColor(ped,2,1,status[20],status[20])

	SetPedHeadOverlay(ped,1,status[21],status[22]*0.1)
	SetPedHeadOverlayColor(ped,1,1,status[23],status[23])

	SetPedHeadOverlay(ped,5,status[24],status[25]*0.1)
	SetPedHeadOverlayColor(ped,5,1,status[26],status[26])


	if not bool then

		SetPedHeadOverlay(ped,6,status[6],1.0)


		if status[7] == 0 then
			SetPedHeadOverlay(ped,9,status[7],0.0)
		else
			SetPedHeadOverlay(ped,9,status[7],1.0)
		end
	


		SetPedHeadOverlay(ped,3,status[8],1.0)


		if status[5] == 0 then
			print("colocando a acne")
			SetPedHeadOverlay(ped,0,status[5],0.0)
		else
			print("tirando a acne")
			SetPedHeadOverlay(ped,0,status[5],1.0)
		end


		-- Nariz
		SetPedFaceFeature(ped,0,ll(status[30]))
		SetPedFaceFeature(ped,1,ll(status[31]))
		SetPedFaceFeature(ped,2,ll(status[32]))
		SetPedFaceFeature(ped,3,ll(status[33]))
		SetPedFaceFeature(ped,4,ll(status[34]))
		SetPedFaceFeature(ped,5,ll(status[35]))

		-- Sombrancelha

		SetPedFaceFeature(ped,6,ll(status[28]))
		SetPedFaceFeature(ped,7,ll(status[29]))
		
		-- Bochechas
		SetPedFaceFeature(ped,8,ll(status[36]))
		SetPedFaceFeature(ped,9,ll(status[37]))
		SetPedFaceFeature(ped,10,ll(status[38]))

		-- Boca/Mandibula
		SetPedFaceFeature(ped,12,ll(status[49]))
		SetPedFaceFeature(ped,13,ll(status[39]))
		SetPedFaceFeature(ped,14,ll(status[40]))

		-- Queixo
		SetPedFaceFeature(ped,15,ll(status[41]))
		SetPedFaceFeature(ped,16,ll(status[42]))
		SetPedFaceFeature(ped,17,ll(status[43]))
		SetPedFaceFeature(ped,18,ll(status[44]))
		-- Pescoço
		SetPedFaceFeature(ped,19,ll(status[45]))

		-- Rosto
		Wait(5000)
		SetPedHeadBlendData(ped,status[1],status[2],0,status[4],0,0,status[27],0,0,false)
		SetPedEyeColor(ped,status[3])

	end

end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPLAYBARBERSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function displayBarbershop(enable)
	local ped = PlayerPedId()

	if enable then
		SetNuiFocus(true,true)
		SendNUIMessage({ openBarbershop = true, fathers = myClothes[1], kinship = myClothes[2], eyecolor = myClothes[3], skincolor = myClothes[4], acne = myClothes[5], stains = myClothes[6], freckles = myClothes[7], aging = myClothes[8], hair = myClothes[9], haircolor = myClothes[10], haircolor2 = myClothes[11], makeup = myClothes[12], makeupintensity = myClothes[13], makeupcolor = myClothes[14], lipstick = myClothes[15], lipstickintensity = myClothes[16], lipstickcolor = myClothes[17], eyebrow = myClothes[18], eyebrowintensity = myClothes[19], eyebrowcolor = myClothes[20], beard = myClothes[21], beardintentisy = myClothes[22], beardcolor = myClothes[23], blush = myClothes[24], blushintentisy = myClothes[25], blushcolor = myClothes[26] })

		FreezeEntityPosition(ped,true)

		if IsDisabledControlJustReleased(0,24) or IsDisabledControlJustReleased(0,142) then
			SendNUIMessage({ type = "click" })
		end

		SetPlayerInvincible(ped,false) -- mqcu

		if not DoesCamExist(cam) then
			cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
			SetCamCoord(cam,GetEntityCoords(ped))
			SetCamRot(cam,0.0,0.0,0.0)
			SetCamActive(cam,true)
			RenderScriptCams(true,false,0,true,true)
			SetCamCoord(cam,GetEntityCoords(ped))
		end

		local x,y,z = table.unpack(GetEntityCoords(ped))
		SetCamCoord(cam,x+0.2,y+0.5,z+0.7)
		SetCamRot(cam,0.0,0.0,150.0)
	else
		FreezeEntityPosition(ped,false)
		SetPlayerInvincible(ped,false)
		RenderScriptCams(false,false,0,1,0)
		DestroyCam(cam,false)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false)
	SendNUIMessage({ 
	openBarbershop = false 
	})
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCATIONS
-----------------------------------------------------------------------------------------------------------------------------------------
local locations = {
	{ -813.37,-183.85,37.57 },
	{ 138.13,-1706.46,29.3 },
	{ -1280.92,-1117.07,7.0 },
	{ 1930.54,3732.06,32.85 },
	{ 1214.2,-473.18,66.21 },
	{ -33.61,-154.52,57.08 },
	{ -276.65,6226.76,31.7 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for k,v in pairs(locations) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 2.5 then
					timeDistance = 4
					DrawText3D(v[1],v[2],v[3],"~g~E~w~   BARBEARIA")
					if IsControlJustPressed(1,38) and vSERVER.checkOpen() then
						displayBarbershop(true)
						SetEntityHeading(ped,332.21)
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
	local factor = (string.len(text)) / 400
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("syncarea")
AddEventHandler("syncarea",function(x,y,z,distance)
	ClearAreaOfVehicles(x,y,z,distance+0.0,false,false,false,false,false)
	ClearAreaOfEverything(x,y,z,distance+0.0,false,false,false,false)
end)


function f(n)
	n = n + 0.00000
	return n
end

local y = false
RegisterNetEvent("update:skin")
AddEventHandler("update:skin",function(data) ---
	Wait(6500)
	if data then
		SetPedHeadBlendData(PlayerPedId(),parseInt(data[1].fathers),parseInt(data[1].kinship),0,parseInt(data[1].skincolor),0,0,f(data[1].shapemix),0,0,false)
		if not y then
			TriggerServerEvent([[hairdebug]],true)
		end
		y = true
	end
end)


