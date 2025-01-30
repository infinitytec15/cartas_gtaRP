local NativeUI = {}

function NativeUI.CreateMenu(title, subtitle)
    local menu = {}
    menu.title = title
    menu.subtitle = subtitle
    menu.items = {}
    return menu
end

function NativeUI.AddItem(menu, item)
    table.insert(menu.items, item)
end

function NativeUI.ShowNotification(text)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(true, true)
end

return NativeUI