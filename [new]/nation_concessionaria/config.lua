local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

config = {}
Proxy.addInterface("nation_concessionaria", config)
garage = Proxy.getInterface("nation_garages")

-------------------------------

--[[ cada veículo deve conter => { name, price, capacidade, modelo } ]]
vehList = garage.getVehList()


-- RETORNA AS INFORMAÇÕES DO VEÍCULO REFERENTE À LISTA DE VEÍCULOS (VEHLIST)
config.getVehicleInfo = function(vehicle)
	return garage.getVehicleInfo(vehicle)
end
-------------------------------


 --- MYSQL---

vRP._prepare("nation_conce/getConceVehicles","SELECT * FROM nation_concessionaria WHERE estoque > 0")

vRP._prepare("nation_conce/hasVehicle","SELECT vehicle, alugado FROM vrp_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND work = 'false'")

vRP._prepare("nation_conce/hasFullVehicle","SELECT vehicle FROM vrp_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND alugado = 0 AND work = 'false'")

vRP._prepare("nation_conce/hasRentedVehicle","SELECT vehicle FROM vrp_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND alugado = 1")

vRP._prepare("nation_conce/getMyVehicles", "SELECT * FROM vrp_vehicles WHERE user_id = @user_id AND alugado = 0 AND work = 'false'")

vRP._prepare("nation_conce/deleteRentedVehicles", "DELETE FROM vrp_vehicles WHERE alugado = 1 AND data_alugado != @data_alugado")

vRP._prepare("nation_conce/updateUserVehicle","UPDATE vrp_vehicles SET alugado = 0 WHERE user_id = @user_id AND vehicle = @vehicle")

vRP.prepare("nation_conce/addUserVehicle",[[
	INSERT IGNORE INTO vrp_vehicles(user_id,vehicle,plate,arrest,time,engine,body,fuel,ipva) 
	VALUES(@user_id,@vehicle,@plate,@detido,@time,@engine,@body,@fuel,@ipva);
]])

vRP.prepare("nation_conce/addUserRentedVehicle",[[
	INSERT IGNORE INTO vrp_vehicles(user_id,vehicle,plate,arrest,time,engine,body,fuel,ipva,alugado,data_alugado) 
	VALUES(@user_id,@vehicle,@plate,@detido,@time,@engine,@body,@fuel,@ipva,1,@data_alugado);
]])

vRP._prepare("nation_conce/removeUserVehicle","DELETE FROM vrp_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")


config.customMYSQL = true

vRP._prepare("nation_conce/createDB",[[
	ALTER TABLE vrp_vehicles ADD IF NOT EXISTS data_alugado TEXT;
]])
vRP._prepare("nation_conce/isVehicleInConce","SELECT * FROM nation_concessionaria WHERE vehicle = @vehicle")
vRP.prepare("nation_conce/addVehicle","INSERT IGNORE INTO nation_concessionaria(vehicle,estoque) VALUES(@vehicle,@estoque)")
vRP.prepare("nation_conce/removeVehicle","DELETE FROM nation_concessionaria WHERE vehicle = @vehicle")
vRP._prepare("nation_conce/addEstoque","UPDATE nation_concessionaria SET estoque = @estoque WHERE vehicle = @vehicle")
vRP._prepare("nation_conce/removeEstoque","UPDATE nation_concessionaria SET estoque = @estoque WHERE vehicle = @vehicle")
vRP._prepare("nation_conce/addCustomEstoque","UPDATE nation_concessionaria SET estoque = @estoque WHERE vehicle = @vehicle")
vRP._prepare("nation_conce/removeCustomEstoque","UPDATE nation_concessionaria SET estoque = estoque - 1 WHERE vehicle = @vehicle")

-----------


function getConceList(cb)
	Citizen.CreateThread(function()
		local vehicles = vRP.query("nation_conce/getConceVehicles") or {}
		cb(vehicles)
	end)
end


function getTopList()
	getConceList(function(list)
		local vehicleList = {}
		for k,v in ipairs(list) do
			local vehInfo = config.getVehicleInfo(v.vehicle)
			if vehInfo then
				vehicleList[#vehicleList+1] = { 
					vehicle = v.vehicle, price = vehInfo.price
				}
			end
		end
		if #vehicleList >= 5 then
			table.sort(vehicleList, function(a, b) return a.price > b.price end)
			for i = 1, 5 do
				local veh = vehicleList[i]
				config.topVehicles[i] = veh.vehicle 
			end
		end
	end)
end


-- LISTA DOS VEÍCULOS EM DESTAQUE

