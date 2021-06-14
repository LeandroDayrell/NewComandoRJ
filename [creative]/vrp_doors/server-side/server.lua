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
Tunnel.bindInterface("vrp_doors",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
local doors = {
	[1] = { ["x"] = 2518.479, ["y"] = -327.7718, ["z"] = 102.059, ["hash"] = -825682688, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[2] = { ["x"] = 2524.155, ["y"] = -334.9459, ["z"] = 102.0571, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[3] = { ["x"] = 2509.618, ["y"] = -351.0732, ["z"] = 105.8514, ["hash"] = 395979613, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[4] = { ["x"] = 2514.742, ["y"] = -331.5074, ["z"] = 102.059, ["hash"] = -825682688, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[5] = { ["x"] = 2506.877, ["y"] = -348.1537, ["z"] = 105.8514, ["hash"] = 395979613, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[6] = { ["x"] = 2504.244, ["y"] = -350.9377, ["z"] = 105.8514, ["hash"] = 395979613, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[7] = { ["x"] = 2507.034, ["y"] = -353.6587, ["z"] = 105.8514, ["hash"] = 395979613, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[8] = { ["x"] = 2567.535, ["y"] = -326.193, ["z"] = 91.92173, ["hash"] = 1185512375, ["lock"] = true, ["text"] = true, ["distance"] = 30, ["press"] = 10.0, ["perm"] = "Police", ["sound"] = true },
	[9] = { ["x"] = 2507.521, ["y"] = -325.9502, ["z"] = 91.9186, ["hash"] = 1185512375, ["lock"] = true, ["text"] = true, ["distance"] = 30, ["press"] = 10.0, ["perm"] = "Police", ["sound"] = true },
	[10] = { ["x"] = 443.4078, ["y"] = -989.4454, ["z"] = 30.8393, ["hash"] = 185711165, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[11] = { ["x"] = 446.0079, ["y"] = -989.4454, ["z"] = 30.8393, ["hash"] = 185711165, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[12] = { ["x"] = 464.5701, ["y"] = -992.6641, ["z"] = 25.06443, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[13] = { ["x"] = 469.9679, ["y"] = -1014.452, ["z"] = 26.53623, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[14] = { ["x"] = 467.3716, ["y"] = -1014.452, ["z"] = 2653623, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[15] = { ["x"] = 461.8065, ["y"] = -1001.302, ["z"] = 25.06443, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[16] = { ["x"] = 461.8065, ["y"] = -997-6583, ["z"] = 25.06443, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[17] = { ["x"] = 461.8065, ["y"] = -994.4086, ["z"] = 25.06443, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[18] = { ["x"] = 452.6248, ["y"] = -987.3626, ["z"] = 30.8393, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[19] = { ["x"] = 446.9178, ["y"] = -974.6879, ["z"] = 30.43864, ["hash"] = -1524180747, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[20] = { ["x"] = 453.0793, ["y"] = -983.1895, ["z"] = 30.83926, ["hash"] = 749848321, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },



--[[ 	[1] = { ["x"] = 440.5201, ["y"] = -986.2335, ["z"] = 30.82319, ["hash"] = -96679321, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[2] = { ["x"] = 440.5201, ["y"] = -977.6011, ["z"] = 30.82319, ["hash"] = -1406685646, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[3] = { ["x"] = 455.8862, ["y"] = -972.2543, ["z"] = 30.81531, ["hash"] = -1547307588, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[4] = { ["x"] = 458.2087, ["y"] = -972.2543, ["z"] = 30.81531, ["hash"] = -1547307588, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[5] = { ["x"] = 458.6543, ["y"] = -990.6498, ["z"] = 30.82319, ["hash"] = -96679321, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[6] = { ["x"] = 443.0618, ["y"] = -998.7462, ["z"] = 30.8153, ["hash"] = -1547307588, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[7] = { ["x"] = 440.7392, ["y"] = -998.7462, ["z"] = 30.8153, ["hash"] = -1547307588, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[8] = { ["x"] = 479.7507, ["y"] = -999.629, ["z"] = 30.78917, ["hash"] = -692649124, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[9] = { ["x"] = 487.4378, ["y"] = -1000.189, ["z"] = 30.78697, ["hash"] = -692649124, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[10] = { ["x"] = 482.6701, ["y"] = -987.5093, ["z"] = 26.40548, ["hash"] = 1830360419, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[11] = { ["x"] = 464.1591, ["y"] = -974.6656, ["z"] = 26.3707, ["hash"] = 1830360419, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[12] = { ["x"] = 482.6701, ["y"] = -987.5792, ["z"] = 26.40548, ["hash"] = -1406685646, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[13] = { ["x"] = 482.6703, ["y"] = -995.7285, ["z"] = 26.40548, ["hash"] = -1406685646, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[14] = { ["x"] = 484.1764, ["y"] = -1007.734, ["z"] = 26.48005, ["hash"] = -53345114, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[15] = { ["x"] = 486.9131, ["y"] = -1012.189, ["z"] = 26.48005, ["hash"] = -53345114, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[16] = { ["x"] = 483.9127, ["y"] = -1012.189, ["z"] = 26.48005, ["hash"] = -53345114, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[17] = { ["x"] = 480.9128, ["y"] = -1012.189, ["z"] = 26.48005, ["hash"] = -53345114, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[18] = { ["x"] = 477.9126, ["y"] = -1012.189, ["z"] = 26.48005, ["hash"] = -53345114, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[19] = { ["x"] = 469.7743, ["y"] = -1014.406, ["z"] = 26.48382, ["hash"] = -692649124, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[20] = { ["x"] = 467.3686, ["y"] = -1014.406, ["z"] = 26.48382, ["hash"] = -692649124, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[21] = { ["x"] = 464.1591, ["y"] = -974.6656, ["z"] = 26.3707, ["hash"] = 1830360419, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[22] = { ["x"] = 464.3086, ["y"] = -984.5284, ["z"] = 43.77124, ["hash"] = -692649124, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[23] = { ["x"] = 452.3005, ["y"] = -1000.783, ["z"] = 26.74, ["hash"] = 2130672747, ["lock"] = true, ["text"] = true, ["distance"] = 50, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[24] = { ["x"] = 431.4119, ["y"] = -1000.782, ["z"] = 26.74032, ["hash"] = 2130672747, ["lock"] = true, ["text"] = true, ["distance"] = 50, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true }, ]]



	[25] = { ["x"] = -630.81, ["y"] = -237.96, ["z"] = 38.1, ["hash"] = 9467943, ["lock"] = true, ["text"] = false, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Admin", ["other"] = 18 },
	[26] = { ["x"] = -631.62, ["y"] = -236.92, ["z"] = 38.06, ["hash"] = 1425919976, ["lock"] = true, ["text"] = false, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Admin", ["other"] = 17 },
	[27] = { ["x"] = -14.14, ["y"] = -1441.17, ["z"] = 31.11, ["hash"] = 520341586, ["lock"] = true, ["text"] = false, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Admin" },
	[28] = { ["x"] = 981.72, ["y"] = -102.78, ["z"] = 74.85, ["hash"] = 190770132, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "TheLost" },
	[29] = { ["x"] = 1846.049, ["y"] = 2604.733, ["z"] = 45.579, ["hash"] = 741314661, ["lock"] = true, ["text"] = true, ["distance"] = 30, ["press"] = 10.0, ["perm"] = "Police" },
	[30] = { ["x"] = 1819.475, ["y"] = 2604.743, ["z"] = 45.577, ["hash"] = 741314661, ["lock"] = true, ["text"] = true, ["distance"] = 30, ["press"] = 10.0, ["perm"] = "Police" },
	--[31] = { ["x"] = 488.89, ["y"] = -1017.49, ["z"] = 28.15, ["hash"] = 2691149580, ["lock"] = true, ["text"] = true, ["distance"] = 30, ["press"] = 7.5, ["perm"] = "Police" },
	[32] = { ["x"] = 1274.47, ["y"] = -1720.43, ["z"] = 54.76, ["hash"] = 1145337974, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Mafia", ["sound"] = true },
	--[33] = { ["x"] = 488.89, ["y"] = -1017.21, ["z"] = 27.14, ["hash"] = -1603817716, ["lock"] = true, ["text"] = true, ["distance"] = 30, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[34] = { ["x"] = -442.58, ["y"] = -317.05, ["z"] = 35.06, ["hash"] = 493136920, ["lock"] = true, ["text"] = true, ["distance"] = 30, ["press"] = 1.5, ["perm"] = "Paramedic", ["sound"] = true },
	[35] = { ["x"] = 113.9822, ["y"] = -1297.43, ["z"] = 29.41868, ["hash"] = -495720969, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Unktec", ["sound"] = true },
	[36] = { ["x"] = 127.9552, ["y"] = -1298.503, ["z"] = 29.41962, ["hash"] = -1116041313, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Unktec", ["sound"] = true },
	[37] = { ["x"] = 96.09197, ["y"] = -1284.854, ["z"] = 29.43878, ["hash"] = 668467214, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Unktec", ["sound"] = true },


	--bau de evidencia DP 
	[38] = { ["x"] = -1077.576, ["y"] = -1077.576, ["z"] = 11.1824, ["hash"] = -1255368438, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[39] = { ["x"] = -1079.627, ["y"] = -826.2534, ["z"] = 11.18247, ["hash"] = -1255368438, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	--CELAS: 
	--[40] = { ["x"] = -1073.581, ["y"] = -824.695, ["z"] = 5.63, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[41] = { ["x"] = -1085.826, ["y"] = -827.838, ["z"] = 5.63, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[42] = { ["x"] = -1088.231, ["y"] = -824.772, ["z"] = 5.63, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[43] = { ["x"] = -1090.64, ["y"] = -821.627, ["z"] = 5.63, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[44] = { ["x"] = -1095.957, ["y"] = -820.7254, ["z"] = 5.63, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[45] = { ["x"] = -1093.552, ["y"] = -823.858, ["z"] = 5.63, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[46] = { ["x"] = -1091.14, ["y"] = -827.0005, ["z"] = 5.63, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[47] = { ["x"] = -1088.797, ["y"] = -830.2533, ["z"] = 5.63, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[48] = { ["x"] = -1087.752, ["y"] = -829.8747, ["z"] = 5.63, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[49] = { ["x"] = -1094.097, ["y"] = -816.2119, ["z"] = 5.63, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	--[50] = { ["x"] = -1092.52, ["y"] = -816.274, ["z"] = 5.63, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	
	-- PORTAO DE FORA 
	[51] = { ["x"] = -1053.862, ["y"] = -873.1184, ["z"] = 4.1154, ["hash"] = -655468553, ["lock"] = false, ["text"] = true, ["distance"] = 30, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
--SALA DE INTERROGATÓRIO 1
	[52] = { ["x"] = -1082.152, ["y"] = -816.3433, ["z"] = 5.63, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
--SALA DE INTERROGATÓRIO 2
	[53] = { ["x"] = -1078.526, ["y"] = -813.5617, ["z"] = 5.63, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	--ENTRA PORTA EXTERNA SALA DE CELAS
	[54] = { ["x"] = -1058.823, ["y"] = -840.6878, ["z"] = 5.30, ["hash"] = -2023754432, ["lock"] = false, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	--VESTIÁRIO/ARMAMENTOS PM
	[55] = { ["x"] = -1095.494, ["y"] = -835.790, ["z"] = 14.438, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	-- PM salas
	[56] = { ["x"] = -1094.98, ["y"] = -831.95, ["z"] = 29.77, ["hash"] = 82208503, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[57] = { ["x"] = -1093.459, ["y"] = -829.228, ["z"] = 30.29, ["hash"] = 82208503, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
-- PC salas
	[58] = { ["x"] = -1095.436, ["y"] = -831.3587, ["z"] = 33.43667, ["hash"] = 1630449945, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[59] = { ["x"] = -1092.133, ["y"] = -831.6409, ["z"] = 30.29, ["hash"] = 1040280251, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
-- vestiario pc
	[60] = { ["x"] = -1092.116, ["y"] = -823.1597, ["z"] = 27.19311, ["hash"] = -1255368438, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[61] = { ["x"] = -1094.672, ["y"] = -822.8296, ["z"] = 27.19311, ["hash"] = -1255368438, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[62] = { ["x"] = -1093.78, ["y"] = -830.1746, ["z"] = 27.97893, ["hash"] = -1484849745, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },

	[63] = { ["x"] = -1073.581, ["y"] = -827.4854, ["z"] = 5.630564, ["hash"] = 631614199, ["lock"] = false, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },
	[64] = { ["x"] = -1056.756, ["y"] = -839.1153, ["z"] = 5.303782, ["hash"] = -2023754432, ["lock"] = false, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },

	[65] = { ["x"] = -1064.313, ["y"] = -879.4052, ["z"] = 4.0932, ["hash"] = 569833973, ["lock"] = false, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Police", ["sound"] = true },


}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSSTATISTICS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.doorsStatistics(doorNumber,doorStatus)
	local source = source

	doors[parseInt(doorNumber)].lock = doorStatus

	if doors[parseInt(doorNumber)].other ~= nil then
		local doorSecond = doors[parseInt(doorNumber)].other
		doors[doorSecond].lock = doorStatus
	end

	TriggerClientEvent("vrp_doors:doorsUpdate",-1,doors)

	if doors[parseInt(doorNumber)].sound then
		TriggerClientEvent("vrp_sound:source",source,"doorlock",0.1)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSSTATISTICS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_doors:doorsStatistics")
AddEventHandler("vrp_doors:doorsStatistics",function(doorNumber,doorStatus)
	doors[parseInt(doorNumber)].lock = doorStatus

	if doors[parseInt(doorNumber)].other ~= nil then
		local doorSecond = doors[parseInt(doorNumber)].other
		doors[doorSecond].lock = doorStatus
	end

	TriggerClientEvent("vrp_doors:doorsUpdate",-1,doors)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.doorsPermission(doorNumber)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if doors[parseInt(doorNumber)].perm ~= nil then
			if vRP.hasPermission(user_id,doors[parseInt(doorNumber)].perm) then
				return true
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	TriggerClientEvent("vrp_doors:doorsUpdate",source,doors)
end)

-- Citizen.CreateThread(function()
-- 	Citizen.Wait(1000)
-- 	TriggerClientEvent("vrp_doors:doorsUpdate",-1,doors)
-- end)