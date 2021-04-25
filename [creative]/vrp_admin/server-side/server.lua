-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vAZgarage = Proxy.getInterface('az-garages')
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_admin",cRP)
vCLIENT = Tunnel.getInterface("vrp_admin")
vHOMES = Tunnel.getInterface("vrp_homes")

local webhooklinkgod = "https://discord.com/api/webhooks/833842795189895228/EZEJOrfck35t_xvHhltEfjaaGqj3gHnAYS0NjGIZ54KIL2jJrlfcRvJyAepMa-yHrQmt"
local webhooklinkDinheiroeItem = "https://discord.com/api/webhooks/833842712893194300/2cZgtDf3vWkamVm8RiuZ39_3cwDhqOphFEznMBNaUPrGWFXrQQGLVN-sSmKrzY9f8eQ1"
local webhooklinkGrupo = "https://discord.com/api/webhooks/833842978560671782/rIjI6h2Xd-9t2zozHcMss9ehmTKEeqBQOnwfsKQEatzWiPJjbmuRhxP79DC7LS-pL6N0"



local webhooklinkBan = "https://discord.com/api/webhooks/833842858234478652/XFI6DF2jJwk2rF4j9Ge0Q1_nNpYf76DJUBL9e-9njwduyETWalCaEE_aeB15Iw9dY83S"
local webhooklinkWl = "https://discord.com/api/webhooks/833842893352468480/Do7FMDIUKhWgikoEYxs0x-c3vdPJRlEXj8V49FrOpUiYw_y90VRo1KqCdK8ASF26eITw"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- DV
--[[ -----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('dv',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"Admin") then --vRP.hasPermission(user_id,"mecanico.permissao") or vRP.hasPermission(user_id,"diretor.permissao") or vRP.hasPermission(user_id,"playerzin.permissao") then
        local vehicle = vRPclient.getNearVehicle(source,7)
		if vehicle then
			vAZgarage.forceDespawnUserVehicle(source, vRPclient.getNetVehicle(source, vehicle))
			SendWebhookMessage(webhooklinkchat,  "```" ..user_id.." Usou o comando " ..rawCommand.. "```")
        end
    end
end)
RegisterNetEvent('deletarveiculo')
AddEventHandler('deletarveiculo',function(vehicle)
    TriggerServerEvent("vrp_garages:admDelete",VehToNet(vehicle))
end) ]]

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ AddEventHandler("vRP:playerSpawn",function(user_id,source)
	local identity = vRP.getUserIdentity(user_id)
	if identity then
		vCLIENT.setDiscord(source,"#"..user_id.." "..identity.name.." "..identity.name2)
	end
end) ]]

-----------------------------------------------------------------------------------------------------------------------------------------
-- DV
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ RegisterCommand("dv",function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"Admin") then --vRP.hasPermission(user_id,"mecanico.permissao") or vRP.hasPermission(user_id,"diretor.permissao") or vRP.hasPermission(user_id,"playerzin.permissao") then
        local vehicle = vRPclient.getNearVehicle(source,7)
		if vehicle then
			vAZgarage.forceDespawnUserVehicle(source, vRPclient.getNetVehicle(source, vehicle))
			--SendWebhookMessage(webhooklinkchat,  "```" ..user_id.." Usou o comando " ..rawCommand.. "```")
        end
    end
end)
RegisterNetEvent('deletarveiculo')
AddEventHandler('deletarveiculo',function(vehicle)
    TriggerServerEvent("vrp_garages:admDelete",VehToNet(vehicle))
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEVEH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeletevehzeco")
AddEventHandler("trydeletevehzeco",function(index)
	TriggerClientEvent("syncdeleteveh",-1,index)
end) ]]


