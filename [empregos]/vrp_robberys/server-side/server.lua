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
Tunnel.bindInterface("vrp_robberys",cRP)
vCLIENT = Tunnel.getInterface("vrp_robberys")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local robberyProgress = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES


--[[ local webhooklinkRouboalojinha = "https://discord.com/api/webhooks/842099865780748328/oKulkeDv1r1jTQ4n6QJbPC_1nCqt4NVaR4wHYaEahQe-NeW79yEMB34e-GJCk2903uk1"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end ]]

-----------------------------------------------------------------------------------------------------------------------------------------
local vars = {
	[1] = {
		["x"] = 28.24,
		["y"] = -1338.832,
		["z"] = 29.5,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[2] = {
		["x"] = 2548.883,
		["y"] = 384.850,
		["z"] = 108.63,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[3] = {
		["x"] = 1159.156,
		["y"] = -314.055,
		["z"] = 69.21,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[4] = {
		["x"] = -710.067,
		["y"] = -904.091,
		["z"] = 19.22,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[5] = {
		["x"] = -43.652,
		["y"] = -1748.122,
		["z"] = 29.43,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[6] = {
		["x"] = 378.291,
		["y"] = 333.712,
		["z"] = 103.57,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[7] = {
		["x"] = -3250.385,
		["y"] = 1004.504,
		["z"] = 12.84,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[8] = {
		["x"] = 1734.968,
		["y"] = 6421.161,
		["z"] = 35.04,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[9] = {
		["x"] = 546.450,
		["y"] = 2662.45,
		["z"] = 42.16,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[10] = {
		["x"] = 1959.113,
		["y"] = 3749.239,
		["z"] = 32.35,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[11] = {
		["x"] = 2672.457,
		["y"] = 3286.811,
		["z"] = 55.25,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[12] = {
		["x"] = 1708.095,
		["y"] = 4920.711,
		["z"] = 42.07,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[13] = {
		["x"] = -1829.422,
		["y"] = 798.491,
		["z"] = 138.2,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[14] = {
		["x"] = -2959.66,
		["y"] = 386.765,
		["z"] = 14.05,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[15] = {
		["x"] = -3048.155,
		["y"] = 585.519,
		["z"] = 7.91,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[16] = {
		["x"] = 1126.75,
		["y"] = -979.760,
		["z"] = 45.42,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[17] = {
		["x"] = 1169.631,
		["y"] = 2717.833,
		["z"] = 37.16,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[18] = {
		["x"] = -1478.67,
		["y"] = -375.675,
		["z"] = 39.17,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[19] = {
		["x"] = -1221.126,
		["y"] = -916.213,
		["z"] = 11.33,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "Loja de Departamento",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[20] = {
		["x"] = 1693.374,
		["y"] = 3761.669,
		["z"] = 34.71,
		["cops"] = 3,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "ammus",
		["cooldown"] = 7200,
		["name"] = "Loja de Armas",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 120000, ["max"] = 135000 }
		}
	},
	[21] = {
		["x"] = 253.061,
		["y"] = -51.643,
		["z"] = 69.95,
		["cops"] = 3,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "ammus",
		["cooldown"] = 7200,
		["name"] = "Loja de Armas",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 120000, ["max"] = 135000 }
		}
	},
	[22] = {
		["x"] = 841.128,
		["y"] = -1034.951,
		["z"] = 28.2,
		["cops"] = 3,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "ammus",
		["cooldown"] = 7200,
		["name"] = "Loja de Armas",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 120000, ["max"] = 135000 }
		}
	},
	[23] = {
		["x"] = -330.467,
		["y"] = 6085.647,
		["z"] = 31.46,
		["cops"] = 3,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "ammus",
		["cooldown"] = 7200,
		["name"] = "Loja de Armas",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 120000, ["max"] = 135000 }
		}
	},
	[24] = {
		["x"] = -660.987,
		["y"] = -933.901,
		["z"] = 21.83,
		["cops"] = 3,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "ammus",
		["cooldown"] = 7200,
		["name"] = "Loja de Armas",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 120000, ["max"] = 135000 }
		}
	},
	[25] = {
		["x"] = -1304.775,
		["y"] = -395.832,
		["z"] = 36.7,
		["cops"] = 3,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "ammus",
		["cooldown"] = 7200,
		["name"] = "Loja de Armas",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 120000, ["max"] = 135000 }
		}
	},
	[26] = {
		["x"] = -1117.765,
		["y"] = 2700.388,
		["z"] = 18.56,
		["cops"] = 3,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "ammus",
		["cooldown"] = 7200,
		["name"] = "Loja de Armas",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 120000, ["max"] = 135000 }
		}
	},
	[27] = {
		["x"] = 2566.632,
		["y"] = 292.945,
		["z"] = 108.74,
		["cops"] = 3,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "ammus",
		["cooldown"] = 7200,
		["name"] = "Loja de Armas",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 120000, ["max"] = 135000 }
		}
	},
	[28] = {
		["x"] = -3172.701,
		["y"] = 1089.462,
		["z"] = 20.84,
		["cops"] = 3,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "ammus",
		["cooldown"] = 7200,
		["name"] = "Loja de Armas",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 120000, ["max"] = 135000 }
		}
	},
	[29] = {
		["x"] = 23.733,
		["y"] = -1106.27,
		["z"] = 29.8,
		["cops"] = 3,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "ammus",
		["cooldown"] = 7200,
		["name"] = "Loja de Armas",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 120000, ["max"] = 135000 }
		}
	},
	[30] = {
		["x"] = 808.914,
		["y"] = -2158.684,
		["z"] = 29.62,
		["cops"] = 3,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "ammus",
		["cooldown"] = 7200,
		["name"] = "Loja de Armas",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 120000, ["max"] = 135000 }
		}
	},
