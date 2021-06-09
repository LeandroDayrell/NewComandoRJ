-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_rotapm",cRP)
vCLIENT = Tunnel.getInterface("vrp_rotapm")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local race = 1
local totalRaces = 3
corridaStart = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTRACE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.permissao()
	local source = source
	local user_id = vRP.getUserId(source)
	--local copAmount = vRP.numPermission("Police")
	if user_id then

		if vRP.hasPermission(user_id,"Police") then --
			---TriggerEvent("vrp_blipsystem:serviceEnter",source,"Corredor",75)
			--vRP.upgradeStress(user_id,5)
			return true
		else 
		TriggerClientEvent("Notify",source,"negado","Voce nao tem permissao.",5000)
		end
		return false
	end
end

 function cRP.checkPolice()
	local source = source
	local copAmount = vRP.numPermission("Police")
	if parseInt(#copAmount) <= 2 then
		TriggerClientEvent("Notify",source,"aviso","Sistema indisponível no momento, tente mais tarde.",5000)
		return false
		--TriggerClientEvent("Notify",source,"aviso","Sistema indisponível no momento, tente mais tarde.",5000)
	else
		TriggerClientEvent("Notify",source,"sucesso","CORRIDA INICIADA.",10000)
		return true
	end
end 
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTRACE
-----------------------------------------------------------------------------------------------------------------------------------------
 function cRP.startRace()
	local copAmount = vRP.numPermission("Police")
	for k,v in pairs(copAmount) do
		async(function() ---
			--TriggerClientEvent("Notify",v,"importante","Recebemos um relato de um corredor ilegal.",5000)
		end)
	end
	return parseInt(race)
end 

function cRP.finishRacePagamento()
	TriggerClientEvent("Notify",source,"sucesso","Voce recebeu uma bonificacao por terminar sua rota.",5000)
end 


function cRP.callPolice(x,y,z)
	local copAmount = vRP.numPermission("Police")
	for k,v in pairs(copAmount) do
		async(function()
			TriggerClientEvent("NotifyPush",v,{ code = 31, title = "UM CORREDOR ILEGAL PASSOU EM UM RADAR", x = x, y = y, z = z, rgba = {170,80,25} })
		end)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RANDOMPOINT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		race = math.random(totalRaces)
		Citizen.Wait(5*10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.paymentMethod(vehPlate)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		--vRP.wantedTimer(user_id,300)
		--TriggerEvent("vrp_blipsystem:serviceExit",source)
		vRP.giveInventoryItem(user_id,"dollars",parseInt(math.random(230,300)),true)
	end
end 

function cRP.pagamentoPolice(vehPlate)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		--vRP.wantedTimer(user_id,300)
		---TriggerEvent("vrp_blipsystem:serviceExit",source)
		vRP.giveInventoryItem(user_id,"dollars",parseInt(math.random(70,85)),true)
	end
end
