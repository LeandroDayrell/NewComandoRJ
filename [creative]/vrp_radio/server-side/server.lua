-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_radio",cRP)
vCLIENT = Tunnel.getInterface("vrp_radio")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEFREQUENCY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.activeFrequency(freq)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(freq) >= 1 and parseInt(freq) <= 999 then
			if parseInt(freq) == 190 then
				--print('TESTE 01')
				if vRP.hasPermission(user_id,"Police") then
					--print('TESTE 02')
					vCLIENT.startFrequency(source,190)
					TriggerClientEvent("vrp_hud:RadioDisplay",source,190)
					TriggerClientEvent("Notify",source,"sucesso","Rádio <b>"..parseInt(freq)..".0Mhz</b>.",5000)
					--print('TESTE 03')
				end
			elseif parseInt(freq) == 191 then
				if vRP.hasPermission(user_id,"Police") then
					vCLIENT.startFrequency(source,191)
					TriggerClientEvent("vrp_hud:RadioDisplay",source,191)
					TriggerClientEvent("Notify",source,"sucesso","Rádio <b>"..parseInt(freq)..".0Mhz</b>.",5000)
				end
			elseif parseInt(freq) == 192 then
				if vRP.hasPermission(user_id,"Paramedic") then
					vCLIENT.startFrequency(source,192)
					TriggerClientEvent("vrp_hud:RadioDisplay",source,192)
					TriggerClientEvent("Notify",source,"sucesso","Rádio <b>"..parseInt(freq)..".0Mhz</b>.",5000)
				end
			else
				vCLIENT.startFrequency(source,parseInt(freq))
				--print('TESTE 04')
				TriggerClientEvent("vrp_hud:RadioDisplay",source,parseInt(freq))
				TriggerClientEvent("Notify",source,"sucesso","Rádio <b>"..parseInt(freq)..".0Mhz</b>.",5000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKRADIO
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkRadio()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"radio") < 1 then
			return true
		end
		return false
	end
end