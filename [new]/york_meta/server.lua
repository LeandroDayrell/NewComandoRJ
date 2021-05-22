local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("york_meta",func)
cRP = {}
Tunnel.bindInterface("york_meta",cRP)
--https://github.com/eboraci
--York#2030
--discord: https://discord.gg/fK5c6V5
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"Vermelho") or vRP.hasPermission(user_id,"Azul") or vRP.hasPermission(user_id,"Verde") or vRP.hasPermission(user_id,"Laranja") then
        return true
    end
end --

local src = {

	[1] = { ['re'] = "efidrina", ['reqtd'] = 5, ['item'] = "metil", ['itemqtd'] = 10 },
	[2] = { ['re'] = "metil", ['reqtd'] = 10, ['item'] = "methliquid", ['itemqtd'] = 15 },
	[3] = { ['re'] = "methliquid", ['reqtd'] = 15, ['item'] = "meth", ['itemqtd'] = 20 },

}

function func.checkPayment(id)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if src[id].re ~= nil then
			if vRP.computeInvWeight(user_id)+vRP.itemWeightList(src[id].item)*src[id].itemqtd <= vRP.getBackpack(user_id) then
				if vRP.tryGetInventoryItem(user_id,src[id].re,src[id].reqtd,false) then
					vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
					return true
				end
			end
		else
			if vRP.computeInvWeight(user_id)+vRP.itemWeightList(src[id].item)*src[id].itemqtd <= vRP.getBackpack(user_id) then
				vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
				return true
			end
		end
	end
end