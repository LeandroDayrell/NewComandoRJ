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
    
    ['150'] = 8500,
    ['cyclone'] = 8500,
    ['contender'] = 8500,
    ['amarok'] = 380000,
    ['biz25'] = 5000,
    ['bros60'] = 15000,
    ['civic2016'] = 70000,
    ['dm1200'] = 10000,
    ['ds4'] = 30000,
    ['eletran17'] = 40000,
    ['evoq'] = 145000,
    ['fiat'] = 10000,
    ['fiatstilo'] = 75000, 
    ['fiattoro'] = 180000, 
    ['fiatuno'] = 13000, 
    ['fordka'] = 10000, 
    ['fusion'] = 75000,
    ['golg7'] = 20000, 
    ['hornet'] = 70000, 
    ['jetta2017'] = 50000, 
    ['l200civil'] = 90000, 
    ['monza'] = 15000, 
    ['p207'] = 18000, 
    ['palio'] = 18000, 
    ['punto'] = 48000,
    ['santafe'] = 60000, 
    ['saveiro'] = 35000, 
    ['sonata18'] = 75000, 
    ['upzinho'] = 23000, 
    ['veloster'] = 50000, 
    ['voyage'] = 20000,
    ['vwgolf'] = 45000, 
    ['vwpolo'] = 30000, 
    ['xj'] = 65000, 
    ['xt66'] = 45000, 
    ['z1000'] = 100000, 
    ['dune'] = 450000,
    ['audirs6'] = 600500, 
    ['audirs7'] = 600500, 
    ['bmwm3f80'] = 600000, 
    ['bmwm4gts'] = 400000,
    ['dodgechargersrt'] = 800000,
    ['focusrs'] = 400000,
    ['fordmustang'] = 600000,
    ['hondafk8'] = 750000,
    ['lancerevolution9'] = 600500,
    ['lancerevolutionx'] = 600500, --
    ['f150'] = 70000,
    ['evoque'] = 350000,
    ['mazdarx7'] = 420000,
    ['mercedesa45'] = 420000,
    ['mustangmach1'] = 380000,
    ['nissan370z'] = 380000,
    ['nissangtr'] = 380000,
    ['nissangtrnismo'] = 380000,
    ['nissanskyliner34'] = 380000,
    ['porsche930'] = 420000,
    ['raptor2017'] = 380000,
    ['teslaprior'] = 600500,
    ['toyotasupra'] = 380000,
    ['ruiner'] = 80000,
    ['verlierer2'] = 15000,
    ['sentinel'] = 5000,
    ['intruder'] = 15000,
    ['asea'] = 18000,
    ['sultanrs'] = 210000,
    ['casco'] = 9000,
    ['zentorno'] = 250000,
    ['voltic'] = 250000,
    ['sanchez'] = 6000,
    ['manchez'] = 17820,
    ['santafe'] = 45000,
    
----------------------------------------------------------------------|
----- CARROS VIPS ----------------------------------------------------|
----------------------------------------------------------------------| 

    ['r1'] = 90000,
    ['zx10r'] = 90000,
    ['tiger'] = 130000,
    ['i8'] = 780000,
    ['ferrariitalia'] = 800000,
    ['lamborghinihuracan'] = 650000,
    ['t20'] = 650000,
    ['laferrari15'] = 800000,
    ['tyrant'] = 550000,
    ['r1250'] = 350000,
    ['divo'] = 800000,

    




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
            -- vRP.giveMoney(user_id,pagamento) -- DINHEIRO LIMPO
            vRP.giveInventoryItem(user_id,'dollars',pagamento,true) -- DINHEIRO SUJO
            local vehicle,vehNet,vehName = vRPclient.vehList(source,7)
            print('Placa 01: '..placa)
            local plateUser = placa
            print('Placa 02')
            print(plateUser)
            print('Placa 02: '..placa)
            print(nomeFeio)
            print(nomeBonito)
            --local plateUser = vRP.getVehiclePlate(vehPlate)
		    local inVehicle = vRP.query("vRP/get_vehicles",{ user_id = parseInt(plateUser), vehicle = vehName })
            print('Placa 03')
             vRP.execute("vRP/set_desmanche",{ user_id = parseInt(plateUser), vehicle = vehName, desmanche = 1, time = parseInt(os.time()) })
             print('---------------------')
             print(user_id)
             print(plateUser)
             print(vehicle)
             print(NomeFeio)

           -- TriggerClientEvent('Notify', source, 'sucesso', 'Vendedor Desmanche', 'Você recebeu <b>R$'..vRP.format(pagamento)..'</b> pelo desmanche de um <b>'..nomeBonito..' ('.. nomeFeio..' - PLACA [' .. placa .. '])</b>.' )
            print('teste 04')
        end
    end
end  



--[[ -- FUNÇÃO PARA GERAR O PAGAMENTO E OS ITENS
function blzr.GerarPagamento(placa, nomeFeio, nomeBonito)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    for k, v in pairs(CarrosDesmanches) do
        print('Placa 01: '..placa)
        if string.upper(k) == string.upper(nomeFeio) then
            local pagamento = v
            -- vRP.giveMoney(user_id,pagamento) -- DINHEIRO LIMPO
            vRP.giveInventoryItem(user_id,'dinheirosujo',pagamento) -- DINHEIRO SUJO

            local puser_id = vRP.getUserByRegistration(placa)
            print('Placa 02: '..placa)
            print('Placa 03: '..puser_id)
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


