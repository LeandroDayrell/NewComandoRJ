local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vGARAGE = Tunnel.getInterface("vrp_garages")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-- BD DENTRO DA CONCE
vRP._prepare("sRP/set_quantidade","UPDATE vehicles SET stock = @stock WHERE model = @model")
vRP._prepare("sRP/get_veh_by_id","SELECT * FROM vehicles WHERE model = @model")
vRP._prepare("sRP/get_veh_list","SELECT * FROM vehicles")

-- bd dentro do jogador
--vRP._prepare("vRP/get_vehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
--vRP._prepare("vRP/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle) VALUES(@user_id,@vehicle)")

RegisterServerEvent('vehicleshop.requestInfo')
AddEventHandler('vehicleshop.requestInfo', function()
    local src = source
    local rows = vRP.query("sRP/get_veh_list")
	local user_id = vRP.getUserId(src)

    local identity = vRP.getUserIdentity(user_id)
    local bank = vRP.getBankMoney(user_id)

    TriggerClientEvent('vehicleshop.receiveInfo', src, bank,  identity.name)
    
    TriggerClientEvent("vehicleshop.vehiclesInfos", src , rows)
    
    TriggerClientEvent("vehicleshop.notify", src, 'error', 'Use A e D para rodar o veiculo.')
end)


RegisterServerEvent('vehicleshop.CheckMoneyForVeh')
AddEventHandler('vehicleshop.CheckMoneyForVeh', function(veh, price, type, name, custom)
	local source = source
    local user_id = vRP.getUserId(source)    
    local rows = vRP.query("sRP/get_veh_by_id", {model = veh})
    local bank = vRP.getBankMoney(user_id)
    if #rows > 0 then
        local veiculo = rows[1]
        local vehicleModel = veh
        local vehiclePrice = price
        local colorVehicle = custom
        local stockQtd = rows[1].stock       
  
        local get_veh = vRP.query("vRP/get_vehicles", {user_id = user_id, vehicle = vehicleModel})

        if #get_veh <= 0 then
            if stockQtd > 0 then
                
                --local balance = vRP.getBankMoney(user_id)

                --if balance >= parseInt(vehiclePrice) then
                    stockQtd = stockQtd - 1	
                    vRP.paymentBank(user_id,parseInt(vehiclePrice))
                   -- vRP.setBankMoney(user_id,balance-tonumber(vehiclePrice))
                    vRP.execute("sRP/set_quantidade", {model = veh, stock = stockQtd})
                    vRP.execute("vRP/add_vehicle",{ user_id = parseInt(user_id), vehicle = vehicleModel, plate = vRP.generatePlateNumber(), phone = vRP.getPhone(user_id), work = tostring(false) })
                    --vRP.execute("vRP/add_vehicle", {user_id = user_id, vehicle = vehicleModel})
                    -- CRIAR LOG AQUI 
                    -- VEHICLEMODEL = NOME DO CARRO
                    -- USER ID = ID DO PLAYER
                    -- VEHICLEPRICE = vVALOR DO VEICULO 
                    TriggerClientEvent("vehicleshop.sussessbuy", source, name, vehiclePrice)
                    TriggerClientEvent('vehicleshop.receiveInfo', source, bank)   
                    --TriggerClientEvent('vehicleshop.spawnVehicle', source, vehicleModel)
               --[[  else
                    TriggerClientEvent("vehicleshop.notify", source, 'error', 'You dont have money.')
                   --TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
                end ]]
            else              
                TriggerClientEvent("vehicleshop.notify", source, 'error', 'Nós não temos este veículo')
              --  TriggerClientEvent("Notify",source,"aviso","Sem estoque deste veiculo!.")
            end

        else
            TriggerClientEvent("vehicleshop.notify", source, 'error', 'Voce já tem o veículo '..name..' na sua garagem.')
         --   TriggerClientEvent("Notify",source,"negado","Você <b>já possui</b> um(a) <b>"..name.."</b>!")
        end
    end
end)