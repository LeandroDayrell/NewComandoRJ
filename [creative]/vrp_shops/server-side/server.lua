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
Tunnel.bindInterface("vrp_shops",cRP)
vCLIENT = Tunnel.getInterface("vrp_shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local shops = {
	["departamentStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["postit"] = 20,
			--["hamburger"] = 20,
			["emptybottle"] = 40,
			["cigarette"] = 20,
			["lighter"] = 600,
			["chocolate"] = 10,
			["sandwich"] = 18,
			["absolut"] = 40,
			["chandon"] = 45,
			["dewars"] = 25,
			["hennessy"] = 30,
			["backpackp"] = 5000,
			["backpackm"] = 10000,
			["backpackg"] = 15000,
			["divingsuit"] = 5000
		}
	},
	["pharmacyStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["gauze"] = 1000,
			["bandage"] = 750,
			["analgesic"] = 100,
			["warfarin"] = 25000,
			["sinkalmy"] = 1500,
			["ritmoneury"] = 2000,
			["adrenaline"] = 4000
		}
	},
	["foodGrill"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["tacos"] = 28,
			["hamburger"] = 20,
			["hotdog"] = 18,
			["soda"] = 18,
			["cola"] = 18,
			["chocolate"] = 10,
			["sandwich"] = 18,
			["fries"] = 10,
			["absolut"] = 40,
			["chandon"] = 45,
			["dewars"] = 25,
			["donut"] = 10,
			["hennessy"] = 30
		}
	},
	["ammunationStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["GADGET_PARACHUTE"] = 1000,
			["WEAPON_KNIFE"] = 2000,
			["WEAPON_HATCHET"] = 2000,
			["WEAPON_BAT"] = 2000,
			["WEAPON_BATTLEAXE"] = 2000,
			["WEAPON_BOTTLE"] = 2000,
			["WEAPON_CROWBAR"] = 2000,
			["WEAPON_DAGGER"] = 2000,
			["WEAPON_GOLFCLUB"] = 2000,
			["WEAPON_HAMMER"] = 2000,
			["WEAPON_MACHETE"] = 2000,
			["WEAPON_POOLCUE"] = 2000,
			["WEAPON_STONE_HATCHET"] = 2000,
			["WEAPON_SWITCHBLADE"] = 2000,
			["WEAPON_WRENCH"] = 2000,
			["WEAPON_KNUCKLE"] = 2000
		}
	},
	["premiumStore"] = {
		["mode"] = "Buy",
		["type"] = "Premium",
		["list"] = {
			["premiumplate"] = 50,
			["bonusDelivery"] = 20,
			["bonusPostOp"] = 20
		}
	},
	["fishingSell"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["shrimp"] = 45,
			["octopus"] = 50,
			["carp"] = 55
		}
	},
	["recyclingSell"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["plastic"] = 30,
			["glass"] = 30,
			["rubber"] = 30,
			["aluminum"] = 35,
			["copper"] = 35,
			["eletronics"] = 50,
			["emptybottle"] = 20,
			["lighter"] = 400,
			["bucket"] = 120,
			["divingsuit"] = 2500,
			["teddy"] = 900,
			["fishingrod"] = 2500,
			["identity"] = 350,
			["radio"] = 2000,
			["cellphone"] = 1000,
			["binoculars"] = 500,
			["camera"] = 2000,
			["vape"] = 15000,
			["pager"] = 3000,
			["keyboard"] = 450,
			["ouro"] = 750,
			["prata"] = 180,
			["bronze"] = 140,
			["mouse"] = 570,
			["ring"] = 570,
			["watch"] = 1500,
			["goldbar"] = 40000,
			["playstation"] = 2400,
			["xbox"] = 2400,
			["legos"] = 700,
			["ominitrix"] = 1750,
			["bracelet"] = 1300,
			["dildo"] = 800,
			["postit"] = 10
		}
	},
	["fishingStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["bait"] = 10,
			["fishingrod"] = 5000
		}
	},
	["registryStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["identity"] = 600
		}
	},
