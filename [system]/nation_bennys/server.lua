local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

API = {}
Tunnel.bindInterface("nation_bennys",API)

local using_bennys = {}

vAZgarages = Proxy.getInterface('az-garages')

function API.checkPermission()
    return vRP.hasPermission(vRP.getUserId(source), "LosSantos")
end

function API.getSavedMods(vehicle_plate)
    local vehicle = vAZgarages.getServerVehicleByPlate(vehicle_plate)
    if vehicle ~= nil then
        return json.decode(vehicle.tuning) or {}
    end
    return nil
end

function API.checkPayment(amount)
    if not tonumber(amount) then
        return false
    end

    local source = source
    local user_id = vRP.getUserId(source)
    if not vRP.paymentBank(user_id ,tonumber(amount)) or vRP.tryGetInventoryItem(user_id,"dollars",tonumber(amount)) then
        TriggerClientEvent("Notify",source,"negado","Você não possui dinheiro suficiente.",7000)
        return false
    end
    TriggerClientEvent("Notify",source,"sucesso","Modificações aplicadas com <b>sucesso</b><br>Você pagou <b>$"..tonumber(amount).." dólares<b>.",7000)
    return true
end

function API.repairVehicle(vehicle, damage)

    TriggerEvent("tryreparar", vehicle)
    return true
end

function API.removeVehicle(vehicle)
    using_bennys[vehicle] = nil
    return true
end

function API.checkVehicle(vehicle)
    if using_bennys[vehicle] then
        return false
    end
    using_bennys[vehicle] = true
    return true
end
function API.saveVehicle(vehicle_plate, vehicle_mods)
    vAZgarages.setTuningVehicleByPlate(vehicle_plate, vehicle_mods)
    return true
end


RegisterServerEvent("nation:syncApplyMods")
AddEventHandler("nation:syncApplyMods",function(vehicle_tuning,vehicle)
    TriggerClientEvent("nation:applymods_sync",-1,vehicle_tuning,vehicle)
end)

-- [[!-!]] jbCxvrO7sNzGxsnNg8zIz8nOxsjOys3LzsbPzc/HzQ== [[!-!]] --