config.topVehicles = {	 
	"i8", 
	"laferrari15", 
	"nissangtr", 
	"z4", 
	"por911"
}

getTopList() -- pega os veículos mais caros da conce e coloca na lista de destaque

config.logo = "https://cdn.discordapp.com/attachments/765999295148720209/774428832228573245/Flow_Logo_Icon_White.png" -- LOGO DO SERVIDOR

config.imgDir = "http://131.196.198.113/vehicles/" -- DIRETORIO DAS IMAGENS DOS VEÍCULOS

config.defaultImg = "https://svgsilh.com/svg/160895.svg" -- IMAGEM DEFAULT (SERÁ EXIBIDA QUANDO NÃO EXISTIR A IMAGEM DE ALGUM VEÍCULO NO DIRETÓRIO ESPECIFICADO)

config.openconce_permission = nil -- permissao para abrir a concessionaria

config.updateconce_permission = "Admin" -- permissao para abrir o menu de gerenciamento da conce

config.porcentagem_venda = 50 -- porcentagem de venda dos veículos possuidos

config.porcentagem_testdrive = 0.1 -- porcentagem do valor do veículo paga para a realização do test drive

config.tempo_testdrive = 30 -- tempo de duração do test drive em segundos

config.maxDistance = 300 -- distância máxima (em radius(raio)) que o player poderá ir quando estiver realizando o test drive

config.porcentagem_aluguel = 20 -- porcentagem do valor do veículo paga para alugar


-- NOMES DAS CLASSES DOS VEÍCULOS

config.vehicleClasses = {
	[0] = "compact",  
	[1] = "sedan",  
	[2] = "suv",  
	[3] = "coupé",  
	[4] = "muscle",  
	[5] = "classic",  
	[6] = "sport",  
	[7] = "super",  
	[8] = "moto",  
	[9] = "off-road",  
	[10] = "industrial",  
	[11] = "utility",
	[12] = "van",
	[13] = "cycle",  
	[14] = "boat",  
	[15] = "helicopter",  
	[16] = "plane",  
	[17] = "service", 
	[18] = "emergency",  
	[19] = "military",  
	[20] = "commercial",  
	[21] = "train" 
}


-- CLASSES QUE APARECEM NO MENU DA CONCE

config.conceClasses = {
	{ class = "sedans", img = "https://img.indianautosblog.com/2018/09/25/india-bound-2019-honda-civic-images-front-three-qu-e966.jpg" },
	{ class = "suvs", img = "https://www.otokokpit.com/wp-content/uploads/2017/11/yeni-range-rover-evoque-landmark-edition-1.jpg" },
	{ class = "imports", img = "https://besthqwallpapers.com/Uploads/25-6-2019/97150/thumb2-lamborghini-gallardo-supercars-motion-blur-road-gray-gallardo.jpg" },
	{ class = "trucks", img = "https://images3.alphacoders.com/149/thumb-1920-149257.jpg" },
	--{ class = "vip", img = "https://images3.alphacoders.com/149/thumb-1920-149257.jpg" },
	{ class = "motos", img = "https://i.pinimg.com/originals/cc/92/dd/cc92dda56f23a2a41682e80e7fe0f744.jpg" },
	{ class = "outros", img = "https://besthqwallpapers.com/Uploads/13-5-2018/52433/thumb2-ford-transit-custom-sport-4k-2018-cars-motion-blur-orange-ford-transit.jpg" },
}


-- IMAGEM QUE APARECE NA SEÇÃO DE 'MEUS VEÍCULOS'

config.myVehicles_img = "https://www.itl.cat/pngfile/big/50-505834_download-nfs-hot-pursuit.jpg"



-- CLASSES DOS VEÍCULOS INSERIDAS DENTRO DAS CLASSES QUE APARECEM NA CONCE

config.availableClasses = {
	["sedans"] = {"sedan"},
	["suvs"] = {"suv"},
	["imports"] = {"classic", "sport", "super"},  
	["trucks"] = {"industrial", "utility", "commercial", "off-road"},
	["motos"] = {"moto", "cycle"},
	["outros"] = {"compact", "coupé", "muscle",  "boat",  "helicopter",  "plane",  "service", "emergency",  "military",  "train", "van"},
	--["vip"] = { "vip" },
}



-- ÍCONES DA CONCE

config.miscIcons = {
	{ description = "Força e velocidade necessárias para aquela dose de adrenalina.", img = "https://www.flaticon.com/svg/static/icons/svg/586/586141.svg" },
	{ description = "Incríveis opções econômicas que cabem no seu bolso!", img = "https://www.flaticon.com/svg/static/icons/svg/846/846117.svg" },
	{ description = "Para você que valoriza a eficácia e praticidade.", img = "https://www.flaticon.com/svg/static/icons/svg/1535/1535519.svg" },
}


