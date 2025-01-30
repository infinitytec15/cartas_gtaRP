local players = {}

RegisterServerEvent('cardGame:startGame')
AddEventHandler('cardGame:startGame', function()
    local playerId = source
    players[playerId] = true
    TriggerClientEvent('cardGame:updatePlayers', -1, players)
end)

RegisterServerEvent('cardGame:leaveGame')
AddEventHandler('cardGame:leaveGame', function()
    local playerId = source
    players[playerId] = nil
    TriggerClientEvent('cardGame:updatePlayers', -1, players)
end)


-- Verifica qual framework está sendo usado
local framework = ""
if GetResourceState('vrp') == 'started' then
    framework = "vrp"
elseif GetResourceState('creative') == 'started' then
    framework = "creative"
else
    print("^1[AVISO] Nenhum framework compatível (vRPex ou Creative) foi detectado.^7")
end

-- Função para adicionar dinheiro ao jogador (exemplo de integração)
function AddMoney(playerId, amount)
    if framework == "vrp" then
        local user_id = vRP.getUserId({playerId})
        if user_id then
            vRP.giveMoney({user_id, amount})
        end
    elseif framework == "creative" then
        TriggerClientEvent('creative:addMoney', playerId, amount)
    else
        print("^1[ERRO] Nenhum framework compatível para adicionar dinheiro.^7")
    end
end

-- Exemplo de uso
RegisterServerEvent('cardGame:rewardWinner')
AddEventHandler('cardGame:rewardWinner', function(amount)
    local playerId = source
    AddMoney(playerId, amount)
    TriggerClientEvent('cardGame:notify', playerId, "Você ganhou $" .. amount .. " no jogo de cartas!")
end)