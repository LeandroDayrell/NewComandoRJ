local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Proxy.getInterface("vRP")

blzr = {}
Tunnel.bindInterface("blzr_desmanchar2", blzr)

vCLIENT = Tunnel.getInterface("blzr_desmanchar2")

local desmanche = "https://discordapp.com/api/webhooks/747572069881086093/DXsPSndJqmHHHKZAa74SPA7Rbb070CYhsKrUa1M16zWh-oRXj9MjkfIYBwwCtxESATdo"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

------------------------------------------------------
-- CONFIG 
------------------------------------------------------
local RestritoParaDesmanche = true -- É restrito para quem tiver só a permissão do desmanche? (TRUE/FALSE)
local PermissaoDesmanche = 'motoclub.permissao' or 'pca.permissao' -- Se RestritoParaDesmanche for TRUE, aqui deverá ter a permissão que será verifiada.

local PrecisaDeItem = false -- Precisa de item para iniciar o desmanche? (TRUE/FALSE)
local ItemNecessario = 'detonador' -- Qual item precisa para iniciar o desmanche?
local QtdNecessaria = 0 -- Quantos itens precisará para iniciar o desmanche?


local CarrosDesmanches = {

-------------------------------------------------------------------------|
----- CONCESSIONÁRIA ----------------------------------------------------|
-------------------------------------------------------------------------| 
    
    ['adder'] = 40000 ,
    ['akuma'] = 40000 ,
    ['asbo'] = 4000 ,
    ['baller3'] = 6000 ,
    ['bati'] = 36000 ,
    ['bestiagts'] = 60000 ,
    ['bf400'] = 38800 ,
    ['blista2'] = 4000 ,
    ['bmwm3e36'] = 140000 ,
    ['brioso'] = 4000 ,
    ['buccaneer2'] = 10000 ,
    ['caracara2'] = 48000 ,
    ['carbonizzare'] = 40000 ,
    ['carbonrs'] = 12000 ,
    ['contender'] = 6000 ,
    ['coquette'] = 16000 ,
    ['coquette2'] = 20000 ,
    ['coquette4'] = 80000 ,
    ['cyclone'] = 60000 ,
    ['daemon'] = 8000 ,
    ['diablous'] = 24000 ,
    ['dinghy'] = 10000 ,
    ['dodgechargersrt'] = 140000 ,
    ['dominator3'] = 28000 ,
    ['double'] = 40000 ,
    ['dubsta'] = 4000 ,
    ['ellie'] = 9200 ,
    ['emerus'] = 60000 ,
    ['esskey'] = 12800 ,
    ['everon'] = 40000 ,
    ['exemplar'] = 22000 ,
    ['f620'] = 16000 ,
    ['faggio'] = 4000 ,
    ['felon2'] = 6800 ,
    ['freecrawler'] = 28000 ,
    ['fugitive'] = 4000 ,
    ['furia'] = 80000 ,
    ['gresley'] = 3200 ,
    ['guardian'] = 7200 ,
    ['hakuchou'] = 40000 ,
    ['hakuchou2'] = 60000 ,
    ['imorgon'] = 40000 ,
    ['impaler'] = 4000 ,
    ['italigto'] = 80000 ,
    ['italirsx'] = 140000 ,
    ['jester3'] = 30000 ,
    ['jetmax'] = 10400 ,
    ['jugular'] = 68000 ,
    ['kamacho'] = 6000 ,
    ['komoda'] = 60000 ,
    ['lancerevolutionx'] = 180000 ,
    ['longfin'] = 40000 ,
    ['manchez'] = 20000 ,
    ['mesa3'] = 24000 ,
    ['minivan'] = 4000 ,
    ['neon'] = 40000 ,
    ['nightblade'] = 20000 ,
    ['novak'] = 40000 ,
    ['oracle2'] = 12000 ,
    ['osiris'] = 64000 ,
    ['panto'] = 4000 ,
    ['paradise'] = 3800 ,
    ['pcj'] = 4000 ,
    ['picador'] = 4000 ,
    ['raiden'] = 40000 ,
    ['reaper'] = 40000 ,
    ['rebla'] = 60000 ,
    ['regina'] = 4000 ,
    ['ruffian'] = 18000 ,
    ['rumpo3'] = 28000 ,
    ['sabregt2'] = 12000 ,
    ['sanchez2'] = 8800 ,
    ['sandking2'] = 10000 ,
    ['schlagen'] = 60000 ,
    ['seashark3'] = 6800 ,
    ['serrano'] = 4000 ,
    ['silvias15'] = 80000 ,
    ['speeder2'] = 10000 ,
    ['speedo'] = 9200 ,
    ['stratum'] = 4000 ,
    ['sultanrs'] = 20000 ,
    ['suntrap'] = 9200 ,
    ['t20'] = 100000 ,
    ['tailgater'] = 4000 ,
    ['taipan'] = 40000 ,
    ['thrax'] = 80000 ,
    ['tropic'] = 10800 ,
    ['turismo2'] = 28000 ,
    ['turismor'] = 84000 ,
    ['tyrant'] = 60000 ,
    ['vader'] = 4000 ,
    ['vamos'] = 4000 ,
    ['voltic'] = 12800 ,
    ['vortex'] = 10000 ,
    ['weevil'] = 4000 ,
    ['windsor2'] = 10800 ,
    ['wolfsbane'] = 6000 ,
    ['xa21'] = 80000 ,
    ['xls'] = 6000 ,
    ['youga2'] = 32000 ,
    ['zentorno'] = 60000 ,
    ['zion2'] = 6800 ,
    ['zombieb'] = 10000 ,
    ['zorrusso'] = 100000 ,
        
    ----------------------------------------------------------------------|
    ----- CARROS VIPS ----------------------------------------------------|
    ----------------------------------------------------------------------| 

    ['bmwi8'] = 80000,
    ['bmwm3e36'] = 80000,
    ['bmwm4gts'] = 80000,
    ['civictyper'] = 80000,
    ['dodgechargersrt'] = 80000,
    ['ferrari812'] = 80000,
    ['ferrarif12'] = 80000,
    ['ferrariitalia'] = 80000,
    ['fordmustang'] = 80000,
    ['lamborghinihuracan'] = 80000,
    ['lancerevolutionx'] = 80000,
    ['mazdarx7'] = 80000,
    ['mclarenp1'] = 80000,
    ['mclarensenna'] = 80000,
    ['mercedesgt63'] = 80000,
    ['mustangfast'] = 80000,
    ['nissangtr'] = 80000,
    ['nissangtr2'] = 80000,
    ['nissangtrnismo'] = 80000,
    ['silvias15'] = 80000,
    ['skyliner34'] = 80000,
    ['subaruimpreza'] = 80000,
    ['teslaprior'] = 80000,
    ['toyotasupra'] = 80000,
    ['asbo'] = 80000,
    ['weevil'] = 80000,
    ['zr380s'] = 80000,
    ['720s'] = 80000,
    ['911r'] = 80000,
    ['amggtr'] = 80000,
    ['aventador'] = 80000,
    ['bmci'] = 80000,
    ['bmwm8'] = 80000,
    ['bugatti'] = 80000,
    ['c981'] = 80000,
    ['dl2016'] = 80000,
    ['fc15'] = 80000,
    ['ferrariitalia'] = 80000,
    ['fordmustang'] = 80000,
    ['foxsupra'] = 80000,
    ['frontiercivil'] = 80000,
    ['fxxk16'] = 80000,
    ['g65'] = 80000,
    ['golf75r'] = 80000,
    ['hilux1'] = 80000,
    ['huracan'] = 80000,
    ['mazdarx7'] = 80000,
    ['nissangtrnismo'] = 80000,
    ['nissanskyliner34'] = 80000,
    ['panameragts'] = 80000,
    ['pistaspider19'] = 80000,
    ['r1250'] = 80000,
    ['r1'] = 80000,
    ['r820'] = 80000,
    ['raptor2017'] = 80000,
    ['s1000rr'] = 80000,
    ['tiger'] = 80000,
    ['ursa'] = 80000,
    ['x6m'] = 80000,
    ['mule'] = 80000,
    ['burrito'] = 80000,
    ['hauler'] = 80000,
    ['cb500x'] = 80000,
    ['rmodgt63'] = 80000,
    ['fordmustanggt'] = 80000,

    




}

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------