RegisterCommand("setstaff", function(source,args,command)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"Admin") and not vRP.hasPermission(parseInt(args[1]),"player.blips") then
            vRP.insertPermission(parseInt(args[1]),"player.blips")
            vRP.execute("vRP/add_group",{ user_id = parseInt(args[1]), permiss = "player.blips" })
            
            vRP.insertPermission(parseInt(args[1]),"player.noclip")
            vRP.execute("vRP/add_group",{ user_id = parseInt(args[1]), permiss = "player.noclip" })
            
            vRP.insertPermission(parseInt(args[1]),"player.teleport")
            vRP.execute("vRP/add_group",{ user_id = parseInt(args[1]), permiss = "player.teleport" })
            
            vRP.insertPermission(parseInt(args[1]),"player.secret")
            vRP.execute("vRP/add_group",{ user_id = parseInt(args[1]), permiss = "player.secret" })
            
            vRP.insertPermission(parseInt(args[1]),"player.spec")
            vRP.execute("vRP/add_group",{ user_id = parseInt(args[1]), permiss = "player.spec" })
            
            vRP.insertPermission(parseInt(args[1]),"player.wall")
            vRP.execute("vRP/add_group",{ user_id = parseInt(args[1]), permiss = "player.wall" })
            
            vRP.insertPermission(parseInt(args[1]),"mqcu.permissao")
            vRP.execute("vRP/add_group",{ user_id = parseInt(args[1]), permiss = "mqcu.permissao" })
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ 
RegisterCommand("car",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"Admin") then
	vRP.logInfoToFile("logRJ/spawncarro.txt",user_id.." spawnou "..rawCommand.." .")
		if args[1] then
			TriggerClientEvent('spawnarveiculo',source,args[1])
		end
	end
end) ]]

-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("item",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			if args[1] and args[2] and vRP.itemNameList(args[1]) ~= nil then
				vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]),true)
				SendWebhookMessage(webhooklinkDinheiroeItem,  "UserID: [" ..user_id.."]  Item: " ..args[1].. " Qnt: "..parseInt(args[2])..  "  . ")
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDCAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("addcar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") and args[1] and args[2] then
			vRP.execute("vRP/add_vehicle",{ user_id = parseInt(args[1]), vehicle = args[2], plate = vRP.generatePlateNumber(), phone = vRP.getPhone(args[1]), work = tostring(false) })
			TriggerClientEvent("Notify",args[1],"importante","Voce recebeu <b>"..args[2].."</b> em sua garagem.",5000)
			TriggerClientEvent("Notify",source,"importante","Adicionou o veiculo: <b>"..args[2].."</b> no ID:<b>"..args[1].."</b.")
		end
	end
end)