-- DESCONTOS POR PERMISSAO

config.descontos = {
	{ perm = "admin.permissao", porcentagem =  50 },
	{ perm = "premium01", porcentagem =  2 },
	{ perm = "premium02", porcentagem =  3 },
	{ perm = "premium03", porcentagem =  4 },
	{ perm = "premium04", porcentagem =  6 },
	{ perm = "premium05", porcentagem =  8 },
	{ perm = "premium06", porcentagem =  10 }
}


-- FUNCÃO DE COMPRA DO VEÍCULO

config.tryBuyVehicle = function(source, user_id, vehicle, color, price, mods)
	if source and user_id and vehicle and color and price and mods then
		local data = vRP.query("nation_conce/hasVehicle", {user_id = user_id, vehicle = vehicle})
		local hasVehicle = #data > 0
		local isRented = data[1] and data[1].alugado > 0

		local maxGarages = vRP.query("vRP/get_garages", { user_id = user_id })[1].garage

		local totalVehs = #vRP.query("vRP/getVehicles", { user_id = user_id }) or 0

		if totalVehs >= maxGarages then
			return false, "garagem cheia"
		end

		if hasVehicle and not isRented then
			return false, "veículo já possuído"
		end
		--if vRP.tryFullPayment(user_id,price) then ---- dinheiro da mao
		if vRP.paymentBank(user_id,price) then --- dinheiro banco
		  
			Citizen.CreateThread(function()
				if isRented then
					vRP.execute("nation_conce/updateUserVehicle", {
						user_id = user_id, vehicle = vehicle
					})
				else 
					vRP.execute("nation_conce/addUserVehicle", {
						user_id = user_id, vehicle = vehicle, plate = vRP.generatePlateNumber(), detido = 0, time = 0, engine = 1000, body = 1000, fuel = 100, ipva = os.time()
					})
				end
				mods.customPcolor = color
				vRP.setSData("custom:u"..user_id.."veh_"..vehicle,json.encode(mods))
			end)
			return true, "sucesso!"
		else
			return false, "falha no pagamento"
		end
	end
	return false, "erro inesperado"
end




-- FUNÇÃO DE VENDA DO VEÍCULO

config.trySellVehicle = function(source, user_id, vehicle, price)
	if source and user_id and vehicle and price then

		local tipo = garage.getVehicleType(vehicle)

		if tipo and tipo == "exclusive" then
			return false,"erro"
		end

		local hasVehicle = #vRP.query("nation_conce/hasFullVehicle", {user_id = user_id, vehicle = vehicle}) > 0
		if hasVehicle then
			Citizen.CreateThread(function()
				vRP.execute("nation_conce/removeUserVehicle", {user_id = user_id, vehicle = vehicle})
				---vRP.giveMoney(user_id,parseInt(price))
				   vRP.addBank(user_id,parseInt(price))
				 
			end)
			return true, "sucesso!"
		else
			return false, "veículo alugado ou já vendido"
		end
	end
	return false, "erro inesperado"
end



-- VERIFICAÇÃO DE TEST DRIVE

config.tryTestDrive = function(source, user_id, info)
	if source and user_id and info then
		if info.tipo and info.tipo == "barco" then 
			return false, "veículo indisponivel para teste" 
		end
		local price = parseInt(info.price * (config.porcentagem_testdrive / 100))
		return true, "deseja pagar <b>$ "..vRP.format(price).."</b> para realizar o test drive em um(a) <b>"..info.modelo.."</b> ?"
	end
	return false, "erro inesperado"
end



-- VERIFICAÇÃO DO PAGAMENTO DO TEST DRIVE

config.payTest = function(source,user_id, info)
	if source and user_id and info then
		local price = parseInt(info.price * (config.porcentagem_testdrive / 100))
		if vRP.tryFullPayment(user_id, price) then
			return true, "sucesso!", price
		else
			return false, "falha no pagamento"
		end
	end
	return false, "erro inesperado"
end


-- DEVOLVER O DINHEIRO CASO NÃO DÊ PARA FAZER O TEST

config.chargeBack = function(source,user_id, price)
	if source and user_id and price then
		--vRP.giveMoney(user_id,price)
		vRP.addBank(user_id,price)
	 
		TriggerClientEvent("Notify",source,"aviso", "Você recebeu seus <b>$ "..vRP.format(price).."</b> de volta.", 3000)
	end
end



