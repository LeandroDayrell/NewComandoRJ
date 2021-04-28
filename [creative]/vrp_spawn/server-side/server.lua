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
Tunnel.bindInterface("vrp_spawn",cRP)


local webhooklinkCreatePersonagem = "https://discord.com/api/webhooks/836390575053602847/nVKJkT-RLJauPxRCwy8-Nw5hF-dzcQdpRlhpjWohHSlhYwrgRBjhi8P2vxzN0WeRgyKr"
local webhooklinkDeletePersonagem = "https://discord.com/api/webhooks/836391590280167424/LQRQlBNCAocdJp1oAusqCCYpk-PAV4XxM9jH0PmvdheOvqcjFPpsRqruC6nMtPkOZnZn"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETUPCHARS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.setupChars()
	local source = source
	local steam = vRP.getSteam(source)

	Citizen.Wait(1000)

	return getPlayerCharacters(steam)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETECHAR
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.deleteChar(id)
	local source = source
	local steam = vRP.getSteam(source)

	vRP.execute("vRP/remove_characters",{ id = parseInt(id) })
	SendWebhookMessage(webhooklinkDeletePersonagem,  "DELETED - UserID: [" ..id.."] Steam: " ..steam.. " . ")
	Citizen.Wait(1000)

	return getPlayerCharacters(steam)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARCHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
local spawnLogin = {}
RegisterServerEvent("vrp_spawn:charChosen")
AddEventHandler("vrp_spawn:charChosen",function(id)
	local source = source
	TriggerClientEvent("hudActived",source,true)
	TriggerEvent("baseModule:idLoaded",source,id,nil)

	if not spawnLogin[parseInt(id)] then
		spawnLogin[parseInt(id)] = true
		TriggerClientEvent("vrp_spawn:spawnChar",source,false)
	else
		TriggerClientEvent("vrp_spawn:spawnChar",source,true)
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATECHAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_spawn:createChar")
AddEventHandler("vrp_spawn:createChar",function(name,name2,sex)
	local source = source
	local steam = vRP.getSteam(source)
	local persons = getPlayerCharacters(steam)

	if not vRP.getPremium2(steam) and parseInt(#persons) >= 1 then
		TriggerClientEvent("Notify",source,"importante","Você atingiu o limite de personagens.",5000)
		TriggerClientEvent("vrp_spawn:maxChars",source)
		return
	end


	TriggerClientEvent("b2k-character:characterCreate",source,name,name2,sex)
	SendWebhookMessage(webhooklinkCreatePersonagem,  "Steam: [" ..steam.."] Name: " ..name.. " Sobrenome: " ..name2.. " Sexo: " ..sex.. " . ")
end)


function getPlayerCharacters(steam)
	return vRP.query("vRP/get_characters",{ steam = steam })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETPLAYERCHARACTERS
-----------------------------------------------------------------------------------------------------------------------------------------
function getPlayerCharacters(steam)
	return vRP.query("vRP/get_characters",{ steam = steam })
end