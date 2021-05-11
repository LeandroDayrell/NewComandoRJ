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
Tunnel.bindInterface("vrp_survival",cRP)
vCLIENT = Tunnel.getInterface("vrp_survival")


-- TESTE DE SALVAR QUANDO CIDADAO MORRE

function cRP.saveBD()
	--local source = source
	--local user_id = vRP.getUserId(source)
	for k,v in pairs(vRP.user_tables) do
        vRP.execute("vRP/set_userdata",{ user_id = parseInt(k), key = "Datatable", value = json.encode(v) })
    end
end 

local webhooklinkGOD = "https://discord.com/api/webhooks/833842795189895228/EZEJOrfck35t_xvHhltEfjaaGqj3gHnAYS0NjGIZ54KIL2jJrlfcRvJyAepMa-yHrQmt"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("god",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"sup2000") then
			if args[1] then
				local nplayer = vRP.getUserSource(parseInt(args[1]))
				if nplayer then
					vCLIENT._revivePlayer(nplayer,200)
					vRP.upgradeThirst(parseInt(args[1]),100)
					vRP.upgradeHunger(parseInt(args[1]),100)
					vRP.downgradeStress(parseInt(args[1]),100)
					TriggerClientEvent("resetBleeding",nplayer) --
					TriggerClientEvent("resetDiagnostic",nplayer)
					SendWebhookMessage(webhooklinkGOD,  "UserID: [" ..user_id.."]  Usou God User_id "..nplayer..  "  .")
				end
			else
				vRP.upgradeThirst(user_id,100)
				vRP.upgradeHunger(user_id,100)
				vRPclient.setArmour(source,100)
				vRP.downgradeStress(user_id,100)
				vCLIENT._revivePlayer(source,200)
				SendWebhookMessage(webhooklinkGOD,  "UserID: [" ..user_id.."]  Usou God ")
				TriggerClientEvent("resetBleeding",source)
				TriggerClientEvent("resetDiagnostic",source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("upgradeStress")
AddEventHandler("upgradeStress",function(number)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.upgradeStress(user_id,parseInt(number))
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("re",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Paramedic") or vRP.hasPermission(user_id,"Police") then
			local nplayer = vRPclient.nearestPlayer(source,2)
			if nplayer then
				if vCLIENT.deadPlayer(nplayer) then
					TriggerClientEvent("Progress",source,10000)
					TriggerClientEvent("cancelando",source,true)
					vRPclient._playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)
					SetTimeout(10000,function()
						vRPclient._removeObjects(source)
						vCLIENT._revivePlayer(nplayer,110)
						TriggerClientEvent("resetBleeding",nplayer)
						TriggerClientEvent("cancelando",source,false)
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("gg",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vCLIENT.deadPlayer(source) then
			vCLIENT.finishDeath(source)
			TriggerClientEvent("resetHandcuff",source)
			TriggerClientEvent("resetBleeding",source)
			TriggerClientEvent("resetDiagnostic",source)
		end
	end
end)