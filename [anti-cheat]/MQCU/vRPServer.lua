Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")

-------LOG BANIMENTOS--------
ac_webhook_anthack = "https://discord.com/api/webhooks/813573975179264010/XKHE34_tVoZRGKnR8jPzQM1T5v8EFTdO0w7Ifos_apGVmxDFqd-eInhMghR3TQahAlSl"
-----------------------------

-------LOG SUSPEITOS---------
ac_webhook_suspeitos = "https://discord.com/api/webhooks/813574042777813023/3pW_UZBy-GjE1C84qbZN23UDSmUNVfJQ_U9tBzYPfYAY5UAGjZ70qkJdedORFIgDFaeU"	
-----------------------------

-------LOG COMANDOS----------
ac_webhook_logstaff = "https://discord.com/api/webhooks/813574185736863764/iTxhxz8CkAa6B_MLqlIYGbrqx9DeL67isBlo7sY5pX9CS84YqVLG7nIwEyEbEn9nXQ7w"
-----------------------------

-------------------------------
-------GETHACK PARAMETROS------
local banir_blacklisted = false
local minimo_bans = 5
local excecao = {}
excecao[1]=true
--oque fica entre os [] é o id de quem não deve ser banido por mais q tenha ultrapassado o limite de bans
------------------------------
Citizen.CreateThread(function()function SendWebhookMessage(webhook,message)	if webhook ~= "none" then PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' }) end end end)

local sistemas = {}
sistemas["[COLETE_HACK]"]=true
sistemas["[OUTROS-CLIENT]"]=true
sistemas["[SPECTADOR]"]=true
sistemas["[WALL]"]=true
sistemas["[Outros]"]=true
sistemas["[EXPLOSAO]"]=true
sistemas["[EXPLOSAO2]"]=true
sistemas["[Monster_Injetado]"]=false  --IGNORA, ISSO JA FUNCIONOU E NO MOMENTO SÓ DA ALARME FALSO
sistemas["[Monster_Injetado2]"]=false --IGNORA, ISSO JA FUNCIONOU E NO MOMENTO SÓ DA ALARME FALSO
sistemas["[Monster_Injetado3]"]=false --IGNORA, ISSO JA FUNCIONOU E NO MOMENTO SÓ DA ALARME FALSO
sistemas["[Monster_Diretor]"]=true
sistemas["[PROP]"]=true
sistemas["[NOCLIP]"]=true
sistemas["[GODMOD]"]=true
sistemas["[MODMENU]"]=true
sistemas["[OUTROS2]"]=false
sistemas["[REMOVE_GIVE_WEAPON]"]=true
sistemas["[Multiplicador_Dano]"]=true
sistemas["[SPAWN_DINHEIRO]"]=true
sistemas["[OUTROS4]"]=true
sistemas["[TELEPORT]"]=true
sistemas["[STOPCLIENT]"]=false
sistemas["[STOPCLIENT2]"]=false
sistemas["[STOPCLIENT3]"]=false

sistemas["[WALL2]"]=false
sistemas["[EXPLOSAO3]"]=false
sistemas["[Modo_Spawner]"]=true
sistemas["[SPAWN_VEICULOS]"]=false
sistemas["[SPAWN_PROP]"]=false
sistemas["[SPAWN_NPC]"]=false
sistemas["[SPAWN_VEICULO]"]=false
sistemas["[EXPLOSAO4]"]=true
sistemas["[MODMENU4]"]=true

local banidos = {}
AddEventHandler("MQCU:LixoDetectado", function(user_id,msg,cb)
	if(sistemas[msg]~=nil)then
		if(sistemas[msg]==true)then
			if(banidos[user_id]==nil)then
				banidos[user_id]=true
				local id = user_id
				local source = vRP.getUserSource(user_id)
				
				local ped = GetPlayerPed(source)
				local loc = GetEntityCoords(ped)
				local reason = "ANTI HACK: 	localização:	"..loc.x..","..loc.y..","..loc.z
				
				local identity = vRP.getUserIdentity(parseInt(id))
				if identity then
					vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 1 })
				end					
				local temp = os.date("%x  %X")
				--vRP.logs("savedata/BANIMENTOS.txt","ANTI HACK	[ID]: "..id.."		"..temp.."[BAN]		[MOTIVO:"..msg.."]	"..reason)
				SendWebhookMessage(ac_webhook_anthack, "ANTI HACK	[ID]: "..id.."		"..temp.."[BAN]		[MOTIVO:"..msg.."]	"..reason)
				local source = vRP.getUserSource(id)
				if source ~= nil then	
					TriggerClientEvent("vrp_sound:source",source,"ban",1.0)
					Citizen.Wait(1000)
					vRP.kick(id,"Vai usar Hack na Casa do Caralho!")						
				end
				cb()
				banidos[user_id]=nil
			end
		else
			local temp = os.date("%x  %X")
			SendWebhookMessage(ac_webhook_suspeitos, "ANTI HACK     Suspeito	[ID]: "..user_id.."		"..temp.."[BAN]		[MOTIVO:"..msg.."]	")
		end
	else
		SendWebhookMessage(ac_webhook_suspeitos, "Função não mapeada => "..msg.."          ["..user_id.."]")
	end
