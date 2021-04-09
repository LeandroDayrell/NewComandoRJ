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