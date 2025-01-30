fx_version 'cerulean'
game 'gta5'

author 'Seu Nome'
description 'Jogo de Cartas Online para GTA 5 RP'
version '1.0.0'

ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/style.css',
    'html/script.js'
}

client_scripts {
    'client/utils.lua',
    'client/NativeUI.lua',
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

shared_scripts {
    'shared/config.lua'
}

dependencies {
    'vrp', -- Para compatibilidade com vRPex
    'creative' -- Para compatibilidade com Creative
}