end)


--[[ -- ADICIONAR NO ARQUIVO -> vrp\base.lua
function vRP.getUserIdByIdentifier(ids)
	local rows = vRP.query("vRP/userid_byidentifier",{ identifier = ids})
	if #rows > 0 then
		return rows[1].user_id
	else
		return -1
	end
end
]]


--[[ -- SUBSTITUIR NO ARQUIVO	->	vrp\modules\player_state.lua
local colete = data.colete
SetTimeout(10000,function()
	if data.colete then
		source = vRP.getUserSource(user_id)
		if(source~=nil)then
			vRPclient.setArmour(source,colete)
		end
	end
end)






CODIGO A SUBSTITUIR:
if data.colete then			
	vRPclient.setArmour(source,data.colete)
end
]]

RegisterServerEvent("MCU:Load")
AddEventHandler("MCU:Load",function(cb)
	local vrpobj = {
		Entity = function(ent, key, value) Entity(ent).state[key] = value; return Entity(ent).state[key] end,
		MQCU = GetCurrentResourceName(),
		getUserId = vRP.getUserId,
		getUserIdByIdentifier = vRP.getUserIdByIdentifier,
		isBanned = vRP.isBanned,
		getUserSource = vRP.getUserSource,
		setSData = vRP.setSData,
		getSData = vRP.getSData,
		hasPermission = vRP.hasPermission,
		tryPayment = vRP.tryPayment,
		tryFullPayment = vRP.tryFullPayment,
		getUData = vRP.getUData,
		setUData = vRP.setUData,
		giveMoney = vRP.giveMoney,
		giveBankMoney = vRP.giveBankMoney,
		getUserIdentity = vRP.getUserIdentity,
		Log = RegistraLog,
		getPlacas = getAllPlacas,
		placas = {"PLCXAD78","55DTA141","ABCDE123"}
	}	
	cb(vrpobj)
end)
vRP._prepare("mqcu/get_AllPlacas","SELECT plate FROM vrp_vehicles WHERE user_id = @user_id")
function getAllPlacas(user_id)
	return vRP.query("mqcu/get_AllPlacas", {user_id = user_id})
end


function RegistraLog(a,arquivo)
	if(a~=nil)then
		a = "\n"..a
		archive = io.open(arquivo..".txt","a")
		if archive then	
			archive:write(a)
		end
		archive:close()
	end
end



local logprop = false
AddEventHandler("MQCU:LogProp", function(msg, flag)    
    if(flag or logprop)then
        SendWebhookMessage(ac_webhook_suspeitos, msg)
    end
end)



AddEventHandler('MQCU:BlackList', function (user_id, qtd)
	if(banir_blacklisted and parseInt(qtd)>= minimo_bans and excecao[user_id]==nil)then
        local identity = vRP.getUserIdentity(parseInt(user_id))
		if identity then
			vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 1 })			
		end                    
        local temp = os.date("%x  %X")
		GravaLog("[ID]: "..user_id.."        "..temp.."[BAN]        [MOTIVO:BLACKLIST (QTD BANIMENTOS:"..qtd..")]")
    end
