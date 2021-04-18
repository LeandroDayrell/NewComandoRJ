--discord.gg/sergin

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

sergin = {}
Tunnel.bindInterface("nation_bennys",sergin)
Tunnel.bindInterface('az-garages', vAZ)
cnVRP = Proxy.getInterface('vrp_garages')

local using_bennys = {}

function sergin.checkPermission()
    local source = source
    print("sdfdfed")
    return vRP.hasPermission(vRP.getUserId(source), "Admin")
end

function sergin.getSavedMods(vehicle_name, vehicle_plate)
    local vehicle,vehNet,vehPlate,vehName = vRP.vehList(source,7)
    local source = source
    local user_id = vRP.getUserId(source)
    --local vehicle_owner_id = vRP.getUserByRegistration(vehicle_plate)
    print('Save no custom')
   --print(vehicle_owner_id)
    return json.decode(vRP.getSData("custom:u" .. user_id .. "veh_" .. tostring(vehicle_name)) or {}) or {}
end

function sergin.checkPayment(amount)
    if not tonumber(amount) then
        return false
    end

    local source = source
    local user_id = vRP.getUserId(source)
    if not vRP.tryGetInventoryItem(user_id, "dollars",tonumber(amount)) then
        TriggerClientEvent("Notify",source,"negado","Você não possui dinheiro suficiente.",7000)
        return false
    end
    TriggerClientEvent("Notify",source,"sucesso","Modificações aplicadas com <b>sucesso</b><br>Você pagou <b>$"..tonumber(amount).." dólares<b>.",7000)
    return true
end

function sergin.repairVehicle(vehicle, damage)
    local vehicle,vehNet,vehPlate,vehName = vRPclient.vehList(source,7)
    TriggerEvent("tryreparar", vehicle)
    return true
end

function sergin.removeVehicle(vehicle)
    using_bennys[vehicle] = nil
    return true
end

function sergin.checkVehicle(vehicle)
    if using_bennys[vehicle] then
        return false
    end
    using_bennys[vehicle] = true
    return true
end
function sergin.saveVehicle(vehicle_name, vehicle_plate, vehicle_mods)
   -- local vehicle_owner_id = vRP.getUserByRegistration(vehicle_plate)
   local source = source
   local user_id = vRP.getUserId(source)
    local vehicle,vehNet,vehPlate,vehName = vRP.vehList(source,7)
    local vehPlate = vehicle_owner_id
    vRP.setSData("custom:u" .. user_id .. "veh_" .. tostring(vehicle_name),json.encode(vehicle_mods))
    return true
end


RegisterServerEvent("nation:syncApplyMods")
AddEventHandler("nation:syncApplyMods",function(vehicle_tuning,vehicle)
    TriggerClientEvent("nation:applymods_sync",-1,vehicle_tuning,vehicle)
end)

-- [[!-!]] 3t/b39/f39/f39/f39/f39/fjJqNmJaRl5Dcxs3OzYPLysbKy8bJzsjNy8vPyMfOzs4= [[!-!]] --