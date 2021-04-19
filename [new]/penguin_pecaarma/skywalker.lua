--#----------------------------------------------------------------------------------------------------------------------------#--
--#--------------------------------------------------[ DEVELOPED BY PENGUIN ]--------------------------------------------------#--
--#-------------------------------------------------[ CONTATO: Penguinn#0001 ]-------------------------------------------------#--
--#---------------------------------------------[ START SHOP: discord.gg/p8cEuep ]---------------------------------------------#--
--#----------------------------------------------------------------------------------------------------------------------------#--
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
oC = {}
Tunnel.bindInterface("penguin_pecaarma",oC)
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------
--[ ARRAY ]------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
local municoes = {
    { item = "facil" },
    { item = "mediana" },
	{ item = "dificil" },
}
-----------------------------------------------------------------------------------------------------------------------------------
--[ EVENTOS ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("rotas-pecas")
AddEventHandler("rotas-pecas",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(municoes) do
            if item == v.item then
                if item == "facil" then
                    TriggerClientEvent("fechar-nui-farm",source) -- FECHAR NUI
                    TriggerClientEvent("Notify",source,"sucesso","Você iniciou a <b>Coleta fácil</b>.") -- NOTIFICAÇÃO
                elseif item == "mediana" then
					TriggerClientEvent("fechar-nui-farm",source) -- FECHAR NUI
                    TriggerClientEvent("Notify",source,"sucesso","Você iniciou a <b>Coleta mediana</b>.") -- NOTIFICAÇÃO
                elseif item == "dificil" then
					TriggerClientEvent("fechar-nui-farm",source) -- FECHAR NUI
                    TriggerClientEvent("Notify",source,"sucesso","Você iniciou a <b>Coleta difícil</b>.") -- NOTIFICAÇÃO
                end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO DE PERMISSÃO ]----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
function oC.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"Mafia") or vRP.hasPermission(user_id,"Milicia") or vRP.hasPermission(user_id,"Yakuza") or vRP.hasPermission(user_id,"Bahamas") or vRP.hasPermission(user_id,"Unktec") or vRP.hasPermission(user_id,"Bennys") or vRP.hasPermission(user_id,"Lowrider") then
        return true
    end
end

function oC.checkinventario()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.computeInvWeight(user_id)+vRP.itemWeightList("pecadearma") <= vRP.getBackpack(user_id) then
        return true
    end
end
-----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO DE QUANTIDADE ]---------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
local quantidadefacil = {}
function oC.Quantidadefacil()
	local source = source
	if quantidadefacil[source] == nil then
		quantidadefacil[source] = math.random(1,5)
	end
end

local quantidademediano = {}
function oC.Quantidademediano()
	local source = source
	if quantidademediano[source] == nil then
		quantidademediano[source] = math.random(5,10)
	end
end

local quantidadedificil = {}
function oC.Quantidadedificil()
	local source = source
	if quantidadedificil[source] == nil then
		quantidadedificil[source] = math.random(8,15)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO DE PAGAMENTO ]----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
function oC.checkPaymentfacil()
	oC.Quantidadefacil()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.computeInvWeight(user_id)+vRP.itemWeightList("pecadearma")*quantidadefacil[source] <= vRP.getBackpack(user_id) then
		vRP.giveInventoryItem(user_id,"pecadearma",quantidadefacil[source],true)
		TriggerClientEvent("Notify",source,"sucesso","<b>"..quantidadefacil[source].."x</b> peças coletadas com <b>sucesso</b>.",5000) -- NOTIFICAÇÃO
		quantidadefacil[source] = nil
		return true
		end
	end
end

function oC.checkPaymentmediano()
	oC.Quantidademediano()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.computeInvWeight(user_id)+vRP.itemWeightList("pecadearma")*quantidademediano[source] <= vRP.getBackpack(user_id) then
		vRP.giveInventoryItem(user_id,"pecadearma",quantidademediano[source],true)
		TriggerClientEvent("Notify",source,"sucesso","<b>"..quantidademediano[source].."x</b> peças coletadas com <b>sucesso</b>.",5000) -- NOTIFICAÇÃO
		quantidademediano[source] = nil
		return true
		end
	end
end

function oC.checkPaymentdificil()
	oC.Quantidadedificil()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.computeInvWeight(user_id)+vRP.itemWeightList("pecadearma")*quantidadedificil[source] <= vRP.getBackpack(user_id) then
		vRP.giveInventoryItem(user_id,"pecadearma",quantidadedificil[source],true)
		TriggerClientEvent("Notify",source,"sucesso","<b>"..quantidadedificil[source].."x</b> peças coletadas com <b>sucesso</b>.", 5000) -- NOTIFICAÇÃO
		quantidadedificil[source] = nil
		return true
		end
	end
end

function oC.callPolice(x,y,z)
	local copAmount = vRP.numPermission("Police")
	for k,v in pairs(copAmount) do
		async(function()
			TriggerClientEvent("NotifyPush",v,{ code = 31, title = "Roubo ao loja de peca", x = x, y = y, z = z, rgba = {170,80,25} })
		end)
	end
end

  --[[ function oC.callPolice(x,y,z)
	local copAmount = vRP.numPermission("Police")
	for k,v in pairs(copAmount) do
		async(function()
			local id = idgens:gen()
			--TriggerClientEvent("NotifyPush",v,{ code = 31, title = "Ocorrencia Peca de arma ", x = x, y = y, z = z, rgba = {170,80,25} })
			TriggerClientEvent("NotifyPush",v,{ code = 31, title = "Ocorrencia de peca de arma", x = x, y = y, z = z, rgba = {15,110,110} })
			SetTimeout(20000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
		end)
	end
end  ]]
-------------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO CHAMAR POLICIA ]----------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
--[[ local blips = {}
function oC.callPolice(x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local copAmount = vRP.numPermission("Police")
		for l,w in pairs(copAmount) do
			local player = vRP.getUserSource(parseInt(w))
			if player then
				async(function()
					local id = idgens:gen()
					--oC.callPolice(x,y,z)				
					--blips[id] = vRPclient.addBlip(player,x,y,z,10,84,"Ocorrência",0.5,false)
					--vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
					TriggerEvent("NotifyPush",v,{ code = 31, title = "Ocorrencia de peca de arma", x = x, y = y, z = z, rgba = {15,110,110} })
					SetTimeout(20000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end
	end
end ]]