end)

local wallstatus = {}
AddEventHandler('MarqCU#4374:wall', function (user_id)
	if(wallstatus[user_id]==nil)then
		wallstatus[user_id] = false
	end
	wallstatus[user_id] = not wallstatus[user_id]
	local source = vRP.getUserSource(user_id)
	local temp = os.date("%x  %X")
	local ped = GetPlayerPed(source)
	local locx = GetEntityCoords(ped)
	local loc = "localização: "..locx.x..","..locx.y..","..locx.z
	local estado = ""
	if(wallstatus[user_id])then
		estado = "True"
	else
		estado = "False"
	end
	SendWebhookMessage(ac_webhook_logstaff, "[ID]: "..user_id.."/wall \t["..estado.."]\t"..loc.."\t["..temp.."]")
	GravaLog("[ID]: "..user_id.."/wall \t["..estado.."]\t"..loc.."\t["..temp.."]")
end)

function GravaLog(a)
	if(a~=nil)then
		a = "\n"..a
		archive = io.open("MarqCU.txt","a")
		if archive then	
			archive:write(a)
		end
		archive:close()
	end
end





AddEventHandler("MCU:getUserId", function(source,cb)	
	cb(vRP.getUserId(source))
end)
AddEventHandler("MCU:getUserIdByIdentifier", function(ids,cb)	
	cb(vRP.getUserIdByIdentifier(ids))
end)
AddEventHandler("MCU:isBanned", function(user_id,cb)	
	cb(vRP.isBanned(user_id))
end)
AddEventHandler("MCU:getUserSource", function(user_id,cb)	
	cb(vRP.getUserSource(user_id))
end)
AddEventHandler("MCU:getSData", function(key,cb)		
	cb(vRP.getSData(key))	
end)
AddEventHandler("MCU:setSData", function(key,data)		
	vRP.setSData(key, data)
end)
AddEventHandler("MCU:getGen", function(source,cb)		
	cb(vRPclient.getGen(source))
end)
AddEventHandler("MCU:isHandcuffed", function(source,cb)		
	cb(vRPclient.isHandcuffed(source))
end)
AddEventHandler("MCU:getCustomization", function(source,cb)
	local customization = vRPclient.getCustomization(source)
	cb(customization)
end)
AddEventHandler("MCU:hasPermission", function(user_id,permissao,cb)
	cb(vRP.hasPermission(user_id,permissao))
end)
AddEventHandler("MCU:tryPayment", function(user_id,valor,cb)
	cb(vRP.tryPayment(user_id,valor))
end)
AddEventHandler("MCU:tryFullPayment", function(user_id,valor,cb)
	cb(vRP.tryFullPayment(user_id,valor))
end)
AddEventHandler("MCU:getUData", function(user_id,key,cb)
	cb(vRP.getUData( user_id,key))	
end)
AddEventHandler("MCU:setUData", function(user_id,key,data)
	 vRP.setUData(user_id,key, data)	
end)
AddEventHandler("MCU:giveMoney", function(user_id,value)
	 vRP.giveMoney(user_id,value,"[MQCU]")
end)
AddEventHandler("MCU:giveBankMoney", function(user_id,value)
	 vRP.giveBankMoney(user_id,value,"[MQCU]")
end)
AddEventHandler("MCU:setCustomization", function(source,index,p1,p2,p3)
	local customization = vRPclient.getCustomization(source)
	customization[index]={p1,p2,p3}
	vRPclient.setCustomization(source,customization)
end)
AddEventHandler("MCU:toggleHandcuff", function(source)
	vRPclient.toggleHandcuff(source)
end)
AddEventHandler("MCU:playAnim", function(source,v1,v2,v3,v4,v5)	
	vRPclient.playAnim(source,v1,{{v2,v3,v4}},v5)
end)
AddEventHandler("MCU:notify", function(source,msg)
	TriggerClientEvent("Notify",source,"importante",msg)
end)

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if(wallstatus[user_id]~=nil)then
		if(wallstatus[user_id])then
			wallstatus[user_id] = false
		end
	end
end)