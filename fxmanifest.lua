fx_version 'adamant'

lua54 'yes'

game "gta5"

author "R.#1524"

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/*'
}

escrow_ignore {
    'client/blips.lua',
    'config.lua',
}

client_scripts {
    "client/client.lua",
    "client/blips.lua",
    "config.lua"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "config.lua",
    "server/server.lua",
}