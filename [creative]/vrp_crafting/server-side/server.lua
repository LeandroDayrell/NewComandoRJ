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
Tunnel.bindInterface("vrp_crafting",cRP)
vCLIENT = Tunnel.getInterface("vrp_crafting")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local craftList = {
	["mcCrafting"] = {
		["perm"] = "TheLost",
		["list"] = {
			["vest"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 40,
					["rubber"] = 40,
					["tecido"] = 40
				}
			},
			["WEAPON_ASSAULTSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 190,
					["copper"] = 140,
					["pecadearma"] = 80,
					--["bluecard"] = 1
				}
			},
			["WEAPON_RIFLE_AMMO"] = {
				["amount"] = 20,
				["destroy"] = true,
				["require"] = {
					["copper"] = 20,
					["glass"] = 20
				}
			}
		}
	},
	["yakuzaCrafting"] = {
		["perm"] = "Yakuza",
		["list"] = {
			["vest"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 40,
					["rubber"] = 40,
					["tecido"] = 40
				}
			},
			["WEAPON_ASSAULTSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 190,
					["copper"] = 140,
					["pecadearma"] = 80,
					--["bluecard"] = 1
				}
			},
			["WEAPON_RIFLE_AMMO"] = {
				["amount"] = 20,
				["destroy"] = true,
				["require"] = {
					["copper"] = 20,
					["glass"] = 20
				}
			}
		}
	},
	["mafiaCrafting"] = {
		["perm"] = "Mafia",
		["list"] = {
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 250,
					["copper"] = 180,
					["pecadearma"] = 150,
					--["blackcard"] = 1
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 140,
					["copper"] = 120,
					["pecadearma"] = 70,
					--["bluecard"] = 1
				}
			},
			["WEAPON_GUSENBERG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 250,
					["pecadearma"] = 100,
					["copper"] = 150,
					--["bluecard"] = 1
				}
			},
			["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 20,
				["destroy"] = true,
				["require"] = {
					["copper"] = 5,
					["glass"] = 5
				}
			}
		}
	},
	["mineradorCrafting"] = {
		["list"] = {
			["ouro"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["pepitadeouro"] = 5,
					["copper"] = 2
				}
			},
			["prata"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["pepitadeprata"] = 5,
					["copper"] = 2
				}
			},
			["bronze"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["pepitadebronze"] = 5,
					["copper"] = 2
				}
			}
		}
	},
	["miliciaCrafting"] = {
		["perm"] = "Milicia",
		["list"] = {
			["WEAPON_ASSAULTRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 290,
					["pecadearma"] = 150,
					["copper"] = 210,
					--["blackcard"] = 1
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 150,
					["copper"] = 100,
					["pecadearma"] = 100,
					--["bluecard"] = 1
				}
			},
			["WEAPON_GUSENBERG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 250,
					["copper"] = 150,
					["pecadearma"] = 100,
					--["bluecard"] = 1
				}
			},
			["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 20,
				["destroy"] = true,
				["require"] = {
					["copper"] = 5,
					["glass"] = 5
				}
			}
		}
	},
	["unktecCrafting"] = {
		["perm"] = "Unktec",
		["list"] = {
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 110,
					["copper"] = 110,
					["pecadearma"] = 60,
				}
			},

			["rope"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["tecido"] = 10					
				}
			},
			["handcuff"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 10,
					["copper"] = 10,
					["plastic"] = 10
				}
			},	
			["hood"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["tecido"] = 10
				}
			},
		}
	},
	["lowriderCrafting"] = {
		["perm"] = "Lowrider",
		["list"] = {
			["WEAPON_VINTAGEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 100,
					["copper"] = 100,
					["pecadearma"] = 50,
				}
			},

			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 110,
					["copper"] = 110,
					["pecadearma"] = 60,
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["amount"] = 20,
				["destroy"] = true,
				["require"] = {
					["copper"] = 15,
					["glass"] = 15
				}
			},
			["lockpick"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 20,
					["plastic"] = 20
				}
			},
			["raceticket"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["plastic"] = 1,
					["dollars2"] = 500
				}
			},
			["plate"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 15
				}
			},
			["fueltech"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 50,
					["copper"] = 50,
					["cpuchip"] = 1
				}
			},
			["c4"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 5,
					["copper"] = 5,
					["rubber"] = 5,
					["glass"] = 30
				}
			}
		}
	},
	["bennysCrafting"] = {
		["perm"] = "Bennys",
		["list"] = {
			["WEAPON_VINTAGEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 100,
					["copper"] = 100,
					["pecadearma"] = 50,
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 110,
					["copper"] = 110,
					["pecadearma"] = 60,
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["amount"] = 20,
				["destroy"] = true,
				["require"] = {
					["copper"] = 15,
					["glass"] = 15
				}
			},
			["lockpick"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 20,
					["plastic"] = 20
				}
			},
			["raceticket"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["plastic"] = 1,
					["dollars2"] = 500
				}
			},
			["plate"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 15
				}
			},
			["fueltech"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 50,
					["copper"] = 50,
					["cpuchip"] = 1
				}
			},
			["c4"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 5,
					["copper"] = 5,
					["rubber"] = 5,
					["glass"] = 30
				}
			}
		}
	},
	["bahamas2Crafting"] = {
		["perm"] = "Bahamas",
		["list"] = {
			["energetic"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["plastic"] = 10,
					["taurina"] = 10
				}
			}
		}
	},
	["bahamasCrafting"] = {
		["perm"] = "Bahamas",
		["list"] = {
			["backpackg"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 10,
					["tecido"] = 10
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 110,
					["copper"] = 110,
					["pecadearma"] = 60,
				}
			},
			["rope"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["tecido"] = 10					
				}
			},
			["handcuff"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 10,
					["copper"] = 10,
					["plastic"] = 10
				}
			},	
			["hood"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["tecido"] = 10
				}
			},
		}
	},
	["vermelhoCrafting"] = {
		["perm"] = "Vermelho",
		["list"] = {
			 ["weedendolada"] = {
                ["amount"] = 5,
                ["destroy"] = true,
                ["require"] = {
                    ["weed"] = 5,
                    ["plastic"] = 1
				}
			},
			["bucket"] = {
                ["amount"] = 1,
                ["destroy"] = true,
                ["require"] = {
                    ["plastic"] = 15,
                    ["dollars"] = 100
				}
			},
			["methendolada"] = {
				["amount"] = 5,
				["destroy"] = true,
				["require"] = {
					["meth"] = 5,	
					["plastic"] = 1			
				}
			}
		}
	},
	["verdeCrafting"] = {
		["perm"] = "Verde",
		["list"] = {
			 ["weedendolada"] = {
                ["amount"] = 5,
                ["destroy"] = true,
                ["require"] = {
                    ["weed"] = 5,
                    ["plastic"] = 1
				}
			},
			["bucket"] = {
                ["amount"] = 1,
                ["destroy"] = true,
                ["require"] = {
                    ["plastic"] = 15,
                    ["dollars"] = 100
				}
			},
			["methendolada"] = {
				["amount"] = 5,
				["destroy"] = true,
				["require"] = {
					["meth"] = 5,	
					["plastic"] = 1			
				}
			}
		}
	},
	["azulCrafting"] = {
		["perm"] = "Azul",
		["list"] = {
			 ["weedendolada"] = {
                ["amount"] = 5,
                ["destroy"] = true,
                ["require"] = {
                    ["weed"] = 5,
                    ["plastic"] = 1
				}
			},
			["bucket"] = {
                ["amount"] = 1,
                ["destroy"] = true,
                ["require"] = {
                    ["plastic"] = 15,
                    ["dollars"] = 100
				}
			},
			["methendolada"] = {
				["amount"] = 5,
				["destroy"] = true,
				["require"] = {
					["meth"] = 5,	
					["plastic"] = 1			
				}
			}
		}
	},
	["laranjaCrafting"] = {
		["perm"] = "Laranja",
		["list"] = {
			 ["weedendolada"] = {
                ["amount"] = 5,
                ["destroy"] = true,
                ["require"] = {
                    ["weed"] = 5,
                    ["plastic"] = 1
				}
			},
			["bucket"] = {
                ["amount"] = 1,
                ["destroy"] = true,
                ["require"] = {
                    ["plastic"] = 15,
                    ["dollars"] = 100
				}
			},
			["methendolada"] = {
				["amount"] = 5,
				["destroy"] = true,
				["require"] = {
					["meth"] = 5,	
					["plastic"] = 1			
				}
			}
		}
	},
	["mecanicoCrafting"] = {
		["perm"] = "LosSantos",
		["list"] = {
			 ["toolbox"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 5,
					["rubber"] = 5,
				}
			},
			["tires"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 3					
				}
			}
		}
	},
	["musketIlegal"] = {
		["perm"] = nil,
		["list"] = {
			["WEAPON_MUSKET_AMMO"] = {
				["amount"] = 20,
				["destroy"] = true,
				["require"] = {
					["copper"] = 30,
					["glass"] = 30
				}
			},
			["WEAPON_MUSKET"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["dollars2"] = 250000					
				}
			},
			["tires"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 3					
				}
			},
		}
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestPerm(craftType)
	local source = source
	local user_id = vRP.getUserId(source)

	if user_id then
		if vRP.wantedReturn(user_id) then
			return false
		end

		if craftList[craftType]["perm"] ~= nil then
			if not vRP.hasPermission(user_id,craftList[craftType]["perm"]) then
				TriggerClientEvent('Notify', source, 'importante', 'Você não tem essa <b>permissao!</b>')
				return false
			end
		end

		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestCrafting(craftType)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local inventoryShop = {}
		for k,v in pairs(craftList[craftType]["list"]) do
			local craftList = {}
			for k,v in pairs(v.require) do
				table.insert(craftList,{ name = vRP.itemNameList(k), amount = v })
			end

			table.insert(inventoryShop,{ name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, weight = vRP.itemWeightList(k), list = craftList })
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
-- FUNCTIONCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionCrafting(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end

		if craftList[shopType]["list"][shopItem] then
			for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
				if vRP.getInventoryItemAmount(user_id,k) < parseInt(v*shopAmount) then
					return
				end
				Citizen.Wait(1)
			end

			for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
				vRP.removeInventoryItem(user_id,k,parseInt(v*shopAmount))
				Citizen.Wait(1)
			end

			if string.sub(shopItem,1,9) == "toolboxes" then
				local advAmount = 0

				repeat
					Citizen.Wait(1)
					advAmount = advAmount + 1
					local advFile = LoadResourceFile("logsystem","toolboxes.json")
					local advDecode = json.decode(advFile)
					local number = 0

					repeat
						Citizen.Wait(1)
						number = number + 1
					until advDecode[tostring("toolboxes"..number)] == nil

					advDecode[tostring("toolboxes"..number)] = 10
					vRP.giveInventoryItem(user_id,tostring("toolboxes"..number),1,false)
					SaveResourceFile("logsystem","toolboxes.json",json.encode(advDecode),-1)
				until advAmount == shopAmount
			else
				vRP.giveInventoryItem(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"]*shopAmount,false,slot)
			end
		end

		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONDESTROY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionDestroy(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end

		if craftList[shopType]["list"][shopItem] then
			if craftList[shopType]["list"][shopItem]["destroy"] then
				if vRP.tryGetInventoryItem(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"]) then
					for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
						if parseInt(v) <= 1 then
							vRP.giveInventoryItem(user_id,k,1)
						else
							vRP.giveInventoryItem(user_id,k,v/2)
						end
						Citizen.Wait(1)
					end
				end
			end
		end

		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_crafting:populateSlot")
AddEventHandler("vrp_crafting:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			vCLIENT.updateCrafting(source,"requestCrafting")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_crafting:updateSlot")
AddEventHandler("vrp_crafting:updateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(slot)] and inv[tostring(target)] and inv[tostring(slot)].item == inv[tostring(target)].item then
				if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
				end
			else
				vRP.swapSlot(user_id,slot,target)
			end
		end

		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end)