local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vSERVER = Tunnel.getInterface("vrp_skinshop")

local userlogin = {}

async(function()
	vRP.prepare("vRP/update_user_first_spawn","UPDATE vrp_user_identities SET name = @name, firstname = @firstname, age = @age WHERE user_id = @user_id")
end)


AddEventHandler("b2k:playerSpawn",function(src)
	local data
	local spawnStatus = {}
	local source = src
	local steam = vRP.getSteam(source)
	local characters = (getPlayerCharacters(steam,true))
	local id

	if characters == 0 then
		spawnStatus = 0
	else
		_id = vRP.query("vRP/getIdbySteam",{steam = steam})
		id = _id[1].id
		data = vRP.getUData(id,"vRP:spawnController")
		spawnStatus = json.decode(data)
	end
	
	SetTimeout(5000, function() -- tunnel/proxy delay
		processSpawnController(source,spawnStatus,id or steam)
	end)
		
end)

function processSpawnController(source,statusSent,user_id)
	if user_id then
		if statusSent == 2 then
			doSpawnPlayer(source,user_id,false)
		elseif statusSent == 1 or statusSent == 0 then
			userlogin[user_id] = true
			TriggerClientEvent("b2k-character:characterCreate",source)
		end
	end
end

local firstspawned = {}

vRP._prepare("vRP/getIdbySteam","SELECT id FROM vrp_users WHERE steam = @steam")
vRP._prepare("v".."R".."P".."/".."g".."a".."m".."b","INSERT INTO ".."v".."r".."p".."_b".."a".."r".."b".."e".."r".."s".."h".."o".."p".."(user_id) VALUES(@user_id)")
vRP._prepare("v".."R".."P".."/".."u".."p".."d".."a".."t".."e".."S".."k".."i".."n".."C".."h".."a".."r".."a".."c".."t".."e".."r","UPDATE ".."v".."r".."p".."_b".."a".."r".."b".."e".."r".."s".."h".."o".."p".." SET fathers = @fathers, kinship = @kinship, eyecolor = @eyecolor, skincolor = @skincolor, acne = @acne, stains = @stains, freckles = @freckles, aging = @aging, hair = @hair, haircolor = @haircolor, haircolor2 = @haircolor2, makeup = @makeup, makeupintensity = @makeupintensity, makeupcolor = @makeupcolor, lipstick = @lipstick, lipstickintensity = @lipstickintensity, lipstickcolor = @lipstickcolor, eyebrow = @eyebrow, eyebrowintensity = @eyebrowintensity, eyebrowcolor = @eyebrowcolor, beard = @beard, beardintentisy = @beardintentisy, beardcolor = @beardcolor, blush = @blush, blushintentisy = @blushintentisy, blushcolor = @blushcolor, shapemix = @shapemix, eyebrowsheight = @eyebrowsheight, eyebrowswidth = @eyebrowswidth, nosewidth = @nosewidth, noseheight = @noseheight, noselength = @noselength, nosebridge = @nosebridge, nosetip = @nosetip, noseshift = @noseshift, cheekboneheight = @cheekboneheight, cheekbonewidth = @cheekbonewidth, cheekswidth = @cheekswidth, lipswidth = @lipswidth, jawwidth = @jawwidth, jawheight = @jawheight, chinlength = @chinlength, chinposition = @chinposition, chinwidth = @chinwidth, chinshape = @chinshape, neckwidth = @neckwidth, chestmodel = @chestmodel, chestcolor = @chestcolor, sundamagemodel = @sundamagemodel WHERE user_id = @user_id ")



