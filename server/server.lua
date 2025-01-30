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