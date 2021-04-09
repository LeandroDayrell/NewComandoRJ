-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- MESSAGEENTERED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("_chat:messageEntered")
AddEventHandler("_chat:messageEntered",function(author,color,message)
	local source = source
	if not message or not author then
		return
	end

	if not WasEventCanceled() then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if identity then
			TriggerClientEvent("chatMessage",source,identity.name.." "..identity.name2,{100,100,100},"^3"..message)

			local players = vRPclient.nearestPlayers(source,10)
			for k,v in pairs(players) do
				async(function()
					TriggerClientEvent("chatMessage",k,identity.name.." "..identity.name2,{100,100,100},"^3"..message)
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMMANDFALLBACK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("__cfx_internal:commandFallback")
AddEventHandler("__cfx_internal:commandFallback",function(command)
	local name = GetPlayerName(source)
	if not command or not name then
		return
	end

	if not WasEventCanceled() then
		TriggerClientEvent("Notify",source,"importante","Comando não encontrado.",5000)
	end
	CancelEvent()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONSOLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("console",function(source,args,rawCommand)
	if source == 0 then
		TriggerClientEvent("Notify",-1,"negado",rawCommand:sub(9).."<br><b>Mensagem enviada por:</b> Governador",60000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICKALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kickall",function(source,args,rawCommand)
	if source == 0 then
		local users = vRP.getUsers()
		for k,v in pairs(users) do
			vRP.kick(parseInt(k),"You have been disconnected, a city restarted.")
		end
		TriggerEvent("vrp_admin:KickAll")
	end
end)