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
Tunnel.bindInterface("vrp_player",cRP)
vCLIENT = Tunnel.getInterface("vrp_player")
vTASKBAR = Tunnel.getInterface("vrp_taskbar")
vSKINSHOP = Tunnel.getInterface("vrp_skinshop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WESTORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("garmas",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
			local weapons = vRPclient.replaceWeapons(source)
			for k,v in pairs(weapons) do
				vRP.giveInventoryItem(user_id,k,1)
				if v.ammo > 0 then
					vRP.giveInventoryItem(user_id,vRP.itemAmmoList(k),v.ammo)
				end
			end
			vRPclient.updateWeapons(source)

			TriggerClientEvent("Notify",source,"sucesso","Armamento guardado.",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WECOLOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("wecolor",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(args[1]) >= 0 and parseInt(args[1]) <= 7 then
			if vRP.getPremium(user_id) then
				vCLIENT.weColors(source,parseInt(args[1]))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WELUX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("welux",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getPremium(user_id) then
			vCLIENT.weLux(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMOTES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vCLIENT.getHandcuff(source) then
			if args[2] == "friend" then
				local identity = vRP.getUserIdentity(user_id)
				local nplayer = vRPclient.nearestPlayer(source,2)
				if nplayer then
					if vRPclient.getHealth(nplayer) > 101 and not vCLIENT.getHandcuff(nplayer) then
						local request = vRP.request(nplayer,"Você aceita o pedido de <b>"..identity.name.." "..identity.name2.."</b> da animação <b>"..args[1].."</b>?",30)
						if request then
							TriggerClientEvent("emotes",nplayer,args[1])
							TriggerClientEvent("emotes",source,args[1])
						end
					end
				end
			else
				TriggerClientEvent("emotes",source,args[1])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMOTES2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e2",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Paramedic") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local nplayer = vRPclient.nearestPlayer(source,2)
				if nplayer then
					TriggerClientEvent("emotes",nplayer,args[1])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREMIUM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("premium",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if identity then
			local consult = vRP.getInfos(identity.steam)
			if consult[1] and parseInt(os.time()) <= parseInt(consult[1].premium+24*consult[1].predays*60*60) then
				TriggerClientEvent("Notify",source,"importante","Você ainda tem "..vRP.getTimers(parseInt(86400*consult[1].predays-(os.time()-consult[1].premium))).." de benefícios <b>Premium</b>.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hood",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 then
			local vehicle,vehNet = vRPclient.vehList(source,7)
			if vehicle then
				TriggerClientEvent("vrp_player:syncHood",-1,vehNet)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STATUS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('status',function(source,args,rawCommand)
    --local onlinePlayers = GetNumPlayerIndices()
    local policia = vRP.numPermission("Police")
    local paramedico = vRP.numPermission("Paramedic")
    local mec = vRP.numPermission("LosSantos")
    --local staff = vRP.hasPermission("admin.permissao")
    --local ilegal = vRP.hasPermission("ilegal.permissao")
    local user_id = vRP.getUserId(source)
        --TriggerClientEvent("Notify",source,"importante","<bold><b>Jogadores</b>: <b>"..onlinePlayers.."<br>Administração</b>: <b>"..#staff.."<br>Policiais</b>: <b>"..#policia.."<br>Ilegal</b>: <b>"..#ilegal.."<br>Paramédicos</b>: <b>"..#paramedico.."<br>Mecânicos</b> em serviço: <b>"..#mec.."</b></bold>.",9000)
		--TriggerClientEvent("NotifyPush",source,{ code = 28, title = "JOGADORES ONLINE", "<bold><b>Jogadores</b>: <b>"..onlinePlayers.."<br>Administração</b>: <b>"..#staff.."<br>Policiais</b>: <b>"..#policia.."<br>Ilegal</b>: <b>"..#ilegal.."<br>Paramédicos</b>: <b>"..#paramedico.."<br>Mecânicos</b> em serviço: <b>"..#mec.."</b></bold>" })
		TriggerClientEvent("NotifyPush",source,{ code = 28, title = "JOGADORES ONLINE", x = x, y = y, z = z, badge = "<br>Policiais</b>: <b>"..#policia.."<br>Paramédicos</b>: <b>"..#paramedico.."<br>Mecânicos</b> em serviço: <b>"..#mec.."</b></bold>" })
		TriggerClientEvent('chatMessage',source,"ID's ONLINE",{1, 136, 0},players)
	end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("doors",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
			local vehicle,vehNet = vRPclient.vehList(source,7)
			if vehicle then
				TriggerClientEvent("vrp_player:syncDoors",-1,vehNet,args[1])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WINS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("wins",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
			local vehicle,vehNet = vRPclient.vehList(source,7)
			if vehicle then
				TriggerClientEvent("vrp_player:syncWins",-1,vehNet,args[1])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RECEIVESALARY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_player:salary")
AddEventHandler("vrp_player:salary",function()
	local source = source
	local user_id = vRP.getUserId(source)
	vRP.antiflood(source,"vrp_player:salary",3)
	if user_id then
		--[[ if vRP.getPremium(parseInt(user_id)) then
			vRP.setSalary(parseInt(user_id),1000)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salario.",5000)
		end ]]

		if vRP.hasPermission(parseInt(user_id),"Police") then
			vRP.setSalary(parseInt(user_id),5000)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salario.",5000)
		end

		--[[ if vRP.hasPermission(parseInt(user_id),"Mechanic") then
			vRP.setSalary(parseInt(user_id),3000)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salario.",5000)
		end ]]

		if vRP.hasPermission(parseInt(user_id),"Taxi") then
			vRP.setSalary(parseInt(user_id),500)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salario.",5000)
		end

		if vRP.hasPermission(parseInt(user_id),"Paramedic") then
			vRP.setSalary(parseInt(user_id),6000)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salario.",5000)
		end

		if vRP.hasPermission(parseInt(user_id),"VIPBronze") then
			vRP.setSalary(parseInt(user_id),650)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salario.",650)
		end

		if vRP.hasPermission(parseInt(user_id),"VIPPrata") then
			vRP.setSalary(parseInt(user_id),1000)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salario.",1000)
		end

		if vRP.hasPermission(parseInt(user_id),"VIPOuro") then
			vRP.setSalary(parseInt(user_id),1400)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salario.",1400)
		end

		if vRP.hasPermission(parseInt(user_id),"VIPMafioso") then
			vRP.setSalary(parseInt(user_id),1800)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salario.",1800)
		end

		if vRP.hasPermission(parseInt(user_id),"VIPMagnata") then
			vRP.setSalary(parseInt(user_id),2500)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salario.",2500)
		end

		if vRP.hasPermission(parseInt(user_id),"VIPComando") then
			vRP.setSalary(parseInt(user_id),2500)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salario.",2500)
		end
		
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETECHAR
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.deleteChar()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.execute("vRP/remove_characters",{ id = parseInt(user_id) })
		Citizen.Wait(1000)
		vRP.rejoinServer(source)
		Citizen.Wait(1000)
		TriggerClientEvent("vrp_spawn:setupChars",source)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("atendimento",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vCLIENT.getHandcuff(source) then
			local service = vRP.prompt(source,"190: Polícia   |   192: Paramédico","")
			if service == "" then
				return
			end

			local description = vRP.prompt(source,"Descrição do ocorrido:","")
			if description == "" then
				return
			end

			local players = {}
			local answered = false
			if parseInt(service) == 190 then
				players = vRP.numPermission("Police")
			elseif parseInt(service) == 192 then
				players = vRP.numPermission("Paramedic")
			elseif parseInt(service) == 156 then
				players = vRP.numPermission("sup2000")
			elseif parseInt(service) == 170 then
				players = vRP.numPermission("LosSantos")
			end

			TriggerClientEvent("Notify",source,"sucesso","Chamado efetuado com sucesso, aguarde no local.",5000)

			local x,y,z = vRPclient.getPositions(source)
			local identity = vRP.getUserIdentity(user_id)
			for k,v in pairs(players) do
				local nuser_id = vRP.getUserId(v)
				local identitys = vRP.getUserIdentity(nuser_id)
				if v and v ~= source then
					async(function()
						TriggerClientEvent("chatMessage",v,identity.name.." "..identity.name2,{107,182,84},description)
						TriggerClientEvent("NotifyPush",v,{ code = 20, title = "Chamado", x = x, y = y, z = z, name = identity.name.." "..identity.name2, phone = identity.phone, rgba = {69,115,41} })
						local request = vRP.request(v,"Aceitar o chamado de <b>"..identity.name.." "..identity.name2.."</b>?",30)
						if request then
							if not answered then
								answered = true
								vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
								TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identitys.name.." "..identitys.name2.."</b>, aguarde no local.",10000)
							else
								TriggerClientEvent("Notify",v,"negado","Chamado já foi atendido por outra pessoa.",5000)
								vRPclient.playSound(v,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
							end
						end
					end)
				end
			end
		end
	end
end)


--[[ egisterCommand('chamar',function(source,args,rawCommand)
	local source = source
	local answered = false
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	vida = vRPclient.getHealth(source)
	vRPclient._CarregarObjeto(source,"cellphone@","cellphone_call_to_text","prop_amb_phone",50,28422)
	if user_id then
		local descricao = vRP.prompt(source,"Descrição:","")
		if descricao == "" then
			vRPclient._stopAnim(source,false)
			vRPclient._DeletarObjeto(source)
			return
		end

		local x,y,z = vRPclient.getPosition(source)
		local players = {}
		vRPclient._stopAnim(source,false)
		vRPclient._DeletarObjeto(source)
		local especialidade = false
		if args[1] == "190" then
			players = vRP.getUsersByPermission("Police")
			especialidade = "<b>Policiais</b>"
		elseif args[1] == "policia" then
			players = vRP.getUsersByPermission("Police")
			especialidade = "<b>Policiais</b>"
		elseif args[1] == "192" then
			players = vRP.getUsersByPermission("Paramedic")
			especialidade = "Colaboradores do <b>SAMU</b>"
		elseif args[1] == "mecanico" then
			players = vRP.getUsersByPermission("LosSantos")
			especialidade = "<b>Mecânicos</b>"
		elseif args[1] == "samu" then
			players = vRP.getUsersByPermission("Paramedic")	
			especialidade = "Colaboradores do <b>SAMU</b>"
		elseif args[1] == "adm" then
			players = vRP.getUsersByPermission("modder21")	
			especialidade = "Administradores"
		elseif args[1] == "deus" then
			players = vRP.getUsersByPermission("modder21")	
			especialidade = "Administradores"
		elseif args[1] == "god" then
			players = vRP.getUsersByPermission("modder21")	
			especialidade = "Administradores"
		else
			TriggerClientEvent("Notify",source,"negado","Serviço <b>inexistente</b> na Cidade.")
			return
		end
		
		local adm = ""
		if especialidade == "Administradores" then
			adm = "[ADM]: "
		end
		
		vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		if #players == 0  and especialidade ~= "<b>Policiais</b>" and especialidade ~="<b>PoliciaCivil</b>" and especialidade ~="PoliciaisPRF" then
			TriggerClientEvent("Notify",source,"importante","Não há "..especialidade.." em serviço.")
		else
			local identitys = vRP.getUserIdentity(user_id)
			local identity = vRP.getUserIdentity(user_id)
			local x,y,z = vRPclient.getPositions(user_id)
			
			TriggerClientEvent("Notify",source,"sucesso","O Seu <b>Chamado</b> foi enviado com sucesso.")
			for l,w in pairs(players) do
				local player = vRP.getUserSource(parseInt(w))
				local nuser_id = vRP.getUserId(player)
				if player and player ~= uplayer then
					async(function()
						vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
						--TriggerClientEvent('chatMessage',player,"Chamado ",{255,0,0},adm.." Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
						--TriggerClientEvent("chatMessage",v,identity.name.." "..identity.name2,{107,182,84},description)
						--TriggerClientEvent("NotifyPush",v,{ code = 20, title = "Chamado", x = x, y = y, z = z, name = identity.name.." "..identity.name2, rgba = {69,115,41} })
						local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.name2.. " ["..user_id.."]</b>?",30)
						--print('teste 01')
						if ok then
							print('teste 02')
							if not answered then
								print('teste 03')
								answered = true
								local identity = vRP.getUserIdentity(nuser_id)
								print('teste 04')
								TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.name2.."</b>, aguarde no local.")
								vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
								vRPclient._setGPS(player,x,y)
							else
								TriggerClientEvent("Notify",player,"negado","Chamado ja foi atendido por outra <b>pessoa.</b>")
								vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
								print('teste 05')
							end
						end
						--local id = idgens:gen()
						print('teste 06')
						TriggerClientEvent("NotifyPush",v,{ code = 20, title = "Chamado", x = x, y = y, z = z, name = identity.name.." "..identity.name2, rgba = {69,115,41} })
						--blips[id] = vRPclient.addBlip(player,x,y,z,543,27,"Chamado",0.6,false)
						--SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id])end)
					end)
				end
			end
		end
	end
end) ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- PR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("pr",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id and args[1] then
		if vRP.hasPermission(user_id,"Police") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local identity = vRP.getUserIdentity(user_id)
				local police = vRP.numPermission("Police")
				for k,v in pairs(police) do
					async(function()
						TriggerClientEvent("chatMessage",v,identity.name.." "..identity.name2,{255,175,175},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hr",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id and args[1] then
		if vRP.hasPermission(user_id,"Paramedic") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local identity = vRP.getUserIdentity(user_id)
				local police = vRP.numPermission("Paramedic")
				for k,v in pairs(police) do
					async(function()
						TriggerClientEvent("chatMessage",v,identity.name.." "..identity.name2,{255,175,175},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)

RegisterCommand("reparar",function(source,args,rawCommand)
local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"LosSantos") then
		if not vRPclient.inVehicle(source) then
			local vehicle,vehNet = vRPclient.vehList(source,3)
			if vehicle then
				--TriggerClientEvent("vrp_inventory:repairVehicle",-1,vehNet,false)
				TriggerClientEvent('reparar',source,vehicle)
			end
		else
			TriggerClientEvent("Notify",source,"negado","Voce deve sair do veiculo",10000)
		end
	else
		TriggerClientEvent("Notify",source,"negado","Voce nao tem permissao",10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATENAME
-----------------------------------------------------------------------------------------------------------------------------------------
local plateName = { "James","John","Robert","Michael","William","David","Richard","Charles","Joseph","Thomas","Christopher","Daniel","Paul","Mark","Donald","George","Kenneth","Steven","Edward","Brian","Ronald","Anthony","Kevin","Jason","Matthew","Gary","Timothy","Jose","Larry","Jeffrey","Frank","Scott","Eric","Stephen","Andrew","Raymond","Gregory","Joshua","Jerry","Dennis","Walter","Patrick","Peter","Harold","Douglas","Henry","Carl","Arthur","Ryan","Roger","Joe","Juan","Jack","Albert","Jonathan","Justin","Terry","Gerald","Keith","Samuel","Willie","Ralph","Lawrence","Nicholas","Roy","Benjamin","Bruce","Brandon","Adam","Harry","Fred","Wayne","Billy","Steve","Louis","Jeremy","Aaron","Randy","Howard","Eugene","Carlos","Russell","Bobby","Victor","Martin","Ernest","Phillip","Todd","Jesse","Craig","Alan","Shawn","Clarence","Sean","Philip","Chris","Johnny","Earl","Jimmy","Antonio","Mary","Patricia","Linda","Barbara","Elizabeth","Jennifer","Maria","Susan","Margaret","Dorothy","Lisa","Nancy","Karen","Betty","Helen","Sandra","Donna","Carol","Ruth","Sharon","Michelle","Laura","Sarah","Kimberly","Deborah","Jessica","Shirley","Cynthia","Angela","Melissa","Brenda","Amy","Anna","Rebecca","Virginia","Kathleen","Pamela","Martha","Debra","Amanda","Stephanie","Carolyn","Christine","Marie","Janet","Catherine","Frances","Ann","Joyce","Diane","Alice","Julie","Heather","Teresa","Doris","Gloria","Evelyn","Jean","Cheryl","Mildred","Katherine","Joan","Ashley","Judith","Rose","Janice","Kelly","Nicole","Judy","Christina","Kathy","Theresa","Beverly","Denise","Tammy","Irene","Jane","Lori","Rachel","Marilyn","Andrea","Kathryn","Louise","Sara","Anne","Jacqueline","Wanda","Bonnie","Julia","Ruby","Lois","Tina","Phyllis","Norma","Paula","Diana","Annie","Lillian","Emily","Robin" }
local plateName2 = { "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes" }
local plateSave = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("placa",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") then
			if vRPclient.getHealth(source) > 101 then
				if args[1] then
					local plateUser = vRP.getVehiclePlate(tostring(args[1])) --
					if plateUser then
						local identity = vRP.getUserIdentity(plateUser)
						if identity then
							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
							TriggerClientEvent("Notify",source,"importante","<b>Passaporte: x</b> "..identity.id.."<br><b>RG:</b> "..identity.registration.."<br><b>Nome:</b> "..identity.name.." "..identity.name2.."<br><b>Telefone:</b> "..identity.phone,10000)
						end
					else
						if not plateSave[string.upper(args[1])] then
							plateSave[string.upper(args[1])] = { math.random(5000,9999),plateName[math.random(#plateName)].." "..plateName2[math.random(#plateName2)],vRP.generatePhoneNumber() }
						end

						vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
						TriggerClientEvent("Notify",source,"importante","<b>Passaporte xx:</b> "..plateSave[args[1]][1].."<br><b>RG:</b> "..string.upper(args[1]).."<br><b>Nome:</b> "..plateSave[args[1]][2].."<br><b>Telefone:</b> "..plateSave[args[1]][3],10000)
					end
				else
					local vehicle,vehNet,vehPlate = vRPclient.vehList(source,7)
					if vehicle then
						local plateUser = vRP.getVehiclePlate(vehPlate)
						if plateUser then
							local identity = vRP.getUserIdentity(plateUser)
							if identity then
								vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
								TriggerClientEvent("Notify",source,"importante","<b>Passaporte xxx:</b> "..identity.id.."<br><b>RG:</b> "..identity.registration.."<br><b>Nome:</b> "..identity.name.." "..identity.name2.."<br><b>Telefone:</b> "..identity.phone,10000)
							end
						else
							if not plateSave[vehPlate] then
								plateSave[vehPlate] = { math.random(5000,9999),plateName[math.random(#plateName)].." "..plateName2[math.random(#plateName2)],vRP.generatePhoneNumber() }
							end

							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
							TriggerClientEvent("Notify",source,"importante","<b>Passaporte: xxxx</b> "..plateSave[vehPlate][1].."<br><b>RG:</b> "..vehPlate.."<br><b>Nome:</b> "..plateSave[vehPlate][2].."<br><b>Telefone:</b> "..plateSave[vehPlate][3],10000)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DETIDO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("detido",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local vehicle,vehNet,vehPlate,vehName = vRPclient.vehList(source,7)
				if vehicle then
					local plateUser = vRP.getVehiclePlate(vehPlate)
					local inVehicle = vRP.query("vRP/get_vehicles",{ user_id = parseInt(plateUser), vehicle = vehName })
					if inVehicle[1] then
						if inVehicle[1].arrest <= 0 then
							vRP.execute("vRP/set_arrest",{ user_id = parseInt(plateUser), vehicle = vehName, arrest = 1, time = parseInt(os.time()) })
							TriggerClientEvent("Notify",source,"sucesso","O veículo foi apreendido no galpão da polícia.",5000)
						else
							TriggerClientEvent("Notify",source,"importante","O veículo está no galpão da polícia.",5000)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("servico",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vCLIENT.getHandcuff(source) then
			local distanceService,service = vCLIENT.distanceService(source)
			if distanceService then
				if service == "Police" then
					if vRP.hasPermission(user_id,"Police") then
						vRP.removePermission(source,"Police")
						TriggerEvent("vrp_blipsystem:serviceExit",source)
						TriggerClientEvent("vrp_tencode:StatusService",source,false)
						TriggerClientEvent("Notify",source,"importante","Você saiu de serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "Police", newpermiss = "waitPolice" })
					elseif vRP.hasPermission(user_id,"waitPolice") then
						vRP.insertPermission(source,"Police")
						TriggerClientEvent("vrp_tencode:StatusService",source,true)
						TriggerEvent("vrp_blipsystem:serviceEnter",source,"Policial",77)
						TriggerClientEvent("Notify",source,"importante","Você entrou em serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "waitPolice", newpermiss = "Police" })
					end
				end

				if service == "Paramedic" then
					if vRP.hasPermission(user_id,"Paramedic") then
						vRP.removePermission(source,"Paramedic")
						TriggerEvent("vrp_blipsystem:serviceExit",source)
						TriggerClientEvent("Notify",source,"importante","Você saiu de serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "Paramedic", newpermiss = "waitParamedic" })
					elseif vRP.hasPermission(user_id,"waitParamedic") then
						vRP.insertPermission(source,"Paramedic")
						TriggerEvent("vrp_blipsystem:serviceEnter",source,"Paramedico",83)
						TriggerClientEvent("Notify",source,"importante","Você entrou em serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "waitParamedic", newpermiss = "Paramedic" })
					end
				end


				if service == "LosSantos" then
					if vRP.hasPermission(user_id,"LosSantos") then
						vRP.removePermission(source,"LosSantos")
						TriggerEvent("vrp_blipsystem:serviceExit",source)
						TriggerClientEvent("Notify",source,"importante","Você saiu de serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "LosSantos", newpermiss = "waitLosSantos" })
					elseif vRP.hasPermission(user_id,"waitLosSantos") then
						vRP.insertPermission(source,"LosSantos")
						TriggerEvent("vrp_blipsystem:serviceEnter",source,"LosSantos",83)
						TriggerClientEvent("Notify",source,"importante","Você entrou em serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "waitLosSantos", newpermiss = "LosSantos" })
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Algemar
-----------------------------------------------------------------------------------------------------------------------------------------
local poCuff = {}
RegisterCommand("algemar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) and poCuff[user_id] == nil then
				if not vRPclient.inVehicle(source) then
					local nplayer = vRPclient.nearestPlayer(source,2)
					if nplayer then
						if vCLIENT.getHandcuff(nplayer) then
							vCLIENT.toggleHandcuff(nplayer)
							vRPclient._stopAnim(nplayer,false)
							TriggerClientEvent("vrp_sound:source",source,"uncuff",0.5)
							TriggerClientEvent("vrp_sound:source",nplayer,"uncuff",0.5)
						else
							poCuff[user_id] = true
							local taskResult = vTASKBAR.taskHandcuff(nplayer)
							if not taskResult then
								vCLIENT.toggleHandcuff(nplayer)
								TriggerClientEvent("vrp_sound:source",source,"cuff",0.5)
								TriggerClientEvent("vrp_sound:source",nplayer,"cuff",0.5)
								vRPclient._playAnim(nplayer,true,{"mp_arresting","idle"},true)
							end
							poCuff[user_id] = nil
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADFIRED
-----------------------------------------------------------------------------------------------------------------------------------------
local shotFired = {}
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(shotFired) do
			if shotFired[k] > 0 then
				shotFired[k] = v - 10
				if shotFired[k] <= 0 then
					shotFired[k] = nil
				end
			end
		end
		Citizen.Wait(10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOTSFIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.shotsFired()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shotFired[user_id] == nil then
			if not vRP.hasPermission(user_id,"Police") then
				local distance = vCLIENT.shotDistance(source)

				if distance then
					shotFired[user_id] = 30
					local x,y,z = vRPclient.getPositions(source)
					local comAmount = vRP.numPermission("Police")
					for k,v in pairs(comAmount) do
						async(function()
							TriggerClientEvent("NotifyPush",v,{ code = 10, title = "Confronto em andamento", x = x, y = y, z = z, criminal = "Disparos de arma de fogo", rgba = {105,52,136} })
						end)
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("carregar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Paramedic") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local nplayer = vRPclient.nearestPlayer(source,2)
				if nplayer then
					vCLIENT.toggleCarry(nplayer,source)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARRY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("carregar2",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Paramedic") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local nplayer = vRPclient.nearestPlayer(source,2)
				if nplayer then
					TriggerClientEvent("vrp_rope:toggleRope",source,nplayer)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("rv",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Paramedic") or vRP.getInventoryItemAmount(user_id,"rope") >= 1 then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) and not vRPclient.inVehicle(source) then
				local vehicle,vehNet,vehPlate,vehName,vehLock = vRPclient.vehList(source,11)
				if vehicle then
					if vehLock ~= 1 then
						local nplayer = vRPclient.nearestPlayer(source,11)
						if nplayer then
							vCLIENT.removeVehicle(nplayer)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cv",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Paramedic") or vRP.getInventoryItemAmount(user_id,"rope") >= 1 then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) and not vRPclient.inVehicle(source) then
				local vehicle,vehNet,vehPlate,vehName,vehLock = vRPclient.vehList(source,11)
				if vehicle then
					if vehLock ~= 1 then
						local nplayer = vRPclient.nearestPlayer(source,2)
						if nplayer then
							vCLIENT.putVehicle(nplayer,args[1])
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("rg",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") then
			if parseInt(args[1]) > 0 then
				local nuser_id = parseInt(args[1])
				local identity = vRP.getUserIdentity(nuser_id)
				if identity then
					local fines = 0
					local consult = vRP.getFines(nuser_id)
					for k,v in pairs(consult) do
						fines = parseInt(fines) + parseInt(v.price)
					end

					TriggerClientEvent("Notify",source,"importante","<b>Passaporte:</b> "..identity.id.."<br><b>Nome:</b> "..identity.name.." "..identity.name2.."<br><b>RG:</b> "..identity.registration.."<br><b>Telefone:</b> "..identity.phone.."<br><b>Multas Pendentes:</b> $"..vRP.format(parseInt(fines)),20000)
				end
			else
				local nplayer = vRPclient.nearestPlayer(source,2)
				if nplayer then
					local nuser_id = vRP.getUserId(nplayer)
					if nuser_id then
						local identity = vRP.getUserIdentity(nuser_id)
						if identity then
							local fines = 0
							local consult = vRP.getFines(nuser_id)
							for k,v in pairs(consult) do
								fines = parseInt(fines) + parseInt(v.price)
							end

							TriggerClientEvent("Notify",source,"importante","<b>Passaporte:</b> "..identity.id.."<br><b>Nome:</b> "..identity.name.." "..identity.name2.."<br><b>RG:</b> "..identity.registration.."<br><b>Telefone:</b> "..identity.phone.."<br><b>Multas Pendentes:</b> $"..vRP.format(parseInt(fines)),20000)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local preset = {
	["Police"] = {
		["1"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 112, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 2, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 49, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 6, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 257, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 45, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 115, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 2, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 49, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 6, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 261, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 48, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["2"] = {
			["homem"] = {
				["hat"] = { item = 19, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 112, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 6, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 194, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 49, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 7, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 257, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 45, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 18, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 115, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 6, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 194, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 49, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 7, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 261, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 48, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["3"] = {
			["homem"] = {
				["hat"] = { item = 63, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 112, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 6, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 194, texture = 13, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 49, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 7, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 257, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 45, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = 62, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 115, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 6, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 194, texture = 13, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 49, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 7, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 261, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 48, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["4"] = {
			["homem"] = {
				["hat"] = { item = 19, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 112, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 8, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 194, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 49, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 7, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 258, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 45, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 115, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 3, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 194, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 50, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 7, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 263, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 48, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["5"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 112, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 194, texture = 13, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 60, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 7, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 257, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 45, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 2, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 115, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 194, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 50, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 7, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 261, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 48, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["6"] = {
			["homem"] = {
				["hat"] = { item = 157, texture = 2, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 112, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 49, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 6, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 143, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 46, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 115, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 50, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 6, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 83, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 47, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		}
	},
	["Paramedic"] = {
		["1"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 49, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 10, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = -1, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 399, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 176, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 105, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 6, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 6, texture = 3, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 101, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 416, texture = 5, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 146, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 113, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["2"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 45, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 8, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = -1, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 176, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 99, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 2, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 48, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 34, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = -1, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 336, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 146, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 110, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("preset",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(args[1]) > 0 then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local model = vRPclient.getModelPlayer(source)
				if vRP.hasPermission(user_id,"Paramedic") and preset["Paramedic"][tostring(args[1])] then
					if model == "mp_m_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Paramedic"][tostring(args[1])]["homem"])
					elseif model == "mp_f_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Paramedic"][tostring(args[1])]["mulher"])
					end
				elseif vRP.hasPermission(user_id,"Police") and preset["Police"][tostring(args[1])] then
					if model == "mp_m_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Police"][tostring(args[1])]["homem"])
					elseif model == "mp_f_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Police"][tostring(args[1])]["mulher"])
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTFIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("outfit",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.wantedReturn(user_id) and not vRP.reposeReturn(user_id) then
			if args[1] then
				if args[1] == "save" then
					local custom = vSKINSHOP.getCustomization(source)
					if custom then
						vRP.setSData("saveClothes:"..parseInt(user_id),json.encode(custom))
						TriggerClientEvent("Notify",source,"sucesso","Outfit salvo com sucesso.",3000)
					end
				end
			else
				local consult = vRP.getSData("saveClothes:"..parseInt(user_id))
				local result = json.decode(consult)
				if result then
					TriggerClientEvent("updateRoupas",source,result)
					TriggerClientEvent("Notify",source,"sucesso","Outfit aplicado com sucesso.",3000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREMIUMFIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("premiumfit",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.wantedReturn(user_id) and not vRP.reposeReturn(user_id) and vRP.getPremium(user_id) then
			if args[1] then
				if args[1] == "save" then
					local custom = vSKINSHOP.getCustomization(source)
					if custom then
						vRP.setSData("premClothes:"..parseInt(user_id),json.encode(custom))
						TriggerClientEvent("Notify",source,"sucesso","Premiumfit salvo com sucesso.",3000)
					end
				end
			else
				local consult = vRP.getSData("premClothes:"..parseInt(user_id))
				local result = json.decode(consult)
				if result then
					TriggerClientEvent("updateRoupas",source,result)
					TriggerClientEvent("Notify",source,"sucesso","Premiumfit aplicado com sucesso.",3000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETREPOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("setrepose",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"Paramedic") then
		local nplayer = vRPclient.nearestPlayer(source,2)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local identity = vRP.getUserIdentity(parseInt(nuser_id))
				if vRP.request(source,"Deseja aplicar <b>"..parseInt(args[1]).." minutos</b> de repouso no(a) <b>"..identity.name.." "..identity.name2.."</b>?.",30) then
					vRP.reposeTimer(nuser_id,parseInt(args[1]))
					TriggerClientEvent("Notify",source,"sucesso","Você aplicou <b>"..parseInt(args[1]).." minutos</b> de repouso.",10000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WALKING
-----------------------------------------------------------------------------------------------------------------------------------------
local walking = {
	{ "move_m@alien" },
	{ "anim_group_move_ballistic" },
	{ "move_f@arrogant@a" },
	{ "move_m@brave" },
	{ "move_m@casual@a" },
	{ "move_m@casual@b" },
	{ "move_m@casual@c" },
	{ "move_m@casual@d" },
	{ "move_m@casual@e" },
	{ "move_m@casual@f" },
	{ "move_f@chichi" },
	{ "move_m@confident" },
	{ "move_m@business@a" },
	{ "move_m@business@b" },
	{ "move_m@business@c" },
	{ "move_m@drunk@a" },
	{ "move_m@drunk@slightlydrunk" },
	{ "move_m@buzzed" },
	{ "move_m@drunk@verydrunk" },
	{ "move_f@femme@" },
	{ "move_characters@franklin@fire" },
	{ "move_characters@michael@fire" },
	{ "move_m@fire" },
	{ "move_f@flee@a" },
	{ "move_p_m_one" },
	{ "move_m@gangster@generic" },
	{ "move_m@gangster@ng" },
	{ "move_m@gangster@var_e" },
	{ "move_m@gangster@var_f" },
	{ "move_m@gangster@var_i" },
	{ "anim@move_m@grooving@" },
	{ "move_f@heels@c" },
	{ "move_m@hipster@a" },
	{ "move_m@hobo@a" },
	{ "move_f@hurry@a" },
	{ "move_p_m_zero_janitor" },
	{ "move_p_m_zero_slow" },
	{ "move_m@jog@" },
	{ "anim_group_move_lemar_alley" },
	{ "move_heist_lester" },
	{ "move_f@maneater" },
	{ "move_m@money" },
	{ "move_m@posh@" },
	{ "move_f@posh@" },
	{ "move_m@quick" },
	{ "female_fast_runner" },
	{ "move_m@sad@a" },
	{ "move_m@sassy" },
	{ "move_f@sassy" },
	{ "move_f@scared" },
	{ "move_f@sexy@a" },
	{ "move_m@shadyped@a" },
	{ "move_characters@jimmy@slow@" },
	{ "move_m@swagger" },
	{ "move_m@tough_guy@" },
	{ "move_f@tough_guy@" },
	{ "move_p_m_two" },
	{ "move_m@bag" },
	{ "move_m@injured" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANDAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("andar",function(source,args,rawCommand)
	if args[1] then
		if not vCLIENT.getHandcuff(source) then
			vCLIENT.movementClip(source,walking[parseInt(args[1])][1])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FATURAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("faturas",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local nuser_id = vRP.prompt(source,"Passport:","")
		if nuser_id == "" or parseInt(nuser_id) <= 0 then
			return
		end

		local price = vRP.prompt(source,"Price:","")
		if price == "" or parseInt(price) <= 0 then
			return
		end

		local reason = vRP.prompt(source,"Reason:","")
		if reason == "" then
			return
		end

		local nplayer = vRP.getUserSource(parseInt(nuser_id))
		if nplayer then
			local identity = vRP.getUserIdentity(user_id)
			local answered = vRP.request(nplayer,"Deseja aceitar a fatura do(a) <b>"..identity.name.." "..identity.name2.."</b> no valor de <b>$"..vRP.format(parseInt(price)).." dólares</b>?",30)
			if answered then
				vRP.setInvoice(parseInt(nuser_id),parseInt(price),parseInt(user_id),tostring(reason))
				TriggerClientEvent("Notify",source,"sucesso","Fatura aceita com sucesso.",5000)
			else
				TriggerClientEvent("Notify",source,"negado","Fatura rejeitada pelo cliente.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("garagem",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local request = vRP.request(source,"Deseja comprar uma vaga na garagem por $<b>250.000 dólares</b>?",30)
		if request then
			if vRP.paymentBank(user_id,10000000) then
				vRP.execute("vRP/update_garages",{ id = parseInt(user_id) })
			else
				TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIVERY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("livery",function(source,args,rawCommand)
	local user_id = vRP.hasPermission(source)
	if user_id then
		if (vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Paramedic")) and parseInt(args[1]) > 0 then
			vCLIENT.toggleLivery(source,parseInt(args[1]))
		end
	end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- sistema de ver quantidade de players na cidade
-----------------------------------------------------------------------------------------------------------------------------------------

--[[ RegisterCommand('ptrid',function(source,args,rawCommand)
    local policia = vRP.hasPermission("Police")
	local users_id = ""
	for k,v in pairs(policia) do
		users_id = users_id..v..", "
	end
	TriggerClientEvent('chatMessage',source,"Alerta",{255,0,0},users_id)
end)

RegisterCommand('samuid',function(source,args,rawCommand)
    local policia = vRP.hasPermission("Medic")
	local users_id = ""
	for k,v in pairs(policia) do
		users_id = users_id..v..", "
	end
	TriggerClientEvent('chatMessage',source,"Alerta",{255,0,0},users_id)
end)




RegisterCommand('ptr',function(source,args,rawCommand)
	local policia = vRP.hasPermission("Police")
		local players = ""
		for k,v in pairs(policia) do
			if k ~= #policia then
				players = players..", "
			end
			players = players..k
		end
		TriggerClientEvent('chatMessage',source,"ID's ONLINE",{1, 136, 0},players)

end)

 ]]


















RegisterCommand('pon',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"sup2000") then
		local users = vRP.getUsers()
		local players = ""
		local quantidade = 0
		for k,v in pairs(users) do
			if k ~= #users then
				players = players..", "
			end
			players = players..k
			quantidade = quantidade + 1
		end
		TriggerClientEvent('chatMessage',source,"TOTAL ONLINE",{1, 136, 0},quantidade)
		TriggerClientEvent('chatMessage',source,"ID's ONLINE",{1, 136, 0},players)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("add",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(args[2]) > 0 then
			if args[1] == "Police" then
				if vRP.hasPermission(user_id,"PoliceCMD") then
					vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("waitPolice") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Paramedic" then
				if vRP.hasPermission(user_id,"ParamedicCMD") then
					vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("waitParamedic") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("rem",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(args[1]) > 0 then
			if vRP.hasPermission(user_id,"PoliceCMD") or vRP.hasPermission(user_id,"ParamedicCMD") then
				vRP.execute("vRP/cle_group",{ user_id = parseInt(args[1]) })
				TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[1])).."</b> removido com sucesso.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("trunkin",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
			TriggerClientEvent("vrp_player:EnterTrunk",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("checktrunk",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vRPclient.inVehicle(source) and not vCLIENT.getHandcuff(source) then
			local nplayer = vRPclient.nearestPlayer(source,2)
			if nplayer then
				TriggerClientEvent("vrp_player:CheckTrunk",nplayer)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEAT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("seat",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
			TriggerClientEvent("vrp_player:SeatPlayer",source,args[1])
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ptrid
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ptrid",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local onDuty = ""
				local service = {}

				--if vRP.hasPermission(user_id,"Police") then
					service = vRP.numPermission("Police")
				--end

				for k,v in pairs(service) do
					local nuser_id = vRP.getUserId(v)
					local identity = vRP.getUserIdentity(nuser_id)

					onDuty = onDuty.."<b>Passaporte:</b> "..vRP.format(parseInt(nuser_id)).."<br>"
				end

				TriggerClientEvent("Notify",source,"importante",onDuty,30000)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ptrid
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("samuid",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local onDuty = ""
				local service = {}

				--if vRP.hasPermission(user_id,"Paramedic") then
					service = vRP.numPermission("Paramedic")
				--end

				for k,v in pairs(service) do
					local nuser_id = vRP.getUserId(v)
					local identity = vRP.getUserIdentity(nuser_id)

					onDuty = onDuty.."<b>Passaporte:</b> "..vRP.format(parseInt(nuser_id)).."<br>"
				end

				TriggerClientEvent("Notify",source,"importante",onDuty,30000)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ONDUTY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("onduty",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
			if vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Paramedic") or vRP.hasPermission(user_id,"Taxi") then
				local onDuty = ""
				local service = {}

				if vRP.hasPermission(user_id,"Police") then
					service = vRP.numPermission("Police")
				elseif vRP.hasPermission(user_id,"Paramedic") then
					service = vRP.numPermission("Paramedic")
				elseif vRP.hasPermission(user_id,"Taxi") then
					service = vRP.numPermission("Taxi")
				end

				for k,v in pairs(service) do
					local nuser_id = vRP.getUserId(v)
					local identity = vRP.getUserIdentity(nuser_id)

					onDuty = onDuty.."<b>Passaporte:</b> "..vRP.format(parseInt(nuser_id)).."   -   <b>Nome:</b> "..identity.name.." "..identity.name2.."<br>"
				end

				TriggerClientEvent("Notify",source,"importante",onDuty,30000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cam",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and vRP.hasPermission(user_id,"Police") then
			TriggerClientEvent("vrp_player:serviceCamera",source,tostring(args[1]))
		end
	end
end)



------------------- CELLULAR COMANDO RJ


RegisterCommand("beijar2",function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRPclient.nearestPlayer(source,2)
    if nplayer then
        local pedido = vRP.request(nplayer,"Deseja iniciar o beijo ?",10)
        if pedido then
			vRPclient._playAnim(source,true,{"mp_ped_interaction","kisses_guy_a"},true)    
			--vRPclient._playAnim(nplayer,true,{"mp_ped_interaction","kisses_guy_b"},true)
            vRPclient._playAnim(nplayer,true,{"mp_ped_interaction","kisses_guy_b"},true)
        end
    end
end)