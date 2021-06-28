--#----------------------------------------------------------------------------------------------------------------------------#--
--#--------------------------------------------------[ DEVELOPED BY PENGUIN ]--------------------------------------------------#--
--#-------------------------------------------------[ CONTATO: Penguinn#0001 ]-------------------------------------------------#--
--#---------------------------------------------[ START SHOP: discord.gg/p8cEuep ]---------------------------------------------#--
--#----------------------------------------------------------------------------------------------------------------------------#--
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

oC = Tunnel.getInterface("penguin_pecaarma")
-------------------------------------------------------------------------------------------------
--[ VARIÁVEIS ]----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
local menuactive = false
local onmenu = false
local blips = false
local servicofacil = false
local servicomediano = false
local servicodificil = false
local selecionado = 0
local processo = false
local segundos = 0
-------------------------------------------------------------------------------------------------
--[ LOCAL ]--------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
local PegarRota = {
	{ ['x'] = -643.35, ['y'] = -1227.86, ['z'] = 11.55 } -- -645.14,-1224.15,11.24
}

local locs = {
	[1] = { ['x'] = 57.75, ['y'] = -1483.87, ['z'] = 29.27},
	[2] = { ['x'] = 162.48, ['y'] = -1421.24, ['z'] = 29.25},
	[3] = { ['x'] = 491.26, ['y'] = -1271.15, ['z'] = 29.47},
	[4] = { ['x'] = 562.01, ['y'] = -1452.83, ['z'] = 29.51},
	[5] = { ['x'] = 722.59, ['y'] = -1070.48, ['z'] = 23.07},
	[6] = { ['x'] = 1164.34, ['y'] = -1485.19, ['z'] = 34.85},
	[7] = { ['x'] = 1215.36, ['y'] = -770.11, ['z'] = 57.83},
	[8] = { ['x'] = 1075.25, ['y'] = -680.29, ['z'] = 57.66},
	[9] = { ['x'] = 968.78, ['y'] = -308.15, ['z'] = 66.98},
	[10] = { ['x'] = 929.05, ['y'] = 47.79, ['z'] = 80.9},
	[11] = { ['x'] = 743.82, ['y'] = 223.34, ['z'] = 87.04},
	[12] = { ['x'] = 384.66, ['y'] = 428.0, ['z'] = 144.21},
	[13] = { ['x'] = 269.03, ['y'] = 325.19, ['z'] = 105.55},
	[14] = { ['x'] = -101.49, ['y'] = 429.75, ['z'] = 113.14},
	[15] = { ['x'] = -146.42, ['y'] = 230.15, ['z'] = 94.94},
	[16] = { ['x'] = -567.36, ['y'] = 274.73, ['z'] = 83.02},
	[17] = { ['x'] = -661.76, ['y'] = -219.56, ['z'] = 37.74},
	[18] = { ['x'] = -1084.96, ['y'] = -261.93, ['z'] = 37.79},
	[19] = { ['x'] = -1316.49, ['y'] = -393.29, ['z'] = 36.6},
	[20] = { ['x'] = -1387.93, ['y'] = -419.04, ['z'] = 36.63},
	[21] = { ['x'] = -1547.94, ['y'] = -435.22, ['z'] = 35.89},
	[22] = { ['x'] = -1664.9, ['y'] = -533.71, ['z'] = 35.55},
	[23] = { ['x'] = -1779.91, ['y'] = -428.05, ['z'] = 41.45},
	[24] = { ['x'] = -2002.14, ['y'] = -501.78, ['z'] = 11.51},
	[25] = { ['x'] = -1515.96, ['y'] = -920.31, ['z'] = 10.17},
	[26] = { ['x'] = -1351.55, ['y'] = -1128.94, ['z'] = 4.12},
	[27] = { ['x'] = -1210.85, ['y'] = -1383.67, ['z'] = 4.05},
	[28] = { ['x'] = -1195.35, ['y'] = -1542.59, ['z'] = 4.38},
	[29] = { ['x'] = -1014.69, ['y'] = -1515.41, ['z'] = 6.52},
	[30] = { ['x'] = -1038.33, ['y'] = -1398.09, ['z'] = 5.56},
	[31] = { ['x'] = -823.14, ['y'] = -1224.72, ['z'] = 7.34},
	[32] = { ['x'] = -663.58, ['y'] = -1217.26, ['z'] = 11.82},
	[33] = { ['x'] = -529.28, ['y'] = -1783.74, ['z'] = 21.57},
	[34] = { ['x'] = -342.19, ['y'] = -1484.51, ['z'] = 30.71},
	[35] = { ['x'] = 133.38, ['y'] = -2198.5, ['z'] = 6.18},
	[36] = { ['x'] = 265.04, ['y'] = -2507.43, ['z'] = 6.45},
	[37] = { ['x'] = 52.15, ['y'] = -2570.75, ['z'] = 6.01},
	[38] = { ['x'] = -261.7, ['y'] = -2655.4, ['z'] = 6.16},
	[39] = { ['x'] = 767.41, ['y'] = -2482.37, ['z'] = 20.19},
	[40] = { ['x'] = 795.47, ['y'] = -2971.45, ['z'] = 6.03},
	[41] = { ['x'] = 764.76, ['y'] = -3148.8, ['z'] = 5.91},
	[42] = { ['x'] = 568.97, ['y'] = -2753.89, ['z'] = 6.06},
	[43] = { ['x'] = 923.3, ['y'] = -2372.54, ['z'] = 30.51},
	[44] = { ['x'] = 988.69, ['y'] = -2422.48, ['z'] = 29.72},
	[45] = { ['x'] = 1049.18, ['y'] = -2426.67, ['z'] = 30.31},
	[46] = { ['x'] = 1010.49, ['y'] = -2038.33, ['z'] = 31.55},
	[47] = { ['x'] = 730.07, ['y'] = -1973.1, ['z'] = 29.3},
	[48] = { ['x'] = 847.98, ['y'] = -1316.58, ['z'] = 26.45},
	[49] = { ['x'] = 751.11, ['y'] = -1201.25, ['z'] = 24.29},
	[50] = { ['x'] = 722.59, ['y'] = -1070.48, ['z'] = 23.07},
	

	[51] = { ['x'] = 57.75, ['y'] = -1483.87, ['z'] = 29.27},
	[52] = { ['x'] = 162.48, ['y'] = -1421.24, ['z'] = 29.25},
	[53] = { ['x'] = 491.26, ['y'] = -1271.15, ['z'] = 29.47},
	[54] = { ['x'] = 562.01, ['y'] = -1452.83, ['z'] = 29.51},
	[55] = { ['x'] = 722.59, ['y'] = -1070.48, ['z'] = 23.07},
	[56] = { ['x'] = 1164.34, ['y'] = -1485.19, ['z'] = 34.85},
	[57] = { ['x'] = 1215.36, ['y'] = -770.11, ['z'] = 57.83},
	[58] = { ['x'] = 1075.25, ['y'] = -680.29, ['z'] = 57.66},
	[59] = { ['x'] = 968.78, ['y'] = -308.15, ['z'] = 66.98},
	[60] = { ['x'] = 929.05, ['y'] = 47.79, ['z'] = 80.9},
	[61] = { ['x'] = 743.82, ['y'] = 223.34, ['z'] = 87.04},
	[62] = { ['x'] = 384.66, ['y'] = 428.0, ['z'] = 144.21},
	[63] = { ['x'] = 269.03, ['y'] = 325.19, ['z'] = 105.55},
	[64] = { ['x'] = -101.49, ['y'] = 429.75, ['z'] = 113.14},
	[65] = { ['x'] = -146.42, ['y'] = 230.15, ['z'] = 94.94},
	[66] = { ['x'] = -567.36, ['y'] = 274.73, ['z'] = 83.02},
	[67] = { ['x'] = -661.76, ['y'] = -219.56, ['z'] = 37.74},
	[68] = { ['x'] = -1084.96, ['y'] = -261.93, ['z'] = 37.79},
	[69] = { ['x'] = -1316.49, ['y'] = -393.29, ['z'] = 36.6},
	[70] = { ['x'] = -1387.93, ['y'] = -419.04, ['z'] = 36.63},
	[71] = { ['x'] = -1547.94, ['y'] = -435.22, ['z'] = 35.89},
	[72] = { ['x'] = -1664.9, ['y'] = -533.71, ['z'] = 35.55},
	[73] = { ['x'] = -1779.91, ['y'] = -428.05, ['z'] = 41.45},
	[74] = { ['x'] = -2002.14, ['y'] = -501.78, ['z'] = 11.51},
	[75] = { ['x'] = -1515.96, ['y'] = -920.31, ['z'] = 10.17},
	[76] = { ['x'] = -1351.55, ['y'] = -1128.94, ['z'] = 4.12},
	[77] = { ['x'] = -1210.85, ['y'] = -1383.67, ['z'] = 4.05},
	[78] = { ['x'] = -1195.35, ['y'] = -1542.59, ['z'] = 4.38},
	[79] = { ['x'] = -1014.69, ['y'] = -1515.41, ['z'] = 6.52},
	[80] = { ['x'] = -1038.33, ['y'] = -1398.09, ['z'] = 5.56},
	[81] = { ['x'] = -823.14, ['y'] = -1224.72, ['z'] = 7.34},
	[82] = { ['x'] = -663.58, ['y'] = -1217.26, ['z'] = 11.82},
	[83] = { ['x'] = -529.28, ['y'] = -1783.74, ['z'] = 21.57},
	[84] = { ['x'] = -342.19, ['y'] = -1484.51, ['z'] = 30.71},
	[85] = { ['x'] = 133.38, ['y'] = -2198.5, ['z'] = 6.18},
	[86] = { ['x'] = 265.04, ['y'] = -2507.43, ['z'] = 6.45},
	[87] = { ['x'] = 52.15, ['y'] = -2570.75, ['z'] = 6.01},
	[88] = { ['x'] = -261.7, ['y'] = -2655.4, ['z'] = 6.16},
	[89] = { ['x'] = 767.41, ['y'] = -2482.37, ['z'] = 20.19},
	[90] = { ['x'] = 795.47, ['y'] = -2971.45, ['z'] = 6.03},
	[91] = { ['x'] = 764.76, ['y'] = -3148.8, ['z'] = 5.91},
	[92] = { ['x'] = 568.97, ['y'] = -2753.89, ['z'] = 6.06},
	[93] = { ['x'] = 923.3, ['y'] = -2372.54, ['z'] = 30.51},
	[94] = { ['x'] = 988.69, ['y'] = -2422.48, ['z'] = 29.72},
	[95] = { ['x'] = 1049.18, ['y'] = -2426.67, ['z'] = 30.31},
	[96] = { ['x'] = 1010.49, ['y'] = -2038.33, ['z'] = 31.55},
	[97] = { ['x'] = 730.07, ['y'] = -1973.1, ['z'] = 29.3},
	[98] = { ['x'] = 847.98, ['y'] = -1316.58, ['z'] = 26.45},
	[99] = { ['x'] = 751.11, ['y'] = -1201.25, ['z'] = 24.29},
	[100] = { ['x'] = 722.59, ['y'] = -1070.48, ['z'] = 23.07},
}
-------------------------------------------------------------------------------------------------
--[ MENU ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end
-------------------------------------------------------------------------------------------------
--[ BOTÕES ]-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "rota-facil" then
		TriggerServerEvent("rotas-pecas","facil")
		servicofacil = true
		selecionado = 1
		CriandoBlip(locs,selecionado)

	elseif data == "rota-mediana" then
		TriggerServerEvent("rotas-pecas","mediana")
		servicomediano = true
		selecionado = 1
		CriandoBlip(locs,selecionado)

	elseif data == "rota-dificil" then
		TriggerServerEvent("rotas-pecas","dificil")
		servicodificil = true
		selecionado = 1
		CriandoBlip(locs,selecionado)

	elseif data == "fechar" then
		ToggleActionMenu()
		onmenu = false
	end
end)