--[[	[31] = {
		["x"] = -1210.409,
		["y"] = -336.485,
		["z"] = 38.29,
		["cops"] = 0,
		["time"] = 300,
		["distance"] = 12,
		["type"] = "fleeca",
		["cooldown"] = 10800,
		["name"] = "Banco Fleeca",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "goldbar", ["min"] = 4, ["max"] = 5 }
		}
	},
	[32] = {
		["x"] = -353.519,
		["y"] = -55.518,
		["z"] = 49.54,
		["cops"] = 0,
		["time"] = 300,
		["distance"] = 12,
		["type"] = "fleeca",
		["cooldown"] = 10800,
		["name"] = "Banco Fleeca",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "goldbar", ["min"] = 4, ["max"] = 5 }
		}
	},
	[33] = {
		["x"] = 311.525,
		["y"] = -284.649,
		["z"] = 54.67,
		["cops"] = 0,
		["time"] = 300,
		["distance"] = 12,
		["type"] = "fleeca",
		["cooldown"] = 10800,
		["name"] = "Banco Fleeca",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "goldbar", ["min"] = 4, ["max"] = 5 }
		}
	},
	[34] = {
		["x"] = 147.210,
		["y"] = -1046.292,
		["z"] = 29.87,
		["cops"] = 0,
		["time"] = 300,
		["distance"] = 12,
		["type"] = "fleeca",
		["cooldown"] = 10800,
		["name"] = "Banco Fleeca",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "goldbar", ["min"] = 4, ["max"] = 5 }
		}
	},]]--
	[35] = {
		["x"] = -2956.449,
		["y"] = 482.090,
		["z"] = 16.2,
		["cops"] = 8,
		["time"] = 300,
		["distance"] = 12,
		["type"] = "fleeca",
		["cooldown"] = 10800,
		["name"] = "Banco Fleeca",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "goldbar", ["min"] = 7, ["max"] = 8 }
		}
	},
	--[[[36] = {
		["x"] = 1175.66,
		["y"] = 2712.939,
		["z"] = 38.59,
		["cops"] = 0,
		["time"] = 300,
		["distance"] = 12,
		["type"] = "fleeca",
		["cooldown"] = 10800,
		["name"] = "Banco Fleeca",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "goldbar", ["min"] = 4, ["max"] = 5 }
		}
	}, ]]
	[37] = {
		["x"] = 134.124,
		["y"] = -1708.138,
		["z"] = 29.7,
		["cops"] = 4,
		["time"] = 240,
		["distance"] = 10,
		["type"] = "barber",
		["cooldown"] = 3600,
		["name"] = "Barbearia",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 30000, ["max"] = 40000 }
		}
	},
	[38] = {
		["x"] = -1284.667,
		["y"] = -1115.089,
		["z"] = 7.5,
		["cops"] = 4,
		["time"] = 240,
		["distance"] = 10,
		["type"] = "barber",
		["cooldown"] = 3600,
		["name"] = "Barbearia",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 30000, ["max"] = 40000 }
		}
	},
	[39] = {
		["x"] = 1930.781,
		["y"] = 3727.585,
		["z"] = 33.35,
		["cops"] = 4,
		["time"] = 240,
		["distance"] = 10,
		["type"] = "barber",
		["cooldown"] = 3600,
		["name"] = "Barbearia",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 30000, ["max"] = 40000 }
		}
	},
	[40] = {
		["x"] = 1211.147,
		["y"] = -470.180,
		["z"] = 66.71,
		["cops"] = 4,
		["time"] = 240,
		["distance"] = 10,
		["type"] = "barber",
		["cooldown"] = 3600,
		["name"] = "Barbearia",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 30000, ["max"] = 40000 }
		}
	},
	[41] = {
		["x"] = -30.355,
		["y"] = -151.385,
		["z"] = 57.58,
		["cops"] = 4,
		["time"] = 240,
		["distance"] = 10,
		["type"] = "barber",
		["cooldown"] = 3600,
		["name"] = "Barbearia",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 30000, ["max"] = 40000 }
		}
	},
	[42] = {
		["x"] = -278.047,
		["y"] = 6231.001,
		["z"] = 32.2,
		["cops"] = 4,
		["time"] = 240,
		["distance"] = 10,
		["type"] = "barber",
		["cooldown"] = 3600,
		["name"] = "Barbearia",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 30000, ["max"] = 40000 }
		}
	},
	[43] = {
		["x"] = 265.336,
		["y"] = 220.184,
		["z"] = 102.09,
		["cops"] = 12,
		["time"] = 600,
		["distance"] = 20,
		["type"] = "bank",
		["cooldown"] = 21600,
		["name"] = "Vinewood Vault",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "goldbar", ["min"] = 15, ["max"] = 20 }
		}
	},
	[44] = {
		["x"] = -104.386,
		["y"] = 6477.150,
		["z"] = 31.83,
		["cops"] = 8,
		["time"] = 600,
		["distance"] = 12,
		["type"] = "bank",
		["cooldown"] = 21600,
		["name"] = "Savings Bank",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "goldbar", ["min"] = 12, ["max"] = 15 }
		}
	},
	[45] = {
		["x"] = 3589.37,
		["y"] = 3716.0,
		["z"] = 29.69,
		["cops"] = 9,
		["time"] = 360,
		["distance"] = 12,
		["type"] = "acoes",
		["cooldown"] = 7200,
		["name"] = "CIMED",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 1200000, ["max"] = 1500000 }
		}
	},
	[46] = {
		["x"] = -78.23,
		["y"] = 6224.34,
		["z"] = 31.1,
		["cops"] = 9,
		["time"] = 360,
		["distance"] = 12,
		["type"] = "acoes",
		["cooldown"] = 7200,
		["name"] = "Galinheiro",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 750000, ["max"] = 850000 }
		}
	},
	[47] = {
		["x"] = 990.55,
		["y"] = -2149.58,
		["z"] = 30.21,
		["cops"] = 9,
		["time"] = 360,
		["distance"] = 12,
		["type"] = "acoes",
		["cooldown"] = 7200,
		["name"] = "Frigorifico",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 750000, ["max"] = 850000 }
		}
	},
	[48] = {
		["x"] = 1982.45,
		["y"] = 3053.37,
		["z"] = 47.22,
		["cops"] = 5,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "convn",
		["cooldown"] = 7200,
		["name"] = "YellowJack",
		["required"] = "bluecard",
		["itens"] = {
			{ ["item"] = "dollars2", ["min"] = 170000, ["max"] = 210000 }
		}
	},
	[49] = {
		["x"] = -631.05,
		["y"] = -229.68,
		["z"] = 38.06,
		["cops"] = 6,
		["time"] = 240,
		["distance"] = 12,
		["type"] = "acoes",
		["cooldown"] = 7200,
		["name"] = "Joalheria",
		["required"] = "blackcard",
		["itens"] = {
			{ ["item"] = "goldbar", ["min"] = 5, ["max"] = 7 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkPolice(robberyId,coords)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if robberyProgress[vars[robberyId].type] ~= nil then
			TriggerClientEvent("Notify",source,"importante","Aguarde <b>"..robberyProgress[vars[robberyId].type].."</b> segundos.",5000)
			return false
		end

		local amountCops = vRP.numPermission("Police")
		if parseInt(#amountCops) <= parseInt(vars[robberyId].cops) then
			TriggerClientEvent("Notify",source,"aviso","Sistema indisponível no momento, tente mais tarde.",5000)
			return false
		end

		if vRP.tryGetInventoryItem(user_id,vars[robberyId].required,1,true) then
			for k,v in pairs(amountCops) do
				async(function()
					TriggerClientEvent("NotifyPush",v,{ code = 31, title = "Roubo a "..vars[robberyId].name, x = coords.x, y = coords.y, z = coords.z, rgba = {0,150,90} })
				end)
			end
			--SendWebhookMessage(webhooklinkRouboalojinha,  "User_id: [" ..user_id.."] Iniciou roubo a lojinha " ..vars[robberyId].name..  " .")
			robberyProgress[vars[robberyId].type] = vars[robberyId].cooldown

			return true
		else
			TriggerClientEvent("Notify",source,"aviso","Você precisa de <b>1x "..vRP.itemNameList(vars[robberyId].required).."</b>.",5000)
			return false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.paymentMethod(robberyId)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.wantedTimer(user_id,600)
		for k,v in pairs(vars[robberyId].itens) do
			vRP.giveInventoryItem(user_id,v.item,parseInt(math.random(v.min,v.max)),true)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(robberyProgress) do
			if robberyProgress[k] > 0 then
				robberyProgress[k] = robberyProgress[k] - 1
				if robberyProgress[k] <= 0 then
					robberyProgress[k] = nil
				end
			end
		end
		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	vCLIENT.updateVars(source,vars)
end)