-- RETORNA VEICULOS PERMITIDOS
function blzr.GetVehs()
    return CarrosDesmanches
end


-- FUNÇÃO VERIFICAR PERMISSÃO DO DESMANCHE
function blzr.CheckPerm()
    local source = source
    local user_id = vRP.getUserId(source)
    if RestritoParaDesmanche then
        if vRP.hasPermission(user_id,"Admin") then
            return true
        end
        return false
    end
    return true
end

-- FUNÇÃO PRA VERIFICAR SE POSSUI O ITEM
function blzr.CheckItem()
    local source = source
    local user_id = vRP.getUserId(source)
    if PrecisaDeItem then
        if vRP.tryGetInventoryItem(user_id,ItemNecessario,QtdNecessaria) then
            return true
        end
        return false
    end
    return true
end


-- FUNÇÃO PARA GERAR O PAGAMENTO E OS ITENS
function blzr.GerarPagamento(placa, nomeFeio, nomeBonito)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    
    for k, v in pairs(CarrosDesmanches) do
        if string.upper(k) == string.upper(nomeFeio) then
            local pagamento = v
            
            --if vRP.paymentBank(user_id,parseInt(vRP.vehiclePrice(name)*0.1)) then
            --vRP.giveInventoryItem(user_id,'dollars2',pagamento,true) -- DINHEIRO SUJO BACKUP
            local vehicle = vRP.query("vRP/get_vehicles",{ user_id = parseInt(user_id), vehicle = name })
            vRP.giveInventoryItem(user_id,'dollars2',parseInt(vRP.vehiclePrice(name)*0.1),true) -- DINHEIRO SUJO
            local vehicle,vehNet,vehName = vRPclient.vehList(source,7)
            local plateUser = placa
            local vehName = nomeFeio
             vRP.execute("vRP/set_desmanche",{ user_id = parseInt(user_id), vehicle = vehName, desmanche = 1, time = parseInt(os.time()) }) 
            vCLIENT.deleteVehicle(source,vehicle)
        end
    end