--[[ 	["digitalDen"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["radio"] = 4000,
			["cellphone"] = 2000,
			["binoculars"] = 1000,
			["camera"] = 2000,
			["vape"] = 30000
		}
	}, ]]
	["megaMallStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["postit"] = 20,
			["tecido"] = 5,
			--["hamburger"] = 50,
			["emptybottle"] = 40,
			["cigarette"] = 20,
			["lighter"] = 600,
			["chocolate"] = 10,
			["sandwich"] = 18,
			["skate"] = 50,
			["cola"] = 18,
			["teddy"] = 500,
			["rose"] = 50,
			["compost"] = 10,
			["silk"] = 3,
			["taurina"] = 80,
			["paperbag"] = 50,
			["firecracker"] = 1000,
			["radio"] = 4000,
			["cellphone"] = 2000,
			["binoculars"] = 1000,
			["camera"] = 2000,
			["vape"] = 30000
		}
	},
	["comedyBar"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["cola"] = 18,
			["soda"] = 18,
			["fries"] = 10,
			["absolut"] = 40,
			["chandon"] = 45,
			["dewars"] = 25,
			["hennessy"] = 30,
		}
	},
	["coffeeMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["coffee"] = 1000
		}
	},
	["McDonalds"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["coffee"] = 1000,
			["hamburger"] = 20,
			["fries"] = 10,
			["cola"] = 18,
		}
	},
	["sodaMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash", 
		["list"] = {
			["soda"] = 18
		}
	},
	["colaMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["cola"] = 18
		}
	},
	["donutMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["donut"] = 9,
			["chocolate"] = 9
		}
	},
	--[[ ["burgerMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["hamburger"] = 20
		}
	}, ]]
	["hotdogMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["hotdog"] = 18
		}
	},
	["waterMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["water"] = 40
		}
	},
	["policeSell"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["perm"] = "Police",
		["list"] = {
			["vest"] = 5,
			["gsrkit"] = 2,
			["gdtkit"] = 2,
			["WEAPON_SMG"] = 100,
			["WEAPON_PUMPSHOTGUN"] = 100,
			["WEAPON_SAWNOFFSHOTGUN"] = 100,
			["WEAPON_CARBINERIFLE"] = 150,
			["WEAPON_SPECIALCARBINE"] = 150,
			["WEAPON_RIFLE_AMMO"] =5,
			["WEAPON_PISTOL_AMMO"] = 1,
			["WEAPON_SHOTGUN_AMMO"] = 5,
			["WEAPON_SMG_AMMO"] = 3,
			["WEAPON_FIREEXTINGUISHER"] = 1000,
			["WEAPON_STUNGUN"] = 100,
			["WEAPON_NIGHTSTICK"] = 10,
			["WEAPON_MACHINEPISTOL"] = 10,
			["WEAPON_APPISTOL"] = 10,
			["WEAPON_COMBATPISTOL"] = 50
		}
	},
	["policeStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Police",
		["list"] = {
			["vest"] = 5,
			["energetic"] = 200,
			["gsrkit"] = 2,
			["gdtkit"] = 2,
			["WEAPON_SMG"] = 100,
			["WEAPON_PUMPSHOTGUN"] = 100,
			["WEAPON_SAWNOFFSHOTGUN"] = 100,
			["WEAPON_MACHINEPISTOL"] = 10,
			["WEAPON_APPISTOL"] = 10,
			["WEAPON_CARBINERIFLE"] = 150,
			["WEAPON_SPECIALCARBINE"] = 150,
			["WEAPON_RIFLE_AMMO"] =5,
			["WEAPON_SHOTGUN_AMMO"] = 5,
			["WEAPON_PISTOL_AMMO"] = 1,
			["WEAPON_SMG_AMMO"] = 3,
			["WEAPON_FIREEXTINGUISHER"] = 1000,
			["WEAPON_STUNGUN"] = 100,
			["WEAPON_NIGHTSTICK"] = 10,
			["WEAPON_COMBATPISTOL"] = 50
		}
	},
	["lavagemmc"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["perm"] = "TheLost",
		["list"] = {
			["goldbar"] = 80000,
			["dollars2"] = 0.95
		}
	},
	["mochilax"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["backpackx"] = 10000
		}
	},
	["lavagemyakuza"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["perm"] = "Yakuza",
		["list"] = {
			["goldbar"] = 80000,
			["dollars2"] = 0.95
		}
	},
	["lossantos"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["tires"] = 2000,
			["toolbox"] = 2500
		}
	},
