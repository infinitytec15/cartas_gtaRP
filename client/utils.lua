local Utils = {}

function Utils.ShuffleDeck()
    local cards = {"Ás", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Valete", "Dama", "Rei"}
    local suits = {"Ouros", "Copas", "Espadas", "Paus"}
    local deck = {}

    for _, suit in ipairs(suits) do
        for _, card in ipairs(cards) do
            table.insert(deck, card .. " de " .. suit)
        end
    end

    for i = #deck, 2, -1 do
        local j = math.random(i)
        deck[i], deck[j] = deck[j], deck[i]
    end

    return deck
end

function Utils.DealCards(deck, numCards)
    local hand = {}
    for i = 1, numCards do
        table.insert(hand, table.remove(deck))
    end
    return hand
end

return Utils