-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cnVRP = {}
Tunnel.bindInterface("vrp_products",cnVRP)
vSERVER = Tunnel.getInterface("vrp_products")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local inLocate = { 20.23,-1599.43,29.28 } 
local inService = false
local timeSelling = 0
local inTimers = 30
local inPed = nil
local lastItem = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- PEDHASHS
-----------------------------------------------------------------------------------------------------------------------------------------
local pedHashs = {
	"ig_abigail",
	"u_m_y_abner",
	"a_m_o_acult_02",
	"a_m_m_afriamer_01",
	"csb_mp_agent14",
	"csb_agent",
	"u_m_m_aldinapoli",
	"ig_amandatownley",
	"ig_andreas",
	"u_m_y_antonb",
	"csb_anita",
	"cs_andreas",
	"ig_ashley",
	"s_m_m_autoshop_01",
	"ig_money",
	"g_m_y_ballaeast_01",
	"g_m_y_ballaorig_01",
	"g_f_y_ballas_01",
	"u_m_y_babyd",
	"ig_barry",
	"s_m_y_barman_01",
	"u_m_y_baygor",
	"a_f_y_beach_01",
	"a_f_y_bevhills_02",
	"a_f_y_bevhills_01",
	"u_m_y_burgerdrug_01",
	"a_m_m_business_01",
	"a_f_m_business_02",
	"a_m_y_business_02",
	"ig_car3guy1",
	"ig_chef2",
	"g_m_m_chigoon_02",
	"g_m_m_chigoon_01",
	"ig_claypain",
	"ig_clay",
	"a_f_m_eastsa_01"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PEDLOCATE
-----------------------------------------------------------------------------------------------------------------------------------------
local pedLocate = {
	{ -202.29,-1707.73,32.67 },
	{ 225.23,-1982.94,19.75 },
	{ 854.46,-2121.42,30.6 },
	{ 985.15,-2299.21,30.51 },
	{ 1008.41,-1856.44,30.89 },
	{ 1278.74,-1613.43,54.24 },
	{ 943.56,-1580.5,30.3 },
	{ 914.61,-1164.54,25.39 },
	{ 731.72,-560.43,26.73 },
	{ 637.8,90.58,89.13 },
	{ 148.25,320.94,112.14 },
	{ -481.92,-60.96,40.0 },
	{ -1325.77,-237.37,42.69 },
	{ -1805.25,-403.69,44.72 },
	{ -1654.4,-378.23,45.34 },
	{ -949.91,321.75,71.36 },
	{ -521.84,575.55,121.08 },
	{ 177.1,306.91,105.38 },
	{ 72.25,-100.71,58.15 },
	{ -2.48,-666.56,32.34 },
	{ 500.0,-625.24,24.76 },
	{ 499.12,-1336.46,29.33 },
	{ 150.24,-1521.89,29.15 },
	{ -446.42,-780.35,30.57 },
	{ -583.05,-284.2,35.46 },
	{ -165.05,4.2,57.56 },
	{ 133.89,166.83,104.89 },
	{ 553.66,-199.88,54.49 },
	{ 1121.56,-398.17,68.36 },
	{ 1091.1,-789.17,58.27 },
	{ 1223.8,-1513.62,34.7 },
	{ 89.47,-1508.33,29.28 },
	{ 477.47,-1890.03,26.1 },
	{ 232.35,-2496.75,6.62 },
	{ -452.01,-2434.23,6.01 },
	{ -452.01,-2434.23,6.01 },
	{ 900.84,-2538.89,28.28 },
	{ 975.55,-1710.37,30.16 },
	{ 731.09,-1290.64,26.29 },
	{ 1126.31,-991.92,45.95 },
	{ 893.74,-191.65,71.81 },
	{ 216.57,27.18,79.43 },
	{ -71.18,387.02,112.44 },
	{ -276.95,164.65,78.76 },
	{ -1212.55,-352.0,37.29 },
	{ -738.31,-1029.23,12.84 },
	{ -1076.87,-1147.01,2.16 },
	{ -1159.22,-1564.11,4.42 },
	{ -867.07,-1122.95,7.07 },
	{ -585.57,-1588.95,26.76 },
	{ -202.29,-1707.73,32.67 },
	{ 225.23,-1982.94,19.75 },
	{ 854.46,-2121.42,30.6 },
	{ 985.15,-2299.21,30.51 },
	{ 1008.41,-1856.44,30.89 },
	{ 1278.74,-1613.43,54.24 },
	{ 943.56,-1580.5,30.3 },
	{ 914.61,-1164.54,25.39 },
	{ 731.72,-560.43,26.73 },
	{ 637.8,90.58,89.13 },
	{ 148.25,320.94,112.14 },
	{ -481.92,-60.96,40.0 },
	{ -1325.77,-237.37,42.69 },
	{ -1805.25,-403.69,44.72 },
	{ -1654.4,-378.23,45.34 },
	{ -949.91,321.75,71.36 },
	{ -521.84,575.55,121.08 },
	{ 177.1,306.91,105.38 },
	{ 72.25,-100.71,58.15 },
	{ -2.48,-666.56,32.34 },
	{ 500.0,-625.24,24.76 },
	{ 499.12,-1336.46,29.33 },
	{ 150.24,-1521.89,29.15 },
	{ -446.42,-780.35,30.57 },
	{ -583.05,-284.2,35.46 },
	{ -165.05,4.2,57.56 },
	{ 133.89,166.83,104.89 },
	{ 553.66,-199.88,54.49 },
	{ 1121.56,-398.17,68.36 },
	{ 1091.1,-789.17,58.27 },
	{ 1223.8,-1513.62,34.7 },
	{ 89.47,-1508.33,29.28 },
	{ 477.47,-1890.03,26.1 },
	{ 232.35,-2496.75,6.62 },
	{ -452.01,-2434.23,6.01 },
	{ -452.01,-2434.23,6.01 },
	{ 900.84,-2538.89,28.28 },
	{ 975.55,-1710.37,30.16 },
	{ 731.09,-1290.64,26.29 },
	{ 1126.31,-991.92,45.95 },
	{ 893.74,-191.65,71.81 },
	{ 216.57,27.18,79.43 },
	{ -71.18,387.02,112.44 },
	{ -276.95,164.65,78.76 },
	{ -1212.55,-352.0,37.29 },
	{ -738.31,-1029.23,12.84 },
	{ -1076.87,-1147.01,2.16 },
	{ -1159.22,-1564.11,4.42 },
	{ -867.07,-1122.95,7.07 },
	{ -585.57,-1588.95,26.76 },
}

local callName = { "James","John","Robert","Michael","William","David","Richard","Charles","Joseph","Thomas","Christopher","Daniel","Paul","Mark","Donald","George","Kenneth","Steven","Edward","Brian","Ronald","Anthony","Kevin","Jason","Matthew","Gary","Timothy","Jose","Larry","Jeffrey","Frank","Scott","Eric","Stephen","Andrew","Raymond","Gregory","Joshua","Jerry","Dennis","Walter","Patrick","Peter","Harold","Douglas","Henry","Carl","Arthur","Ryan","Roger","Joe","Juan","Jack","Albert","Jonathan","Justin","Terry","Gerald","Keith","Samuel","Willie","Ralph","Lawrence","Nicholas","Roy","Benjamin","Bruce","Brandon","Adam","Harry","Fred","Wayne","Billy","Steve","Louis","Jeremy","Aaron","Randy","Howard","Eugene","Carlos","Russell","Bobby","Victor","Martin","Ernest","Phillip","Todd","Jesse","Craig","Alan","Shawn","Clarence","Sean","Philip","Chris","Johnny","Earl","Jimmy","Antonio","Mary","Patricia","Linda","Barbara","Elizabeth","Jennifer","Maria","Susan","Margaret","Dorothy","Lisa","Nancy","Karen","Betty","Helen","Sandra","Donna","Carol","Ruth","Sharon","Michelle","Laura","Sarah","Kimberly","Deborah","Jessica","Shirley","Cynthia","Angela","Melissa","Brenda","Amy","Anna","Rebecca","Virginia","Kathleen","Pamela","Martha","Debra","Amanda","Stephanie","Carolyn","Christine","Marie","Janet","Catherine","Frances","Ann","Joyce","Diane","Alice","Julie","Heather","Teresa","Doris","Gloria","Evelyn","Jean","Cheryl","Mildred","Katherine","Joan","Ashley","Judith","Rose","Janice","Kelly","Nicole","Judy","Christina","Kathy","Theresa","Beverly","Denise","Tammy","Irene","Jane","Lori","Rachel","Marilyn","Andrea","Kathryn","Louise","Sara","Anne","Jacqueline","Wanda","Bonnie","Julia","Ruby","Lois","Tina","Phyllis","Norma","Paula","Diana","Annie","Lillian","Emily","Robin" }
local callName2 = { "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes" }
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("delivery",function(source,args,rawCommand)
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local distance = #(coords - vector3(inLocate[1],inLocate[2],inLocate[3]))
	if distance <= 5 then
		if inService then
			inService = false
			TriggerEvent("Notify","sucesso","Serviço finalizado.",3000)

			if inPed ~= nil then
				DeleteEntity(inPed)
				inTimers = 30
			end
		else
			startthreaddelivery()
			startthreadintimers()
			timeselling()
			inService = true
			TriggerEvent("Notify","sucesso","Voce pegou a lista dos contatos, espere um pouco que jaja alguem te chama.",5000)
		end
	end
	
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADDELIVERY
-----------------------------------------------------------------------------------------------------------------------------------------
function startthreaddelivery()
	Citizen.CreateThread(function()
		while true do
			local timeDistance = 500

			if inService then
				if inPed ~= nil and inTimers <= 0 then
					local ped = PlayerPedId()
					local coords = GetEntityCoords(ped)
					local coordsPed = GetEntityCoords(inPed)
					local distance = #(coords - coordsPed)

					if distance <= 10 then
						timeDistance = 4

						if timeSelling > 0 then
							DisableControlAction(1,23,true)
							DrawText3D(coordsPed.x,coordsPed.y,coordsPed.z,"~w~AGUARDE  ~g~"..timeSelling.."~w~  SEGUNDOS")
						else
							DrawText3D(coordsPed.x,coordsPed.y,coordsPed.z,"~g~E~w~   VENDER")
							if distance <= 2 then
								if IsControlJustPressed(1,38) and vSERVER.checkAmount() and not IsPedInAnyVehicle(ped) then
									timeSelling = 10
								end
							end
						end
					end
				end
			end
			Citizen.Wait(timeDistance)
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
function startthreadintimers()
	Citizen.CreateThread(function()
		while true do
			if inService and inTimers > 0 then
				inTimers = inTimers - 1

				if inTimers == 60 and inPed ~= nil then
					DeleteEntity(inPed)
					inPed = nil
				end

				if inTimers <= 0 then
					local mHash = GetHashKey(pedHashs[math.random(#pedHashs)])

					RequestModel(mHash)
					while not HasModelLoaded(mHash) do
						RequestModel(mHash)
						Citizen.Wait(10)
					end

					local rand = math.random(#pedLocate)
					inPed = CreatePed(4,mHash,pedLocate[rand][1],pedLocate[rand][2],pedLocate[rand][3]-1,pedLocate[rand][4],false,false)
					SetEntityInvincible(inPed,true)
					FreezeEntityPosition(inPed,true)
					SetPedSuffersCriticalHits(inPed,false)
					SetBlockingOfNonTemporaryEvents(inPed,true)
					SetModelAsNoLongerNeeded(mHash)

					TriggerEvent("NotifyPush",{ time = ("%H:%M:%S - %d/%m/%Y"), text = "Ola gostaria de estar comprando este produto.", code = 20, title = "Quero comprar um produto", x = pedLocate[rand][1], y = pedLocate[rand][2], z = pedLocate[rand][3], name = callName[math.random(#callName)].." "..callName2[math.random(#callName2)], rgba = {69,115,41} })
				end
			end

			Citizen.Wait(1000)
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_PRODUCTS:LASTITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_products:lastItem")
AddEventHandler("vrp_products:lastItem",function(status)
	lastItem = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMESELLING
-----------------------------------------------------------------------------------------------------------------------------------------
function timeselling()
	Citizen.CreateThread(function()
		while true do
			if timeSelling > 0 then
				timeSelling = timeSelling - 1

				local ped = PlayerPedId()
				local coords = GetEntityCoords(ped)
				local coordsPed = GetEntityCoords(inPed)
				local distance = #(coords - coordsPed)

				if timeSelling <= 0 then
					RequestAnimDict("pickup_object")
					while not HasAnimDictLoaded("pickup_object") do
						RequestAnimDict("pickup_object")
						Citizen.Wait(10)
					end

					TaskPlayAnim(inPed,"pickup_object","putdown_low",3.0,3.0,-1,48,10,0,0,0)
					SetEntityInvincible(inPed,false)
					FreezeEntityPosition(inPed,false)
					TaskWanderStandard(inPed,10.0,10)
					inTimers = math.random(20,30)

					vSERVER.paymentMethod()

					Citizen.Wait(math.random(2000,5000))

					-- if (lastItem == "joint" or lastItem == "joint" or lastItem == "ecstasy" or lastItem == "lean" or lastItem == "meth") and math.random(100) >= 95 then
					-- 	GiveWeaponToPed(inPed,GetHashKey("WEAPON_PISTOL"),200,true,true)
					-- 	TaskShootAtEntity(inPed,ped,15000,GetHashKey("FIRING_PATTERN_FULL_AUTO"))
					-- end
				end

				if distance >= 3 then
					FreezeEntityPosition(inPed,false)
					TaskWanderStandard(inPed,10.0,10)
					timeSelling = 0
					inTimers = 90
				end
			end

			Citizen.Wait(1000)
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOWME3D
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
	local factor = (string.len(text)) / 400
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end