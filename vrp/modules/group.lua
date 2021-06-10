local permissions = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.hasPermission(user_id,perm)
	local consult = vRP.query("vRP/get_group",{ user_id = user_id, permiss = tostring(perm) })
	if consult[1] then
		return true
	else
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NUMPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.numPermission(perm)
	local users = {}
	for k,v in pairs(permissions) do
		if v == perm then
			table.insert(users,parseInt(k))
		end
	end
	return users
end

function vRP.getUsersByPermission(perm)
	local users = {}
	for k,v in pairs(vRP.rusers) do
		if vRP.hasPermission(tonumber(k),perm) then
			table.insert(users,tonumber(k))
		end
	end
	return users
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- NUMPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.insertPermission(source,perm)
	permissions[tostring(source)] = tostring(perm)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NUMPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.removePermission(source,perm)
	if permissions[tostring(source)] then
		permissions[tostring(source)] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERLEAVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerLeave",function(user_id,source)
	if permissions[tostring(source)] then
		permissions[tostring(source)] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if vRP.hasPermission(user_id,"Police") then
		permissions[tostring(source)] = "Police"
		TriggerClientEvent("vrp_tencode:StatusService",source,true)
		TriggerEvent("vrp_blipsystem:serviceEnter",source,"Policial",77)
	elseif vRP.hasPermission(user_id,"chamado") then
		permissions[tostring(source)] = "chamado" 


	-- PARAMEDICOS
	elseif vRP.hasPermission(user_id,"SamuEnfermeiro") then
		permissions[tostring(source)] = "SamuEnfermeiro"
		TriggerEvent("vrp_blipsystem:serviceEnter",source,"Paramedico",25)
	elseif vRP.hasPermission(user_id,"SamuMedico") then
		permissions[tostring(source)] = "SamuMedico"
		TriggerEvent("vrp_blipsystem:serviceEnter",source,"Paramedico",25)
	elseif vRP.hasPermission(user_id,"SamuCoordenador") then
		permissions[tostring(source)] = "SamuCoordenador"
		TriggerEvent("vrp_blipsystem:serviceEnter",source,"Paramedico",25)
	elseif vRP.hasPermission(user_id,"SamuViceDiretor") then
		permissions[tostring(source)] = "SamuViceDiretor"
		TriggerEvent("vrp_blipsystem:serviceEnter",source,"Paramedico",25)
	elseif vRP.hasPermission(user_id,"SamuDiretor") then
		permissions[tostring(source)] = "SamuDiretor"
		TriggerEvent("vrp_blipsystem:serviceEnter",source,"Paramedico",25)
	elseif vRP.hasPermission(user_id,"Paramedic") then
		permissions[tostring(source)] = "Paramedic"
		TriggerEvent("vrp_blipsystem:serviceEnter",source,"Paramedico",25)	

		-- LOS SANTOS
	elseif vRP.hasPermission(user_id,"LosSantos") then
		permissions[tostring(source)] = "LosSantos"
		TriggerEvent("vrp_blipsystem:serviceEnter",source,"LosSantos",56)

	-- TAXISTA
	elseif vRP.hasPermission(user_id,"Taxista") then
		permissions[tostring(source)] = "Taxista"
		TriggerEvent("vrp_blipsystem:serviceEnter",source,"Taxista",5)

	-- ADMINISTRACAO
	elseif vRP.hasPermission(user_id,"sup2000") then
		permissions[tostring(source)] = "sup2000"
	elseif vRP.hasPermission(user_id,"modder21") then
		permissions[tostring(source)] = "modder21"
	elseif vRP.hasPermission(user_id,"adms58") then
		permissions[tostring(source)] = "adms58"
		--TriggerEvent("vrp_blipsystem:serviceEnter",source,"sup2000",85)
	end
end)