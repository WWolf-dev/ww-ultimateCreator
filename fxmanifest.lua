fx_version 'cerulean'

game 'gta5'

lua54 'yes'

author 'White Wolf'

version '1.0.0'

description 'Ultimate Creator to create jobs / drugs / activites /illegal things and much more....'

shared_scripts {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'shared/Framework.lua',
    'shared/Translation.lua',
    'shared/Webhooks.lua',
    'shared/main.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js',
    'html/fonts/*',
    'html/img/*',
    'html/sound/*'
}

dependencies {
    '/server:6000',
    '/onesync',
    'oxmysql',
    '/gameBuild:mpchristmas3'
}