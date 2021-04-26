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
Tunnel.bindInterface("vrp_barbershop",cRP)
vCLIENT = Tunnel.getInterface("vrp_barbershop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARBER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkOpen()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.wantedReturn(user_id) and not vRP.reposeReturn(user_id) then
			return true
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESKIN
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.updateSkin(myClothes,bool)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not bool then
			vRP.execute("vRP/updateSkin",{ 
				user_id = parseInt(user_id),
				fathers = parseInt(myClothes[1]),
				kinship = parseInt(myClothes[2]),
				eyecolor = parseInt(myClothes[3]),
				skincolor = parseInt(myClothes[4]),
				acne = parseInt(myClothes[5]),
				stains = parseInt(myClothes[6]),
				freckles = parseInt(myClothes[7]),
				aging = parseInt(myClothes[8]),
				hair = parseInt(myClothes[9]),
				haircolor = parseInt(myClothes[10]),
				haircolor2 = parseInt(myClothes[11]),
				makeup = parseInt(myClothes[12]),
				makeupintensity = parseInt(myClothes[13]),
				makeupcolor = parseInt(myClothes[14]),
				lipstick = parseInt(myClothes[15]),
				lipstickintensity = parseInt(myClothes[16]),
				lipstickcolor = parseInt(myClothes[17]),
				eyebrow = parseInt(myClothes[18]),
				eyebrowintensity = parseInt(myClothes[19]),
				eyebrowcolor = parseInt(myClothes[20]),
				beard = parseInt(myClothes[21]),
				beardintentisy = parseInt(myClothes[22]),
				beardcolor = parseInt(myClothes[23]),
				blush = parseInt(myClothes[24]),
				blushintentisy = parseInt(myClothes[25]),
				blushcolor = parseInt(myClothes[26]) 
			})
		else

			vRP.execute("vRP/NewupdateSkin",{ 
				user_id = parseInt(user_id),
				
				hair = parseInt(myClothes[9]),
				haircolor = parseInt(myClothes[10]),
				haircolor2 = parseInt(myClothes[11]),
				makeup = parseInt(myClothes[12]),
				makeupintensity = parseInt(myClothes[13]),
				makeupcolor = parseInt(myClothes[14]),
				lipstick = parseInt(myClothes[15]),
				lipstickintensity = parseInt(myClothes[16]),
				lipstickcolor = parseInt(myClothes[17]),
				eyebrow = parseInt(myClothes[18]),
				eyebrowintensity = parseInt(myClothes[19]),
				eyebrowcolor = parseInt(myClothes[20]),
				beard = parseInt(myClothes[21]),
				beardintentisy = parseInt(myClothes[22]),
				beardcolor = parseInt(myClothes[23]),
				blush = parseInt(myClothes[24]),
				blushintentisy = parseInt(myClothes[25]),
				blushcolor = parseInt(myClothes[26]) 
			})
			

		end
	end
end


RegisterCommand([[abada]],function(source)
	local user_id = vRP.getUserId(source)
	-- VRP_BARBERSHOP
	local barberData = vRP.query("vRP/selectSkin",{ user_id = parseInt(user_id) })
	if barberData[1] then
		TriggerClientEvent("vrp_barbershop:setCustomization",source,{ 
			parseInt(barberData[1].fathers),
			parseInt(barberData[1].kinship),
			parseInt(barberData[1].eyecolor),
			parseInt(barberData[1].skincolor),
			parseInt(barberData[1].acne),
			parseInt(barberData[1].stains),
			parseInt(barberData[1].freckles),
			parseInt(barberData[1].aging),
			parseInt(barberData[1].hair),
			parseInt(barberData[1].haircolor),
			parseInt(barberData[1].haircolor2),
			parseInt(barberData[1].makeup),
			parseInt(barberData[1].makeupintensity),
			parseInt(barberData[1].makeupcolor),
			parseInt(barberData[1].lipstick),
			parseInt(barberData[1].lipstickintensity),
			parseInt(barberData[1].lipstickcolor),
			parseInt(barberData[1].eyebrow),
			parseInt(barberData[1].eyebrowintensity),
			parseInt(barberData[1].eyebrowcolor),
			parseInt(barberData[1].beard),
			parseInt(barberData[1].beardintentisy),
			parseInt(barberData[1].beardcolor),
			parseInt(barberData[1].blush),
			parseInt(barberData[1].blushintentisy),
			parseInt(barberData[1].blushcolor),
			barberData[1].shapemix,
			barberData[1].eyebrowsheight,
			barberData[1].eyebrowswidth,
			barberData[1].nosewidth,
			barberData[1].noseheight,
			barberData[1].noselength,
			barberData[1].nosebridge,
			barberData[1].nosetip,
			barberData[1].noseshift,
			barberData[1].cheekboneheight,
			barberData[1].cheekbonewidth,
			barberData[1].cheekswidth,
			barberData[1].lipswidth,
			barberData[1].jawwidth,
			barberData[1].jawheight,
			barberData[1].chinlength,
			barberData[1].chinposition,
			barberData[1].chinwidth,
			barberData[1].chinshape,
			barberData[1].neckwidth,
			barberData[1].chestmodel,
			barberData[1].chestcolor,
			barberData[1].sundamagemodel,
			parseInt(barberData[1].chestmodel),
			parseInt(barberData[1].chestcolor),
			parseInt(barberData[1].sundamagemodel)
		})
		Wait(1000)
		TriggerClientEvent("update:skin",source,barberData)

	else
		vRP.execute("vRP/insertSkin",{ user_id = parseInt(user_id) })
	end
end)