RegisterNetEvent("fechar-nui-farm")
AddEventHandler("fechar-nui-farm", function()
	ToggleActionMenu()
	onmenu = false
end)

RegisterCommand('fecharnui1',function()
	ToggleActionMenu()
	onmenu = false
end)
-------------------------------------------------------------------------------------------------
--[ AÇÃO ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local crjSleep = 500

		for k,v in pairs(PegarRota) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local PegarRota = PegarRota[k]

			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), PegarRota.x, PegarRota.y, PegarRota.z, true ) <= 1 and not onmenu and not servicodificil and not servicomediano and not servicofacil then
				crjSleep = 1
				DrawText3D(PegarRota.x, PegarRota.y, PegarRota.z, "[~r~E~w~] Para acessar as ~r~ROTAS DE PEÇAS DE ARMA~w~.")
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) and oC.checkPermissao() then
						ToggleActionMenu()
						onmenu = true
					end
				end
			end
		end
		Citizen.Wait(crjSleep)
	end
end)
-------------------------------------------------------------------------------------------------
--[ COLETAR PEÇAS ]------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

--[ ROTA FÁCIL ]------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 1000
		if servicofacil then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)
			
			if distance <= 3 then
				idle = 5
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
				if distance <= 1.2 then
					DrawText3D(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z, "[~r~E~w~] para coletar as ~r~PEÇAS DE ARMA~w~.")
					if IsControlJustPressed(0,38) and oC.checkPermissao() and not IsPedInAnyVehicle(ped) then
						--if oC.checkPaymentfacil() then
							local random = math.random(100)
							if random >= 98 then
								oC.callPolice(x,y,z)
							end
							TriggerEvent('cancelando',true)
							armas = CreateObject(GetHashKey("gr_prop_gr_crates_weapon_mix_01a"),locs[selecionado].x-1.0,locs[selecionado].y,locs[selecionado].z-1.1,true,true,true)
							RemoveBlip(blips)
							backentrega = selecionado
							processo = true
							segundos = 10
							local player = PlayerPedId()
							local coords = GetEntityCoords(player)
							local cash_hash = GetHashKey("w_ar_assaultrifle")
							--loadModel(cash_hash)
							--RequestAnimDict('anim@heists@ornate_bank@grab_cash')
							vRP._playAnim(false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
							local bagHash2 = GetHashKey('p_ld_heist_bag_s_pro_o')
							--loadModel(bagHash2)
							local bagProp2 = CreateObject(bagHash2, coords, true, false)
							local bagIndex2 = GetPedBoneIndex(PlayerPedId(), 57005)
							local arma = CreateObject(cash_hash, coords, true, false)
							local armamao = GetPedBoneIndex(PlayerPedId(), 18905)
							SetEntityAsMissionEntity(bagProp2, true, true)
							SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
							AttachEntityToEntity(bagProp2, PlayerPedId(), bagIndex2, 0.3, -0.25, -0.3, 300.0, 200.0, 300.0, true, true, false, true, 1, true)
							AttachEntityToEntity(arma, PlayerPedId(), armamao, 0.125, 0.0, 0.05, 5.0, 150.0, 300.0, true, true, false, true, 1, true)
						
							SetTimeout(2000,function()
								vRP._stopAnim(false)
							end)
							SetTimeout(2000,function()
								vRP._playAnim(false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
							end)

							SetTimeout(10000,function()
								oC.checkPaymentfacil()
								ClearPedTasks(PlayerPedId())
								DeleteObject(armas)
								DeleteEntity(cashPile2)
								DeleteEntity(bagProp2)
								DeleteEntity(arma)
								DeleteObject(bagIndex2)
								SetPedComponentVariation(PlayerPedId(), 5, 92, 0, 0)
								ClearPedTasks(player)
								vRP._stopAnim(false)
							end)

							while true do
								if backentrega == selecionado then
									selecionado = selecionado + 1
								else
									break
								end
								Citizen.Wait(1)
							end
							CriandoBlip(locs,selecionado)
						--end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ ROTA MEDIANA ]------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 1500
		if servicomediano then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			--local coords = GetEntityCoords(ped)
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)
			
			if distance <= 3 then
				idle = 5
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
				if distance <= 1.2 then
					DrawText3D(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z, "[~r~E~w~] para coletar as ~r~PEÇAS DE ARMA~w~.")
					if IsControlJustPressed(0,38) and oC.checkPermissao() and not IsPedInAnyVehicle(ped) then
						--if oC.checkPaymentmediano() then
							local random = math.random(100)
							if random >= 95 then
								oC.callPolice(x,y,z)
							end
							TriggerEvent('cancelando',true)
							armas = CreateObject(GetHashKey("gr_prop_gr_crates_weapon_mix_01a"),locs[selecionado].x-1.0,locs[selecionado].y,locs[selecionado].z-1.1,true,true,true)
							RemoveBlip(blips)
							backentrega = selecionado
							processo = true
							segundos = 15
							local player = PlayerPedId()
							local coords = GetEntityCoords(player)
							local cash_hash = GetHashKey("w_ar_assaultrifle")
							--loadModel(cash_hash)
							--RequestAnimDict('anim@heists@ornate_bank@grab_cash')
							vRP._playAnim(false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
							local bagHash2 = GetHashKey('p_ld_heist_bag_s_pro_o')
							--loadModel(bagHash2)
							local bagProp2 = CreateObject(bagHash2, coords, true, false)
							local bagIndex2 = GetPedBoneIndex(PlayerPedId(), 57005)
							local arma = CreateObject(cash_hash, coords, true, false)
							local armamao = GetPedBoneIndex(PlayerPedId(), 18905)
							SetEntityAsMissionEntity(bagProp2, true, true)
							SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
							AttachEntityToEntity(bagProp2, PlayerPedId(), bagIndex2, 0.3, -0.25, -0.3, 300.0, 200.0, 300.0, true, true, false, true, 1, true)
							AttachEntityToEntity(arma, PlayerPedId(), armamao, 0.125, 0.0, 0.05, 5.0, 150.0, 300.0, true, true, false, true, 1, true)
						
							SetTimeout(2000,function()
								vRP._stopAnim(false)
							end)
							SetTimeout(2000,function()
								vRP._playAnim(false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
							end)

							SetTimeout(15000,function()
								oC.checkPaymentmediano()
								ClearPedTasks(PlayerPedId())
								DeleteObject(armas)
								DeleteEntity(cashPile2)
								DeleteEntity(bagProp2)
								DeleteEntity(arma)
								DeleteObject(bagIndex2)
								SetPedComponentVariation(PlayerPedId(), 5, 40, 0, 0)
								ClearPedTasks(player)
								vRP._stopAnim(false)
							end)

							while true do
								if backentrega == selecionado then
									selecionado = selecionado + 1
								else
									break
								end
								Citizen.Wait(1)
							end
							CriandoBlip(locs,selecionado)
						--end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ ROTA DIFÍCIL ]------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 2000
		if servicodificil then
			local ped = PlayerPedId()
			--local coords = GetEntityCoords(ped)
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)
			
			if distance <= 3 then
				idle = 5
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
				if distance <= 3 then
					DrawText3D(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z, "[~r~E~w~] para coletar as ~r~PEÇAS DE ARMA~w~.")
					if IsControlJustPressed(0,38) and oC.checkPermissao() and not IsPedInAnyVehicle(ped) then
						--if oC.checkPaymentdificil() then
							local random = math.random(100)
							if random >= 1 then
								oC.callPolice(x,y,z)
							end
							TriggerEvent('cancelando',true)
							armas = CreateObject(GetHashKey("gr_prop_gr_crates_weapon_mix_01a"),locs[selecionado].x-1.0,locs[selecionado].y,locs[selecionado].z-1.1,true,true,true)
							RemoveBlip(blips)
							backentrega = selecionado
							processo = true
							segundos = 20
							local player = PlayerPedId()
							local coords = GetEntityCoords(player)
							local cash_hash = GetHashKey("w_ar_assaultrifle")
							--loadModel(cash_hash)
							--RequestAnimDict('anim@heists@ornate_bank@grab_cash')
							--vRP._playAnim(false,{{'anim@heists@ornate_bank@grab_cash','intro'}},true)
							vRP._playAnim(false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
							local bagHash2 = GetHashKey('p_ld_heist_bag_s_pro_o')
							--loadModel(bagHash2)
							local bagProp2 = CreateObject(bagHash2, coords, true, false)
							local bagIndex2 = GetPedBoneIndex(PlayerPedId(), 57005)
							local arma = CreateObject(cash_hash, coords, true, false)
							local armamao = GetPedBoneIndex(PlayerPedId(), 18905)
							SetEntityAsMissionEntity(bagProp2, true, true)
							SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
							AttachEntityToEntity(bagProp2, PlayerPedId(), bagIndex2, 0.3, -0.25, -0.3, 300.0, 200.0, 300.0, true, true, false, true, 1, true)
							AttachEntityToEntity(arma, PlayerPedId(), armamao, 0.125, 0.0, 0.05, 5.0, 150.0, 300.0, true, true, false, true, 1, true)
						
							SetTimeout(2000,function()
								vRP._stopAnim(false)
							end)
							SetTimeout(2000,function()
								--vRP._playAnim(false,{{'anim@heists@ornate_bank@grab_cash','grab'}},true)
								vRP._playAnim(false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
							end)

							SetTimeout(20000,function()
								oC.checkPaymentdificil()
								ClearPedTasks(PlayerPedId())
								DeleteObject(armas)
								DeleteEntity(cashPile2)
								DeleteEntity(bagProp2)
								DeleteEntity(arma)
								DeleteObject(bagIndex2)
								SetPedComponentVariation(PlayerPedId(), 5, 40, 0, 0)
								ClearPedTasks(player)
								vRP._stopAnim(false)
							end)

							while true do
								if backentrega == selecionado then
									selecionado = selecionado + 1
								else
									break
								end
								Citizen.Wait(1)
							end
							CriandoBlip(locs,selecionado)
						--end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)
-------------------------------------------------------------------------------------------------
--[ SAIR DE SERVIÇO ]----------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if servicofacil or servicomediano or servicodificil then
			if IsControlJustPressed(0,168) then
				local ped = PlayerPedId()
				servicofacil = false
				servicomediano = false
				servicodificil = false
				RemoveBlip(blips)
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
				SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
			end
		end
	end
end)
-------------------------------------------------------------------------------------------------
--[ TIMER ]--------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
			end
		end
	end
end)
-------------------------------------------------------------------------------------------------
--[ FUNÇÕES ]------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    --DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end

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

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coletar Peças de Armas")
	EndTextCommandSetBlipName(blips)
end