--[[ 	["drugsSelling"] = {
		["mode"] = "Buy",
		["type"] = "Consume",
		["item"] = "dollars2",
		["list"] = {
			["meth"] = 26,
			["lean"] = 18,
			["ecstasy"] = 8
		}
	}, ]]
	["contrabando"] = {
		["mode"] = "Buy",
		["type"] = "Consume",
		["item"] = "dollars",
		["list"] = {
			["handcuff"] = 2000,
			["hood"] = 5000,
			["cannabisseed"] = 18,
			["efidrina"] = 18,
			["rope"] = 3000
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestPerm(shopType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.wantedReturn(user_id) then
			return false
		end

		if shops[shopType]["perm"] ~= nil then
			if not vRP.hasPermission(user_id,shops[shopType]["perm"]) then
				return false
			end
		end
		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestShop(name)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local inventoryShop = {}
		for k,v in pairs(shops[name]["list"]) do
			table.insert(inventoryShop,{ price = parseInt(v), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, weight = vRP.itemWeightList(k) })
		end

		local inventoryUser = {}
		local inv = vRP.getInventory(user_id)
		if inv then
			for k,v in pairs(inv) do
				if string.sub(v.item,1,9) == "toolboxes" then
					local advFile = LoadResourceFile("logsystem","toolboxes.json")
					local advDecode = json.decode(advFile)

					v.durability = advDecode[v.item]
				end

				v.amount = parseInt(v.amount)
				v.name = vRP.itemNameList(v.item)
				v.peso = vRP.itemWeightList(v.item)
				v.index = vRP.itemIndexList(v.item)
				v.key = v.item
				v.slot = k

				inventoryUser[k] = v
			end
		end

		return inventoryShop,inventoryUser,vRP.computeInvWeight(user_id),vRP.getBackpack(user_id),{ identity.name.." "..identity.name2,parseInt(user_id),parseInt(identity.bank),parseInt(vRP.getUserGems(user_id)),identity.phone,identity.registration }
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETSHOPTYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.getShopType(name)
    return shops[name].mode
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionShops(shopType,shopItem,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end

		if shops[shopType]["mode"] == "Buy" then
			if vRP.computeInvWeight(parseInt(user_id)) + vRP.itemWeightList(shopItem) * parseInt(shopAmount) <= vRP.getBackpack(parseInt(user_id)) then
				if shops[shopType]["type"] == "Cash" then
					if shops[shopType]["list"][shopItem] then
						if vRP.paymentBank(parseInt(user_id),parseInt(shops[shopType]["list"][shopItem]*shopAmount)) then
							vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false,slot)
						else
							TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",5000)
						end
					end
				elseif shops[shopType]["type"] == "Consume" then
					if vRP.tryGetInventoryItem(parseInt(user_id),shops[shopType]["item"],parseInt(shops[shopType]["list"][shopItem]*shopAmount)) then
						vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false,slot)
					else
						TriggerClientEvent("Notify",source,"negado","Insuficiente "..vRP.itemNameList(shops[shopType]["item"])..".",5000)
					end
				elseif shops[shopType]["type"] == "Premium" then
					local identity = vRP.getUserIdentity(parseInt(user_id))
					local consult = vRP.getInfos(identity.steam)
					if parseInt(consult[1].gems) >= parseInt(shops[shopType]["list"][shopItem]*shopAmount) then
						vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false,slot)
						vRP.execute("vRP/rem_vrp_gems",{ steam = identity.steam, gems = parseInt(shops[shopType]["list"][shopItem]*shopAmount) })
						TriggerClientEvent("Notify",source,"sucesso","Você comprou <b>"..vRP.format(parseInt(shopAmount)).."x "..vRP.itemNameList(shopItem).."</b> por <b>"..vRP.format(parseInt(shops[shopType]["list"][shopItem]*shopAmount)).." Gemas</b>.",5000)
					else
						TriggerClientEvent("Notify",source,"negado","Gemas Insuficientes.",5000)
					end
				end
			else
				TriggerClientEvent("Notify",source,"negado","Mochila cheia.",5000)
			end
		elseif shops[shopType]["mode"] == "Sell" then
			if shops[shopType]["list"][shopItem] then
				if shops[shopType]["type"] == "Cash" then
					if vRP.tryGetInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),true,slot) then
						vRP.giveInventoryItem(parseInt(user_id),"dollars",parseInt(shops[shopType]["list"][shopItem]*shopAmount),false)
						TriggerClientEvent("Notify",source,"aviso","Voce recebeu $"..shops[shopType]["list"][shopItem]*shopAmount.." dolares.",5000)
					end
				elseif shops[shopType]["type"] == "Consume" then
					if vRP.tryGetInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),true,slot) then
						vRP.giveInventoryItem(parseInt(user_id),shops[shopType]["item"],parseInt(shops[shopType]["list"][shopItem]*shopAmount),false)
					end
				end
			end
		end

		vCLIENT.updateShops(source,"requestShop")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_shops:populateSlot")
AddEventHandler("vrp_shops:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(parseInt(user_id),itemName,amount,false,slot) then
			vRP.giveInventoryItem(parseInt(user_id),itemName,amount,false,target)
			vCLIENT.updateShops(source,"requestShop")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_shops:updateSlot")
AddEventHandler("vrp_shops:updateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		local inv = vRP.getInventory(parseInt(user_id))
		if inv then
			if inv[tostring(slot)] and inv[tostring(target)] and inv[tostring(slot)].item == inv[tostring(target)].item then
				if vRP.tryGetInventoryItem(parseInt(user_id),itemName,amount,false,slot) then
					vRP.giveInventoryItem(parseInt(user_id),itemName,amount,false,target)
				end
			else
				vRP.swapSlot(parseInt(user_id),slot,target)
			end
		end

		vCLIENT.updateShops(source,"requestShop")
	end
end)