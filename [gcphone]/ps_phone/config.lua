Config = {}

Config.Token         = "f06Sc8dyn2CDMhy3zLn2mdahIHtQr2I92029M9KDfsd09T3awV0d8s7Y1szf"
Config.LicenseKey    = "CCM6-29WN-MLR9-DTCQ"
Config.RepeatTimeout = 2000
Config.CallRepeats   = 10
Config.OpenPhone     = "k"
Config.Webhook       = "https://discord.com/api/webhooks/831322802400788530/mlewQZFQ6A0lmVcfwXYt6yJgC9XDtY5MZ4VpkiYDpxSTxmBroURqvUumWeyLO7cEAI-d"
Config.WebhookBank   = "https://discord.com/api/webhooks/846827374423441428/ESKor9bTIXXbfjoLsrur8ph2paOExO5G8dl0K40R2c6yAEOy33yLprt8SMULCLpTk6PB"
Config.Field         = "files[]"
Config.VerifyItem    = true
Config.ItemPhone     = "cellphone"
Config.CallSystem    = "tokovoip" --tokovoip | mumblevoip | saltychat | pmavoice
Config.UseInvoices   = true --true | false
Config.CheckLife     = 101
Config.IPAddress     = "http://131.196.198.113/"
Config.Permission    = "FundadorOwner" -- Grupo de Permisssão para adicionar verificado
Config.NotifyAll     = true -- Ativar notificaçõpes globais no servidor
Config.AllPostsInsta = true -- Ativar todos os post dos instagram
Config.UseMoving     = true -- Usar o celular e andar
Config.ButtonDisable = { --https://docs.fivem.net/docs/game-references/controls/
    0,
    1,
    2,
    22, 
    24, 
    26, 
    36, 
    37, 
    60, 
    62, 
    106,
    114,
    121,
    140,
    141,
    142,
    199,
    245,
    257,
    263,
    264,
    309,
    331,
}

Config.HelpList = {
    ['policia'] = {
        name        = "Emergência",
        description = "PMERJ",
        text        = "Chame uma Unidade movél",
        message     = "Descreva a situação:",
        emergency   = true,
        staff       = false,
        image       = "https://cdn.discordapp.com/attachments/705812876396331609/842075473194516520/unknown.png",
        style       = "top: 30px;",
        groups      = {
            "Police"
        }
    },
    ['ems'] = {
        name        = "Emergência",
        description = "Chame uma unidade móvel",
        text        = "Chame uma Unidade movél",
        message     = "Descreva a situação:",
        emergency   = true,
        staff       = false,
        image       = "https://gtapolicemods.com/uploads/monthly_2020_11/Rambulance.png.d24e5be1cafdffe6786dd1f8dcd64678.png",
        style       = "top: 370px;",
        groups      = {
            "SamuEnfermeiro", "SamuMedico", "SamuCoordenador", "SamuViceDiretor", "SamuDiretor"
        }
    },
    ['mecanico'] = {
        name        = "Los Santos Customs",
        description = "Chame um Mecânico(a)",
        text        = "Chame um profissional mais próximo",
        message     = "Descreva seu problema:",
        emergency   = true,
        staff       = false,
        image       = "https://cdn.discordapp.com/attachments/705812876396331609/842076531429867540/unknown.png",
        style       = "top: 730px;",
        groups      = {
            "LosSantos"
        }
    },

    --[[ ['taxista'] = {
        name        = "Taxista",
        description = "Chame um taxi",
        text        = "Chame um profissional mais próximo",
        message     = "Descreva seu problema:",
        emergency   = true,
        staff       = false,
        image       = "https://static.fecam.net.br/uploads/327/imagens/2429818.jpeg",
        style       = "top: 730px;",
        groups      = {
            "Taxista"
        }
    }, ]]

    ['staff'] = {
        name        = "FALAR COM A",
        description = "Prefeitura",
        text        = "Chame alguem da prefeitura",
        message     = "Descreva a situação:",
        emergency   = true,
        staff       = false,
        image       = "https://cdn.discordapp.com/attachments/705812876396331609/842077631683231794/unknown.png",
        style       = "top: 1000px;",
        groups      = {
            "chamado"
        }
    }
}

Config.checkItemPhone = function(user_id, item)
    if vRP.getInventoryItemAmount(user_id, item) >= 1 then
        return true
    else
        TriggerClientEvent("Notify",source,"negado","Você não possui um celular em sua mochila.")
        return false
    end
