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
	[37] = { ["x"] = 96.09197, ["y"] = -1284.854, ["z"] = 29.43878, ["hash"] = 668467214, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Unktec", ["sound"] = true }
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