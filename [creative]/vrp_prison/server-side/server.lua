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
Tunnel.bindInterface("vrp_prison",cRP)
vCLIENT = Tunnel.getInterface("vrp_prison")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local records = "https://discord.com/api/webhooks/842478717258825748/6smsqeZ7ikslfketdfeBeVDhC-dVbuGZiqyKOg_1ToJMTZPQW-v8wFqL4-f_u-ldDcBo"
local fines = "https://discord.com/api/webhooks/842478621725425664/SKrM1AznzLb_C2Pss3lb4FA3jZykPZEvve3b_wpyuJ_PKE_gU7wMk6kpZ5APm_inILQu"
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRISON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("prender",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") then
			local nuser_id = vRP.prompt(source,"Passaporte:","")
			if nuser_id == "" then
				return
			end

			local services = vRP.prompt(source,"Servicos:","")
			if services == "" then
				return
			end

			local crimes = vRP.prompt(source,"Crimes:","")
			if crimes == "" then
				return
			end

			local locate = vRP.prompt(source,"1 = Departament / 2 = Prisao","")
			if (locate == "" or parseInt(locate) > 2) then
				return
			end

			local nplayer = vRP.getUserSource(parseInt(nuser_id))
			if nplayer then
				vCLIENT.startPrison(nplayer,parseInt(locate))

				if parseInt(locate) == 2 then
					vRPclient.teleport(nplayer,1677.72,2509.68,45.57)
				end
			end

			vRP.execute("vRP/set_prison",{ user_id = parseInt(nuser_id), prison = parseInt(services), locate = parseInt(locate) })

			local identity = vRP.getUserIdentity(parseInt(nuser_id))
			local identity2 = vRP.getUserIdentity(parseInt(user_id))
			if identity then
				creativeLogs(records,"```PASSPORT: "..parseInt(nuser_id).."\nNAME: "..identity.name.." "..identity.name2.."\nSERVICES: "..parseInt(services).."\nCRIMES: "..crimes.."\nBY: "..identity2.name.." "..identity2.name2.."```")
				TriggerClientEvent("Notify",source,"sucesso","<b>"..identity.name.." "..identity.name2.."</b> enviado para a prisão <b>"..parseInt(services).." serviços</b>.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("rprender",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") then
			local nuser_id = vRP.prompt(source,"Passaport:","")
			if nuser_id == "" then
				return
			end

			local services = vRP.prompt(source,"Servicos:","")
			if services == "" then
				return
			end

			local consult = vRP.getInformation(parseInt(nuser_id))
			if parseInt(consult[1].prison) <= parseInt(services) then
				vRP.execute("vRP/fix_prison",{ user_id = parseInt(nuser_id) })
			else
				vRP.execute("vRP/rem_prison",{ user_id = parseInt(nuser_id), prison = parseInt(services) })
			end

			local identity = vRP.getUserIdentity(parseInt(nuser_id))
			if identity then
				TriggerClientEvent("Notify",source,"sucesso","<b>"..identity.name.." "..identity.name2.."</b> teve sua pena reduzida em <b>"..parseInt(services).."</b> serviços</b>.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REDUCEPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.reducePrison()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.execute("vRP/rem_prison",{ user_id = parseInt(user_id), prison = 2 })

		local consult = vRP.getInformation(user_id)
		if parseInt(consult[1].prison) <= 0 then
			vCLIENT.stopPrison(source)
			TriggerClientEvent("Notify",source,"sucesso","O trabalho acabou, você já pode sair e esperamos não vê-lo novamente.",5000)
			if parseInt(consult[1].locate) == 2 then
				vRPclient.teleport(source,1850.83,2601.45,45.63)
			end
		else
			vCLIENT.startPrison(source,parseInt(consult[1].locate))
			TriggerClientEvent("Notify",source,"sucesso","Você ainda tem <b>"..parseInt(consult[1].prison).." serviços</b>.",5000)
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
--------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	Citizen.Wait(1000)

	local consult = vRP.getInformation(user_id)
	if parseInt(consult[1].prison) <= 0 then
		return
	else
		TriggerClientEvent("Notify",source,"importante","Você ainda tem <b>"..parseInt(consult[1].prison).." serviços</b>.",5000)
		vCLIENT.startPrison(source,parseInt(consult[1].locate))
		if parseInt(consult[1].locate) == 1 then
			vRPclient.teleport(source,448.43,-987.86,30.69)
		else
			vRPclient.teleport(source,1677.72,2509.68,45.57)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FINE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("multar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") then
			local nuser_id = vRP.prompt(source,"Passaporte:","")
			if nuser_id == "" or parseInt(nuser_id) <= 0 then
				return
			end

			local value = vRP.prompt(source,"Valor:","")
			if value == "" or parseInt(value) <= 0 then
				return
			end

			local reason = vRP.prompt(source,"Motivo:","")
			if reason == "" then
				return
			end

			local identity = vRP.getUserIdentity(parseInt(nuser_id))
			local identity2 = vRP.getUserIdentity(parseInt(user_id))
			if identity then
				vRP.setFines(parseInt(nuser_id),parseInt(value),parseInt(user_id),tostring(reason))
				vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
				TriggerClientEvent("Notify",source,"importante","Multa aplicada em <b>"..identity.name.." "..identity.name2.."</b> no valor de <b>$"..vRP.format(parseInt(value)).." dólares</b>.",5000)
				creativeLogs(fines,"```PASSPORT: "..parseInt(nuser_id).."\nNAME: "..identity.name.." "..identity.name2.."\nVALUE: $"..vRP.format(parseInt(value)).."\nCRIMES: "..reason.."\nBY: "..identity2.name.." "..identity2.name2.."```")
				
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATIVELOGS
-----------------------------------------------------------------------------------------------------------------------------------------
function creativeLogs(webhook,message)
	if webhook ~= "" then
		PerformHttpRequest(webhook,function(err,text,headers) end,"POST",json.encode({ content = message }),{ ['Content-Type'] = "application/json" })
	end
end