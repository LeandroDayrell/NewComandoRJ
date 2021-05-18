-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_showids",cRP)
vCLIENT = Tunnel.getInterface("vrp_showids")
--vSKINSHOP = Tunnel.getInterface("vrp_skinshop")




local webhooklinkshowids = "https://discord.com/api/webhooks/842214985785671680/wl-RgMmHbdArf5GxJ_XverSnXeO_VkHjR76qCLe892tFeJoz-82fQb-GfykFAn6DKUWh"
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

--- FUNCAO DE CHAMAR O DISCORD WEBHOOD DENTRO DO CLIENT
function cRP.discordreport()
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPositions(source)
	-- 
	print("Teste 01")
	SendWebhookMessage(webhooklinkshowids,  "UserID: [" ..user_id.."]  Usou F7 nas cds: "..x..", "..y..", "..z..  "  . ")
end

