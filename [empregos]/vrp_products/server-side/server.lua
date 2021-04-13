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
cnVRP = {}
Tunnel.bindInterface("vrp_products",cnVRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local amount = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemList = {
	{ item = "cocaine", priceMin = 2, priceMax = 10, randMin = 3, randMax = 6 },
	{ item = "weedendolada", priceMin = 155, priceMax = 165, randMin = 3, randMax = 6 },
	{ item = "methendolada", priceMin = 200, priceMax = 210, randMin = 3, randMax = 6 },
	{ item = "ecstasy", priceMin = 340, priceMax = 350, randMin = 3, randMax = 6 },
	{ item = "lean", priceMin = 340, priceMax = 350, randMin = 3, randMax = 6 },
	{ item = "keyboard", priceMin = 420, priceMax = 425, randMin = 1, randMax = 2 },
	{ item = "mouse", priceMin = 380, priceMax = 385, randMin = 1, randMax = 2 },
	{ item = "ring", priceMin = 335, priceMax = 345, randMin = 1, randMax = 2 },
	{ item = "watch", priceMin =590, priceMax = 595, randMin = 1, randMax = 2 },
	{ item = "playstation", priceMin = 670, priceMax = 680, randMin = 1, randMax = 1 },
	{ item = "xbox", priceMin = 670, priceMax = 680, randMin = 1, randMax = 1 },
	{ item = "legos", priceMin = 330, priceMax = 340, randMin = 1, randMax = 1 },
	{ item = "ominitrix", priceMin = 590, priceMax = 595, randMin = 1, randMax = 1 },
	{ item = "bracelet", priceMin = 820, priceMax = 850, randMin = 1, randMax = 1 },
	{ item = "dildo", priceMin = 420, priceMax = 425, randMin = 1, randMax = 1 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.checkAmount()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(itemList) do
			local rand = math.random(v.randMin,v.randMax)
			local price = math.random(v.priceMin,v.priceMax)
			if vRP.getInventoryItemAmount(user_id,v.item) >= parseInt(rand) then
				amount[user_id] = { v.item,rand,price }

				TriggerClientEvent("vrp_products:lastItem",source,v.item)

				if (v.item == "weedendolada" or v.item == "lean" or v.item == "methendolada" or v.item == "ecstasy" or v.item == "cocaine") and math.random(100) >= 75 then
					local x,y,z = vRPclient.getPositions(source)
					local copAmount = vRP.numPermission("Police")
					for k,v in pairs(copAmount) do
						async(function()
							TriggerClientEvent("NotifyPush",v,{ --[[time = os.date("%H:%M:%S - %d/%m/%Y"),]] text = "Me ajuda um cara acabou de tentar me vender "..v.item.."!", code = 20, title = "Denúncia de Venda de Drogas", x = x, y = y, z = z, rgba = {41,76,119} })
						end)
					end
				end

				return true
			-- else
			-- 	TriggerClientEvent("Notify",source,"negado","Voce nao possui nada que me interesse",5000)
			end
		end
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.paymentMethod()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryGetInventoryItem(user_id,amount[user_id][1],amount[user_id][2],true) then
			vRP.upgradeStress(user_id,2)
			local value = amount[user_id][3] * amount[user_id][2]
			vRP.giveInventoryItem(user_id,"dollars2",parseInt(value),true)
			TriggerClientEvent("vrp_sound:source",source,"coin",0.5)
		end
	end
end