-- VERIFICAÇÃO DE ALUGUEL DO VEÍCULO

config.tryRentVehicle = function(source, user_id, info)
	if source and user_id and info then
		local hasVehicle = #vRP.query("nation_conce/hasVehicle", {user_id = user_id, vehicle = info.name}) > 0
		if hasVehicle then
			return false, "veículo já possuído"
		end
		local price = parseInt(info.price * (config.porcentagem_aluguel / 100))
		return true, "deseja pagar <b>$ "..vRP.format(price).."</b> para alugar um(a) <b>"..info.modelo.."</b> por 1 dia?"
	end
	return false, "erro inesperado"
end




-- VERIFICAÇÃO DO PAGAMENTO DO ALUGUEL DO VEÍCULO

config.tryPayRent = function(source,user_id, info)
	if source and user_id and info then
		local price = parseInt(info.price * (config.porcentagem_aluguel / 100))
		if vRP.tryFullPayment(user_id, price) then
			Citizen.CreateThread(function()
				vRP.execute("nation_conce/addUserRentedVehicle", {
					user_id = user_id, vehicle = info.name, plate = vRP.generatePlateNumber(), detido = 0, time = 0, engine = 1000, body = 1000, fuel = 100, ipva = os.time(), data_alugado = os.date("%d/%m/%Y")
				})
			end)
			return true, "sucesso!"
		else
			return false, "falha no pagamento"
		end
	end
	return false, "erro inesperado"
end






config.pt_BR = {
	allSlotsOccupied = "Todas as vagas estão ocupadas no momento.",
	testDriveStarted = "Test Drive iniciado. Não saia do veículo e nem vá para muito longe do local.",
	testDriveCanceled = "Test Drive cancelado.",
	testDriveAborted = "Você se afastou muito do local do test.",
	testVehicleUnavailable = "Veículo indisponível para test drive.",
	testFinished = "Test Drive finalizado com sucesso.",
	managementCommand = "conce",
	outStock = "veículo fora de estoque",
	alreadyBought = "veículo já possuído",
	error = "erro inesperado",
	dealerUpdated = "Concessionária atualizada com sucesso!",
	vehicleAdded = function(qtd,vehicle) return "Adicionado(s) <b>"..qtd.." "..vehicle.."</b> à concessionária!" end,
	vehicleRemoved = function(qtd,vehicle) return "Removido(s) <b>"..qtd.." "..vehicle.."</b> à concessionária!" end,
	noIdentifiedVehicle = "Veículo não identificado.",
	invalidQuantity = "Quantidade inválida.",
	success = "sucesso!",
	paymentFailed = "falha no pagamento!",
	cantBeSelled = "Veículo não pode ser vendido",
	rentedVehicle = "veículo alugado ou já vendido",
	testConfirmation = function(price,vehicle) return "deseja pagar <b>$ "..price.."</b> para realizar o test drive em um(a) <b>"..vehicle.."</b> ?" end,
	chargeBack = function(price) return "Você recebeu seus <b>$ "..price.."</b> de volta." end,
	rentConfirmation = function(price,vehicle) return "deseja pagar <b>$ "..price.."</b> para alugar um(a) <b>"..vehicle.."</b> por 1 dia?" end

}

config.lang = config.pt_BR
lang = config.lang

-- LOCAIS DAS CONCESSIONARIAS E REALIZAÇÃO DE TESTES

config.locais = {
	{ 
		conce = vec3(-57.18,-1096.45,26.43), 
		test_locais = {
			{ coords = vec3(-11.25,-1080.46,26.68), h = 129.4 },
			{ coords = vec3(-14.11,-1079.84,26.67), h = 122.02 },
			{ coords = vec3(-16.43,-1078.62,26.67), h = 126.74 },
			{ coords = vec3(-8.45,-1081.58,26.67), h = 117.45 },
		}
	},
	{ 
	conce = vec3(-5451.07,-3682.36,88.97),
		test_locais = {
			{ coords = vec3(-1177.30,-1743.51,4.04), h = 204.54 },
			{ coords = vec3(-1173.95,-1741.34,4.05), h = 212.41 },
			{ coords = vec3(-1171.41,-1739.55,4.07), h = 210.01 },
		} 
	},
}


config.testStatus = function(player, status)
	if status then
		SetPlayerRoutingBucket(player, math.random(1000)) 
	else
		SetPlayerRoutingBucket(player, 0) 
	end
end



RegisterServerEvent('nationConce:getConfig')
AddEventHandler('nationConce:getConfig', function()
	local source = source
    TriggerClientEvent("nationConce:setConfig", source, config)
end)