end  



--[[ -- FUNÇÃO PARA GERAR O PAGAMENTO E OS ITENS
function blzr.GerarPagamento(placa, nomeFeio, nomeBonito)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    for k, v in pairs(CarrosDesmanches) do
        if string.upper(k) == string.upper(nomeFeio) then
            local pagamento = v
            -- vRP.giveMoney(user_id,pagamento) -- DINHEIRO LIMPO
            vRP.giveInventoryItem(user_id,'dinheirosujo',pagamento) -- DINHEIRO SUJO

            local puser_id = vRP.getUserByRegistration(placa)
            if puser_id then
                local value = vRP.getUData(puser_id,'vRP:multas')
                local multas = json.decode(value) or 0
                multas = multas + pagamento
                vRP.setUData(puser_id,'vRP:multas',json.encode(parseInt(multas)))
                local nsource = vRP.getUserSource(puser_id)
                if nsource then
                    TriggerClientEvent('Notify', nsource, 'aviso', 'AVISO SEGURADORA', 'Você foi multado em <b>R$' .. vRP.format(pagamento) .. '</b> referente ao seguro do veículo <b>' .. nomeBonito .. ' (' .. nomeFeio .. ')</b>.')
                end
            end
            TriggerClientEvent("vrp_sound:source",source,'coins',0.3)
            TriggerClientEvent('Notify', source, 'sucesso', 'Vendedor Desmanche', 'Você recebeu <b>R$'..vRP.format(pagamento)..'</b> pelo desmanche de um <b>'..nomeBonito..' ('.. nomeFeio..' - PLACA [' .. placa .. '])</b>.' )
            SendWebhookMessage(desmanche,"```prolog\n[PASSAPORTE]: "..user_id.." \n[NOME]: "..identity.name.." "..identity.firstname.." \n[DESMANCHOU]: "..nomeBonito.."  \n[PLACA]: ".. placa .." \n[E RECEBEU]: ".. vRP.format(pagamento) .." "..os.date("\n[Data]: %d/%m/%y \n[Hora]: %H/%M/%S").." \r```")
        end
    end
end ]]










--[[             local puser_id = vRP.getUserByRegistration(placa)
            if puser_id then
                local value = vRP.getUData(puser_id,'vRP:multas')
                local multas = json.decode(value) or 0
                multas = multas + pagamento
                vRP.setUData(puser_id,'vRP:multas',json.encode(parseInt(multas)))
                local nsource = vRP.getUserSource(puser_id)
                if nsource then
                    TriggerClientEvent('Notify', nsource, 'aviso', 'AVISO SEGURADORA', 'Você foi multado em <b>R$' .. vRP.format(pagamento) .. '</b> referente ao seguro do veículo <b>' .. nomeBonito .. ' (' .. nomeFeio .. ')</b>.')
                end
            end
            end
    end
end ]]


