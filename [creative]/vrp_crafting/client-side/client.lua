-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_crafting",cRP)
vSERVER = Tunnel.getInterface("vrp_crafting")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(data)
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideNUI" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestCrafting",function(data,cb)
	local inventoryCraft,inventoryUser,weight,maxweight,infos = vSERVER.requestCrafting(data.craft)
	if inventoryCraft then
		cb({ inventoryCraft = inventoryCraft, inventoryUser = inventoryUser, weight = weight, maxweight = maxweight, infos = infos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONCRAFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionCraft",function(data,cb)
	vSERVER.functionCrafting(data.index,data.craft,data.amount,data.slot)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONDESTROY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionDestroy",function(data,cb)
	vSERVER.functionDestroy(data.index,data.craft,data.amount,data.slot)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot",function(data,cb)
	TriggerServerEvent("vrp_crafting:populateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(data,cb)
	TriggerServerEvent("vrp_crafting:updateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATECRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.updateCrafting(action)
	SendNUIMessage({ action = action })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local craftList = {
	{ 107.39,-1306.17,28.76,"unktecCrafting" },
    { 1388.33,3612.79,38.94,"yakuzaCrafting" },
    { 606.92,-3095.50,6.06,"mafiaCrafting" },
    { 1118.33,-1997.97,35.43,"miliciaCrafting" },
    { 2435.58,4965.10,42.35,"mcCrafting" },
	{ 707.21,-966.96,30.42,"bahamasCrafting" },
	{ -1391.24,-607.94,30.32,"bahamas2Crafting" },
    { 472.1,-1310.81,29.22,"bennysCrafting" },
    { 145.98,-2199.72,4.69,"lowriderCrafting" },
    { 1270.75,-202.44,101.29,"laranjaCrafting" },
    { 1383.63,-774.53,67.36,"azulCrafting" },
    { 1268.07,-204.56,103.61,"vermelhoCrafting" },
    { 2827.59,2793.61,57.68,"verdeCrafting" },
	{ -347.43,-117.01,39.25,"mecanicoCrafting" }
	
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for k,v in pairs(craftList) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 1.5 then
					timeDistance = 4
					DrawText3D(v[1],v[2],v[3],"~g~E~w~   ABRIR")
					if IsControlJustPressed(1,38) and vSERVER.requestPerm(v[4]) then
						SetNuiFocus(true,true)
						SendNUIMessage({ action = "showNUI", name = tostring(v[4]) })
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 450
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end