RegisterCommand("capuzz",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") and args[1] then
			TriggerClientEvent("vrp_hud:toggleHood",source,args[1])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("nc",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			vRPclient.noClip(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kick",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and parseInt(args[1]) > 0 then
			vRP.kick(parseInt(args[1]),"Você foi expulso da cidade.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ban",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and parseInt(args[1]) > 0 then
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			if identity then
				vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 1 })
				SendWebhookMessage(webhooklinkBan,  "UserID: [" ..user_id.."]  Aplicou ban em: " ..parseInt(args[1]).. "  Steam: " ..steam.. " . ")

			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("wl",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			vRP.execute("vRP/set_whitelist",{ steam = tostring(args[1]), whitelist = 1 })
			SendWebhookMessage(webhooklinkWl,  "UserID: [" ..user_id.."] WL: " ..tostring(args[1]).. " . ")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNWL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("unwl",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and parseInt(args[1]) > 0 then
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			if identity then
				vRP.execute("vRP/set_whitelist",{ steam = tostring(identity.steam), whitelist = 0 })
				SendWebhookMessage(webhooklinkWl,  "UserID: [" ..user_id.."] Removeu WL: " ..tostring(args[1]).. " . ")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GEMS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("gems",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and parseInt(args[1]) > 0 and parseInt(args[2]) > 0 then
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			if identity then
				vRP.execute("vRP/update_gems",{ steam = tostring(identity.steam), gems = parseInt(args[2]) })
				TriggerClientEvent("Notify",source,"importante","Gemas entregues com sucesso.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("unban",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and parseInt(args[1]) > 0 then
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			if identity then
				vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 0 })
				SendWebhookMessage(webhooklinkBan,  "UserID: [" ..user_id.."]  Removeu ban em: " ..parseInt(args[1]).. "  Steam: " ..steam.. " . ")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpcds",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local fcoords = vRP.prompt(source,"Coordinates:","")
			if fcoords == "" then
				return
			end

			local coords = {}
			for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
				table.insert(coords,parseInt(coord))
			end
			vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cds",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local x,y,z,h = vRPclient.getPositions(source)
			vRP.prompt(source,"Coordinates:",x..","..y..","..z..","..h)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("group",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			if not vRP.hasPermission(parseInt(args[1]),tostring(args[2])) then
				vRP.execute("vRP/add_group",{ user_id = parseInt(args[1]), permiss = tostring(args[2]) })
				SendWebhookMessage(webhooklinkGrupo,  "UserID: [" ..user_id.."]  Adicinou: " ..args[1].. " Grupo: "..tostring(args[2])..  "  . ")
				--SendWebhookMessage(webhooklinkGrupo,  "TESTEEEEEE")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ungroup",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			if vRP.hasPermission(parseInt(args[1]),tostring(args[2])) then
				vRP.execute("vRP/del_group",{ user_id = parseInt(args[1]), permiss = tostring(args[2]) })
				SendWebhookMessage(webhooklinkGrupo,  "UserID: [" ..user_id.."]  Removeu: " ..args[1].. " Grupo: "..tostring(args[2])..  "  . ")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tptome",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and parseInt(args[1]) > 0 then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRPclient.teleport(nplayer,vRPclient.getPositions(source))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpto",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and parseInt(args[1]) > 0 then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRPclient.teleport(source,vRPclient.getPositions(nplayer))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpway",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			vCLIENT.teleportWay(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limbo",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) <= 101 then
			vCLIENT.teleportLimbo(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hash",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local vehicle = vRPclient.getNearVehicle(source,7)
			if vehicle then
				vCLIENT.vehicleHash(source,vehicle)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELNPCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("delnpcs",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			vCLIENT.deleteNpcs(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tuning",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			TriggerClientEvent("vrp_admin:vehicleTuning",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ RegisterCommand("fix2",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local vehicle,vehNet = vRPclient.vehList(source,11)
			if vehicle then
				TriggerClientEvent("vrp_inventory:repairVehicle",-1,vehNet,true)
			end
		end
	end
end) ]]

RegisterCommand('fix',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPositions(source)
	
	if vRP.hasPermission(user_id,"Admin") then
		local vehicle = vRPclient.getNearVehicle(source,7)
		local vehicle,vehNet,vehPlate,vehName = vRPclient.vehList(source,7)
		local plateUser = vRP.getVehiclePlate(vehPlate)
		if vehicle then 
			--print('Teste 01')
			TriggerClientEvent('reparar',source,vehicle)--
			SendWebhookMessage(webhooklinkgod,  "UserID: [" ..user_id.."]  Usou Fix Coords: "..x..", "..y..", "..z..  "  Placa: " ..vehPlate.. " .")
		end
	end
end)

RegisterServerEvent("tryreparar")
AddEventHandler("tryreparar",function(nveh)
	TriggerClientEvent("syncreparar",-1,nveh)
end)

RegisterCommand("limpainv",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
		if vRP.hasPermission(user_id,"Admin") then
			vCLIENT.limparinventory(source)
		end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limparea",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local x,y,z = vRPclient.getPositions(source)
			TriggerClientEvent("syncarea",-1,x,y,z,100)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("players",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local quantidade = 0
			local users = vRP.getUsers()
			for k,v in pairs(users) do
				quantidade = parseInt(quantidade) + 1
			end
			TriggerClientEvent("Notify",source,"importante","<b>Players Conectados:</b> "..quantidade,5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.buttonTxt()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local x,y,z,h = vRPclient.getPositions(source)
			vRP.updateTxt(user_id..".txt",x..","..y..","..z..","..h)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("announce",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local message = vRP.prompt(source,"Message:","")
			if message == "" then
				return
			end

			TriggerClientEvent("Notify",-1,"negado",message.."<br><b>Mensagem enviada por:</b> Governador",15000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("itemall",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local users = vRP.getUsers()
			for k,v in pairs(users) do
				vRP.giveInventoryItem(parseInt(k),tostring(args[1]),parseInt(args[2]),true)
			end
		end
	end
end)

local webhooksuspeito= "https://discord.com/api/webhooks/813577141659893760/5bMbJrkinifrEuaiMNzIUpXdH8tWpvzj5E-K9S2BgRxBg7W1zmvR-llqZlQmKVukEfp-"
RegisterServerEvent('LOG:ARMAS2235')
AddEventHandler('LOG:ARMAS2235', function(weapons)
    local user_id = vRP.getUserId(source)
    if user_id~=nil then
		local msg = "**[SUSPEITO SPAWN DE ARMAS] USER_ID [ "..user_id.." ]**"
		local lstweapons = "```Ammo     Weapon\n"
		for _,weapon in pairs(weapons)do
			if(weapon~=nil)then
				local strammo = "[ "..weapon.ammo.." ] "
				lstweapons=lstweapons..strammo..string.rep(" ", 10-string.len(strammo))..string.gsub(weapon.name, "WEAPON_", "").."\n"
			end
		end
		lstweapons = lstweapons.."```"
		msg = msg.."\n"..lstweapons
		PerformHttpRequest(webhooksuspeito, function(err, text, headers) end, 'POST', json.encode({content = msg}), { ['Content-Type'] = 'application/json' })
    end
end)
