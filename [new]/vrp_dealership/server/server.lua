local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vRP._prepare("sRP/set_quantidade","UPDATE vehicles SET stock = @stock WHERE model = @model") -- LOJA DE CARRO
vRP._prepare("sRP/get_veh_by_id","SELECT * FROM vehicles WHERE model = @model") -- LOJA DE CARRO
vRP._prepare("sRP/get_veh_list","SELECT * FROM vehicles") -- LOJA DE CARRO



vRP._prepare("vRP/get_vehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")  -- VEICULO DO PLAYER
--vRP._prepare("vRP/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle) VALUES(@user_id,@vehicle)")


vRP._prepare("vRP/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id, model, plate, trunk, tuning) VALUES(@user_id, @model, @plate, '[]', '[]')")
--vRP._prepare("vRP/add_vehicle", "INSERT IGNORE INTO vrp_user_vehicles(user_id,model) VALUES(@user_id,@model)")
vRP._prepare("vRP/remove_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND model = @model") --
vRP._prepare("vRP/remove_vrp_srv_data","DELETE FROM vrp_srv_data WHERE dkey = @dkey")
vRP._prepare("vRP/get_vehicles","SELECT model FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("vRP/get_vehicle", "SELECT model FROM vrp_user_vehicles WHERE user_id = @user_id AND model = @model")
vRP._prepare("vRP/count_vehicle","SELECT COUNT(*) as qtd FROM vrp_user_vehicles WHERE model = @model")
vRP._prepare("vRP/get_maxcars","SELECT COUNT(model) as quantidade FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("vRP/get_total_carros_tipo","SELECT model, count(1) total FROM vrp.vrp_user_vehicles GROUP BY model")
vRP._prepare("vRP/move_vehicle","UPDATE vrp_user_vehicles SET user_id = @tuser_id WHERE user_id = @user_id AND model = @model")

--------- ADICIONADO DO AZTEC

vRP._prepare('vAZ/GetPlayerVehicles', 'SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id')
vRP._prepare('vAZ/GetPlayerVehiclePlate', 'SELECT * FROM vrp_user_vehicles WHERE plate = @plate')
vRP._prepare('vAZ/GetPlayerVehicleModel', 'SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND model = @model')

vAZgarage = Proxy.getInterface('az-garages')

RegisterServerEvent('vehicleshop.requestInfo')
AddEventHandler('vehicleshop.requestInfo', function()
    local src = source
    local rows = vRP.query("sRP/get_veh_list")
	local user_id = vRP.getUserId(src)

    local identity = vRP.getUserIdentity(user_id)
    local bank = vRP.getBankMoney(user_id)

    TriggerClientEvent('vehicleshop.receiveInfo', src, bank,  identity.name)
    
    TriggerClientEvent("vehicleshop.vehiclesInfos", src , rows)
    
    TriggerClientEvent("vehicleshop.notify", src, 'error', 'Use A and D to rotate vehicle.')
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
  
        local get_veh = vRP.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicleModel})

        if #get_veh <= 0 then
            if stockQtd > 0 then

                local balance = vRP.getBankMoney(user_id)

                if vRP.tryGetInventoryItem(user_id,"dollars",vehiclePrice,true) then
                    stockQtd = stockQtd - 1	

                    --vRP.setBankMoney(user_id,balance-tonumber(vehiclePrice))
                    --if vRP.tryGetInventoryItem(user_id,"dollars",vehiclePrice)
                    vRP.execute("sRP/set_quantidade", {model = veh, stock = stockQtd})
                    vRP.execute("vRP/add_vehicle", {user_id = user_id, model = vehicleModel, plate = vAZgarage.generatePlate(), ipva = os.time() })
                    print(model)
                    print(user_id)
                    print(plate)
                    print(vehicleModel)
                    TriggerClientEvent("vehicleshop.sussessbuy", source, name, vehiclePrice)
                    TriggerClientEvent('vehicleshop.receiveInfo', source, bank)   
                    TriggerClientEvent('vehicleshop.spawnVehicle', source, vehicleModel)
                else
                    TriggerClientEvent("vehicleshop.notify", source, 'error', 'Voce nao tem dinheiro')
                   --TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
                end
            else              
                TriggerClientEvent("vehicleshop.notify", source, 'error', 'Nós não temos este veículo.')
              --  TriggerClientEvent("Notify",source,"aviso","Sem estoque deste veiculo!.")
            end

        else
            TriggerClientEvent("vehicleshop.notify", source, 'error', 'Voce ja tem um '..name..' em sua garagem..')
         --   TriggerClientEvent("Notify",source,"negado","Você <b>já possui</b> um(a) <b>"..name.."</b>!")
        end
    end
end)