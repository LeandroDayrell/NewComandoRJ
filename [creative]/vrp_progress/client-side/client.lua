RegisterNetEvent("Progress")
AddEventHandler("Progress",function(time)
	if GetPedArmour(PlayerPedId()) > 0 then
		SendNUIMessage({ time = tonumber(time-500), px = "267px" })
	else
		SendNUIMessage({ time = tonumber(time-500), px = "218px" })
	end
end)