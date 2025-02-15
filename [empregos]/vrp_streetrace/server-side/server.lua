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
Tunnel.bindInterface("vrp_streetrace",cRP)
vCLIENT = Tunnel.getInterface("vrp_streetrace")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local race = 1
local totalRaces = 16
corridaStart = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTRACE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkTicket()
	local source = source
	local user_id = vRP.getUserId(source)
	--local copAmount = vRP.numPermission("Police")
	if user_id then
		if vRP.wantedReturn(user_id) then
			return false
		end

		if vRP.tryGetInventoryItem(user_id,"raceticket",1) then
			TriggerEvent("vrp_blipsystem:serviceEnter",source,"Corredor",75)
			vRP.upgradeStress(user_id,5)
			return true
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
			TriggerClientEvent("Notify",v,"importante","Recebemos um relato de um corredor ilegal.",5000)
		end)
	end
	return parseInt(race)
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
		Citizen.Wait(5*60000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.paymentMethod(vehPlate)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.wantedTimer(user_id,300)
		TriggerEvent("vrp_blipsystem:serviceExit",source)
		vRP.giveInventoryItem(user_id,"dollars2",parseInt(math.random(15500,16000)),true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEFUSAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("defusar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") then
			local nplayer = vRPclient.getNearestPlayer(source,10)
			if nplayer then
				vCLIENT.defuseRace(nplayer)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_STREETRACE:EXPLOSIVEPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_streetrace:explosivePlayers")
AddEventHandler("vrp_streetrace:explosivePlayers",function()
	local source = source
	TriggerEvent("vrp_blipsystem:serviceExit",source)
end)