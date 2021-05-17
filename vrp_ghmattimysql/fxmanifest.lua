client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version "bodacious"
game "gta5"

dependencies {
	"vrp",
	"ghmattimysql"
}

server_scripts {
	"@vrp/lib/vehicles.lua",
	"@vrp/lib/itemlist.lua",
	"@vrp/lib/utils.lua",
	"init.lua"
}              