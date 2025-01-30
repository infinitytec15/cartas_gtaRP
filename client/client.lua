local Utils = require 'client/utils'
local NativeUI = require 'client/NativeUI'

local deck = Utils.ShuffleDeck()
local playerHand = Utils.DealCards(deck, Config.CardsPerPlayer)

local menu = NativeUI.CreateMenu(Config.GameName, "Bem-vindo ao Jogo de Cartas")

NativeUI.AddItem(menu, {label = "Ver Minhas Cartas", value = "view_cards"})
NativeUI.AddItem(menu, {label = "Jogar", value = "start_game"})

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 51) then -- Tecla E
            NativeUI.ShowNotification("Menu aberto!")
            -- Aqui você pode abrir o menu de interface
        end
    end
end)