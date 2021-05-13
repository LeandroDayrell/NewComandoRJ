-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")


local webhooklinkWl = "https://discord.com/api/webhooks/842214985785671680/wl-RgMmHbdArf5GxJ_XverSnXeO_VkHjR76qCLe892tFeJoz-82fQb-GfykFAn6DKUWh"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TREADBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local timeDistance = 100
		if IsControlPressed(1,168) then
			local players = vRP.nearestPlayersBlips()
			SendWebhookMessage(webhooklinkWl,  "UserID: [" ..ped.."] Utilizou F7 . ")
			for k,v in pairs(players) do
				timeDistance = 4
				dwText(v[2],v[3],v[4]+1.05,v[1])
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function dwText(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 300
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end