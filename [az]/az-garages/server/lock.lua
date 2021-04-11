--[[ az-garages:lock ]]--

vAZ.ToggleVehicleLock = function(entity, hash, plate)
    local source = source
    local user_id = vRP.getUserId(source)    
    if vRP.getUserIdentity(user_id).registration == plate:gsub("% ", "") then
        vAZclient.ToggleVehicleLock(source, entity)
        TriggerClientEvent("vrp_sound:source", source, 'lock', 0.1)
    else
        local data = vAZ.getServerVehicle('hash', hash)
        if data ~= nil then
            local vehicle = vAZ.getServerVehicleByPlate(plate)
            if vehicle ~= nil then
                if vehicle.user_id == user_id and vehicle.model == data.model then
                    vAZclient.ToggleVehicleLock(source, entity)
                    TriggerClientEvent("vrp_sounFd:source", source, 'lock', 0.1)
                end
            end            
        end
    end    
end

vAZ.ToggleLock = function(vehicle)
    vAZclient.ToggleLock(-1, vehicle)
end