end

Config.getBankUser = function(user_id)
    return vRP.getBankMoney(user_id)
end

Config.paymentBank = function(source, user_id, nsource, nuser_id, amount)
    if source and user_id and nsource and nuser_id and amount then

        if parseInt(amount) > 0 then

            local bank = vRP.getBankMoney(user_id)
            local bank_sender = vRP.getBankMoney(nuser_id)

            if bank >= parseInt(amount) then

                --remove bank
                vRP.paymentBank(user_id, parseInt(amount))
        
                --add bank
                vRP.addBank(nuser_id, parseInt(amount))

                TriggerClientEvent("Notify",source,"sucesso","Enviou <b>$"..vRP.format(parseInt(amount)).." dólares</b> ao passaporte <b>"..parseInt(nuser_id).."</b>.",8000)

                local identity2 = vRP.getUserIdentity(user_id)
                if identity2 ~= nil then
                    TriggerClientEvent("Notify", nsource, "importante","<b>"..identity2.name.." "..identity2.name2.."</b> transferiu <b>$"..vRP.format(parseInt(amount)).." dólares</b> para sua conta.",8000)
                end

                local time = os.date("%d/%m/%Y %H:%M:%S")

                local data = {
                    {
                        fields = {
                            { name = "TRANSFERÊNCIA BANCÁRIA", value = time },
                            { name = "Passaporte de Envio", value = user_id, inline = true },
                            { name = "Passaporte de Destino", value = nuser_id, inline = true },
                            { name = "Valor Enviado", value = amount }
                        },
                        color = "3066993"
                    }
                }

                SendWebhookEmbed(Config.WebhookBank, data)
                
                return true
            else
                TriggerClientEvent("Notify",source, "negado","Dinheiro insuficiente.",8000)
                return false
            end
        else
            TriggerClientEvent("Notify",source, "negado","Dinheiro insuficiente.",8000)
            return false
        end
    end
    return false
end

Config.AddRecentCall = function(source, identity, anonymous, label, type)
    if source and identity and label and type then
        TriggerClientEvent('ps_phone:AddRecentCall', source, {
            name = identity.name .. " " ..identity.name2,
            number = identity.phone,
            anonymous = anonymous
        }, label, type)
    end
    return false
end

Config.GetUserGroup = function(group)
    return vRP.getUsersByPermission(group)
end

Config.GetUserPosition = function(source)
    return vRPclient.getPosition(source)
end
--- ORIGINAL 
--[[ Config.HelpAccept = function(answered, source, player, user_id, nuser_id, identityrequest, adm, message, x, y, z)
    TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identityrequest.name.." "..identityrequest.firstname.."^0 ["..user_id.."], "..message)
    local ok = vRP.request(player,"Aceitar o chamado de <b>"..identityrequest.name.." "..identityrequest.firstname.."</b>?",30)
    if ok then
        if not answered then
            local identity = vRP.getUserIdentity(nuser_id)
            TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
            vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
            vRPclient._setGPS(player,x,y)
            return true
        else
            TriggerClientEvent("Notify",player,"importante","Chamado ja foi atendido por outra pessoa.")
            vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
            return false
        end
    end
end

Config.HelpSetBlip = function(player, blips, idgens, id, x, y, z)
    blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
    SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
end ]]


Config.HelpAccept = function(answered, source, player, user_id, nuser_id, identityrequest, adm, message)
    TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identityrequest.name.." "..identityrequest.name2.."^0 ["..user_id.."], "..message)
    local ok = vRP.request(player,"Aceitar o chamado de <b>"..identityrequest.name.." "..identityrequest.name2.."</b>?",30)
    if ok then
        if not answered then
            local identityuser = vRP.getUserIdentity(nuser_id)
            local x,y,z = vRPclient.getPositions(source)
            TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identityuser.name.." "..identityuser.name2.."</b>, aguarde no local.")
            vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
           -- vRPclient._setGPS(player,x,y)
            TriggerClientEvent("NotifyPush",player,{ code = 1, title = "Chamado", x = x, y = y, z = z, name = identityrequest.name.." "..identityrequest.name2, rgba = {124,124,124} })
            
            return true
        else
            TriggerClientEvent("Notify",player,"importante","Chamado ja foi atendido por outra pessoa.")
            vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
            return false
        end
    end
end

return Config