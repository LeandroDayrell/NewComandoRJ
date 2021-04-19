local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vSERVER = Tunnel.getInterface("vrp_skinshop")

local userlogin = {}

async(function()
	vRP.prepare("vRP/update_user_first_spawn","UPDATE vrp_user_identities SET name = @name, firstname = @firstname, age = @age WHERE user_id = @user_id")
end)



local firstspawned = {}

vRP._prepare("vRP/getIdbySteam","SELECT id FROM vrp_users WHERE steam = @steam")



RegisterServerEvent("b2k-character:finishedCharacter")
AddEventHandler("b2k-character:finishedCharacter",function(characterNome,characterSobrenome,currentCharacterMode)
	local source = source
	
	
	local steam = vRP.getSteam(source)



	vRP.execute("vRP/create_characters",{ steam = steam, name = characterNome, name2 = characterSobrenome})

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
		makeupintensity = 0,
		makeupcolor = 0,
		lipstick = parseInt(currentCharacterMode.lipstickModel),
		lipstickintensity = 0,
		lipstickcolor = parseInt(currentCharacterMode.lipstickColor),
		eyebrow = parseInt(currentCharacterMode.eyebrowsModel),
		eyebrowintensity = 10,
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



	
	vRP.execute("vRP/gamb",{user_id = newId})
	
	vRP.execute("vRP/updateSkinCharacter",x)

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



function getPlayerCharacters(steam,bool)
	if not bool then
		return vRP.query("vRP/get_characters",{ steam = steam })
	else
		return #vRP.query("vRP/get_characters",{ steam = steam })
	end
		
end