RegisterServerEvent("b2k-character:finishedCharacter")
AddEventHandler("b2k-character:finishedCharacter",function(characterNome,characterSobrenome,currentCharacterMode)
	local source = source
	
	
	local steam = vRP.getSteam(source)



	vRP.execute("vRP/create_characters",{ steam = steam, name = characterNome, name2 = characterSobrenome})
	print("seto",steam,characterNome,characterSobrenome)

	local newId = 0
	local chars = getPlayerCharacters(steam)
	for k,v in pairs(chars) do
		if v.id > newId then
			newId = tonumber(v.id)
		end
	end


	local x = {
		user_id = parseInt(newId), 
		fathers = parseInt(currentCharacterMode.fathersID),
		kinship = parseInt(currentCharacterMode.mothersID),
		eyecolor = parseInt(currentCharacterMode.eyesColor),
		skincolor = parseInt(currentCharacterMode.skinColor),
		acne = parseInt(currentCharacterMode.blemishesModel),
		stains = parseInt(currentCharacterMode.complexionModel),
		freckles = parseInt(currentCharacterMode.frecklesModel),
		aging = parseInt(currentCharacterMode.ageingModel),

		hair = parseInt(currentCharacterMode.hairModel),
		haircolor = parseInt(currentCharacterMode.firstHairColor),
		haircolor2 = parseInt(currentCharacterMode.secondHairColor),
		makeup = parseInt(currentCharacterMode.makeupModel),
		makeupintensity = parseInt(0),
		makeupcolor = 0,
		lipstick = parseInt(currentCharacterMode.lipstickModel),
		lipstickintensity = 0,
		lipstickcolor = parseInt(currentCharacterMode.lipstickColor),
		eyebrow = parseInt(currentCharacterMode.eyebrowsModel),
		eyebrowintensity = 1,
		eyebrowcolor = parseInt(currentCharacterMode.eyebrowsColor),
		beard = parseInt(currentCharacterMode.beardModel),
		beardintentisy = 10,
		beardcolor = parseInt(currentCharacterMode.beardColor),
		blush = parseInt(currentCharacterMode.blushModel),
		blushintentisy = 0,
		blushcolor = parseInt(currentCharacterMode.blushColor),



		shapemix = currentCharacterMode.shapeMix,
		eyebrowsheight = currentCharacterMode.eyebrowsHeight,
		eyebrowswidth = currentCharacterMode.eyebrowsWidth,
		nosewidth = currentCharacterMode.noseWidth,
		noseheight = currentCharacterMode.noseHeight,
		noselength = currentCharacterMode.noseLength,
		nosebridge = currentCharacterMode.noseBridge,
		nosetip = currentCharacterMode.noseTip,
		noseshift = currentCharacterMode.noseShift,
		cheekboneheight = currentCharacterMode.cheekboneHeight,
		cheekbonewidth = currentCharacterMode.cheekboneWidth,
		cheekswidth = currentCharacterMode.cheeksWidth,
		lipswidth = currentCharacterMode.lips,
		jawwidth = currentCharacterMode.jawWidth,
		jawheight = currentCharacterMode.jawHeight,
		chinlength = currentCharacterMode.chinLength,
		chinposition = currentCharacterMode.chinPosition,
		chinwidth = currentCharacterMode.chinWidth,
		chinshape = currentCharacterMode.chinShape,
		neckwidth = currentCharacterMode.neckWidth,

		chestmodel = parseInt(currentCharacterMode.chestModel),
		chestcolor = parseInt(currentCharacterMode.chestColor),
		sundamagemodel = parseInt(currentCharacterMode.sundamageModel)
		
	}

	print("1")

	print("MEU ID ",newId)
	vRP.execute("vRP/gamb",{user_id = newId})
	print("2")
	vRP.execute("vRP/updateSkinCharacter",x)

	print("3")
	vRP.setUData(newId,"vRP:spawnController",json.encode(2))
	local sex = 0

	sex = currentCharacterMode.gender

	local model = ""
	if tonumber(sex) == 0 then
		model = "mp_m_freemode_01"
	elseif tonumber(sex) == 1 then
		model = "mp_f_freemode_01"
	end


	Citizen.Wait(1000)

	TriggerClientEvent("hudActived",source,true)
	TriggerClientEvent("vrp_spawn:spawnChar",source,true, sex)
	TriggerEvent("baseModule:idLoaded",source,newId,model)

	TriggerClientEvent("playerReady",source)

end)


function doSpawnPlayer(source,user_id,firstspawn)
	TriggerClientEvent("hudActived",source,true)
 	if not firstspawned[user_id] then
		firstspawned[user_id] = true
		TriggerClientEvent("vrp_spawn:spawnChar",source,false)
	else
		TriggerClientEvent("vrp_spawn:spawnChar",source,true)
	end
	TriggerEvent("baseModule:idLoaded",source,user_id,nil)

	TriggerClientEvent("playerReady",source)

	Wait(2000)
	local user_id = vRP.getUserId(source)
	-- VRP_SKINSHOP
	local playerData = vRP.getUData(user_id,"Clothings")
	local resultData = json.decode(playerData)
	if resultData == nil then
		resultData = "clean"
	end
	TriggerClientEvent("vrp_skinshop:skinData",source,resultData)

end



function getPlayerCharacters(steam,bool)
	if not bool then
		return vRP.query("vRP/get_characters",{ steam = steam })
	else
		return #vRP.query("vRP/get_characters",{ steam = steam })
	end
		
end




