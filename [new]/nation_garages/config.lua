local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

config = {}
Proxy.addInterface("nation_garages", config)

----------------------------------------------
----------------- CONFIG ---------------------
----------------------------------------------

config.detido = 4 -- taxa para ser paga quando o veiculo for detido (porcentagem do valor do veiculo)
config.seguradora = 4 -- taxa para ser paga quando o veiculo estiver apreendido (porcentagem do valor do veiculo)
config.ipva = 1 -- taxa para ser paga quando o veiculo estiver com o ipva atrasado (porcentagem do valor do veiculo)
config.use_tryFullPayment = true -- quando true, aceita pagamentos de taxas com o dinheiro do banco
config.dv_permission = "modder21" -- permissao para dv
config.guardar_veiculo_proximo = true -- mostrar botão de guardar veículo próximo
config.client_vehicle = true -- spawn via client side

----------------------------------------------
----------------- MARKERS --------------------
----------------------------------------------


--- TIPOS DE MARKERS (DEFINIDO NO ATRIBUTO MARKER DE CADA GARAGEM) ---
config.markers = {
	["avião"] = 33,
	["helicóptero"] = 34,
	["barco"] = 35,
	["carro"] = 36,
	["moto"] = 37,
	["bicicleta"] = 38,
	["truck"] = 39,
}

config.drawMarker = function(coords,marker) -- funcao para desenhar os markers das garagens no chão
	local idTop = config.markers[marker] or config.markers["carro"] 
	local idBase = 27
	DrawMarker(idTop,coords,0,0,0,0,0,0,1.0,1.0,1.0,153, 102, 255,155,1,1,1,1)
	DrawMarker(idBase,coords.x,coords.y,coords.z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,102, 0, 255,155,0,0,0,1)
end

----------------------------------------------
----------------- BLIPS ----------------------
----------------------------------------------

config.showBlips = false -- quando true, mostra os blips das garagens públicas no mapa
config.blipId = 357 -- id do blip
config.blipColor = 7 -- cor do blip
config.blipSize = 0.4 -- tamanho do blip

----------------------------------------------
----------------------------------------------
----------------------------------------------


----------------------------------------------
-------- DELETAR VEICULOS INATIVOS -----------
----------------------------------------------

config.reset = false -- quando true, deleta os veículos que estão parados durante um determinado tempo
config.tempoReset = 60 -- tempo para deletar um veículo inativo (em minutos)

----------------------------------------------
----------------------------------------------
----------------------------------------------

----------------------------------------------
----------------- IMAGENS --------------------
----------------------------------------------

config.defaultImg = "https://svgsilh.com/svg/160895.svg" -- imagem default
config.imgDir = "http://131.196.198.113/vehicles/" -- url ou diretorio das imagens

----------------------------------------------
----------------------------------------------
----------------------------------------------



----------------------------------------------
----------- LISTA DE VEÍCULOS ----------------
----------------------------------------------



config.vehList = {
	{ hash = -998177792, name = 'visione', price = 600000, banido = false, modelo = 'Visione', capacidade = 85, tipo = 'cars', class = "vip"  },
	{ hash = 758895617, name = 'ztype', price = 100, banido = false, modelo = 'Ztype', capacidade = 50, tipo = 'cars'  },
	{ hash = -1022830589, name = 'fordexplorer', price = 100, banido = false, modelo = 'Ford Explorer', capacidade = 85, tipo = 'cars'  },
	{ hash = -331467772, name = 'italigto', price = 1600000, banido = false, modelo = 'Italigto', capacidade = 85, tipo = 'cars'  },
	{ hash = 1922257928, name = 'sheriff2', price = 100, banido = true, modelo = 'Sheriff 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1207431159, name = 'armytanker', price = 100, banido = false, modelo = 'Armytanker', capacidade = 120, tipo = 'cars'  },
	{ hash = -1435527158, name = 'khanjali', price = 100, banido = false, modelo = 'Khanjali', capacidade = 120, tipo = 'cars'  },
	{ hash = -13524981, name = 'bmwm4gts', price = 1500000, banido = false, modelo = 'BMW M4 GTS', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 1951180813, name = 'taco', price = 100, banido = false, modelo = 'Taco', capacidade = 70, tipo = 'cars'  },
	{ hash = -757735410, name = 'fcr2', price = 140000, banido = false, modelo = 'Fcr 2', capacidade = 85, tipo = 'bikes'  },
	{ hash = 686471183, name = 'drafter', price = 600000, banido = false, modelo = 'Audi A8', capacidade = 85, tipo = 'cars'  },
	{ hash = 349605904, name = 'chino', price = 5000000, banido = false, modelo = 'Chino', capacidade = 40, tipo = 'cars'  },
	{ hash = 301427732, name = 'hexer', price = 40000, banido = false, modelo = 'Hexer', capacidade = 50, tipo = 'cars'  },
	{ hash = 15219735, name = 'hermes', price = 280000, banido = false, modelo = 'Hermes', capacidade = 180, tipo = 'cars'  },
	{ hash = 1289935896, name = 'pistaspider19', price = 800000, banido = false, modelo = 'Ferrari Pista', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 1565978651, name = 'molotok', price = 100, banido = false, modelo = 'Molotok', capacidade = 120, tipo = 'cars'  },
	{ hash = 1739845664, name = 'bison3', price = 100, banido = false, modelo = 'Bison 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -1030275036, name = 'seashark', price = 170000, banido = false, modelo = 'Seashark', capacidade = 40, tipo = 'cars'  },
	{ hash = -1756021720, name = 'everon', price = 1000000, banido = false, modelo = 'Everon', capacidade = 250, tipo = 'cars'  },
	{ hash = 2139203625, name = 'brutus', price = 100, banido = false, modelo = 'Brutus', capacidade = 120, tipo = 'cars'  },
	{ hash = -960289747, name = 'cablecar', price = 100, banido = false, modelo = 'Cablecar', capacidade = 120, tipo = 'cars'  },
	{ hash = 586013744, name = 'tankercar', price = 100, banido = false, modelo = 'Rankercar', capacidade = 120, tipo = 'cars'  },
	{ hash = 1735075890, name = 'jeepsamu', price = 100, banido = false, modelo = 'Jeep', capacidade = 85, tipo = 'cars'  },
	{ hash = -2100640717, name = 'tug', price = 100, banido = false, modelo = 'Tug', capacidade = 120, tipo = 'cars'  },
	{ hash = 108773431, name = 'coquette', price = 400000, banido = false, modelo = 'Coquette', capacidade = 85, tipo = 'cars'  },
	{ hash = 92612664, name = 'kalahari', price = 100000, banido = false, modelo = 'Kalahari', capacidade = 160, tipo = 'cars'  },
	{ hash = -591651781, name = 'blista3', price = 15000, banido = false, modelo = 'Blista 3', capacidade = 85, tipo = 'cars'  },
	{ hash = -638562243, name = 'scramjet', price = 100, banido = false, modelo = 'Scramjet', capacidade = 120, tipo = 'cars'  },
	{ hash = 525509695, name = 'moonbeam', price = 5000000, banido = false, modelo = 'Moonbeam', capacidade = 40, tipo = 'cars'  },
	{ hash = 1069929536, name = 'bobcatxl', price = 100, banido = false, modelo = 'Bobcatxl', capacidade = 120, tipo = 'cars'  },
	{ hash = -390261695, name = 'fordraptor', price = 100, banido = false, modelo = 'Ford Raptor', capacidade = 85, tipo = 'exclusive'  },
	{ hash = -2103821244, name = 'rallytruck', price = 100, banido = false, modelo = 'Rallytruck', capacidade = 120, tipo = 'cars'  },
	{ hash = 1723137093, name = 'stratum', price = 25000, banido = false, modelo = 'Stratum', capacidade = 110, tipo = 'cars'  },
	{ hash = -305727417, name = 'brickade', price = 1500000, banido = false, modelo = 'Brickade', capacidade = 2500, tipo = 'exclusive'  },
	{ hash = 1543134283, name = 'valkyrie2', price = 100, banido = false, modelo = 'Valkyrie 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -114627507, name = 'limo2', price = 100, banido = false, modelo = 'Limo 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1150599089, name = 'primo', price = 120000, banido = false, modelo = 'Primo', capacidade = 130, tipo = 'cars'  },
	{ hash = 1742022738, name = 'slamvan6', price = 100, banido = false, modelo = 'Slamvan 6', capacidade = 40, tipo = 'cars'  },
	{ hash = -1532697517, name = 'riata', price = 250000, banido = false, modelo = 'Riata', capacidade = 210, tipo = 'cars'  },
	{ hash = 1131912276, name = 'bmx', price = 1000, banido = true, modelo = 'Bmx', capacidade = 40, tipo = 'bikes'  },
	{ hash = 142944341, name = 'baller2', price = 77000, banido = false, modelo = 'Baller 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 723973206, name = 'dukes', price = 150000, banido = false, modelo = 'Dukes', capacidade = 120, tipo = 'cars'  },
	{ hash = -1763555241, name = 'microlight', price = 100, banido = false, modelo = 'Microlight', capacidade = 120, tipo = 'cars'  },
	{ hash = -440768424, name = 'blazer4', price = 180000, banido = false, modelo = 'Blazer 4', capacidade = 70, tipo = 'cars'  },
	{ hash = -1651067813, name = 'radi', price = 100, banido = false, modelo = 'Radi', capacidade = 120, tipo = 'cars'  },
	{ hash = 1489967196, name = 'schafter4', price = 190000, banido = false, modelo = 'Schafter 4', capacidade = 130, tipo = 'cars'  },
	{ hash = 621481054, name = 'luxor', price = 100, banido = false, modelo = 'Luxor', capacidade = 120, tipo = 'cars'  },
	{ hash = 2072687711, name = 'carbonizzare', price = 800000, banido = false, modelo = 'Carbonizzare', capacidade = 85, tipo = 'cars'  },
	{ hash = -1098802077, name = 'rentalbus', price = 100, banido = false, modelo = 'Rentalbus', capacidade = 120, tipo = 'cars'  },
	{ hash = -1988428699, name = 'terbyte', price = 2000000, banido = false, modelo = 'Terbyte', capacidade = 1500, tipo = 'exclusive'  },
	{ hash = -1523619738, name = 'alphaz1', price = 100, banido = false, modelo = 'Alphaz1', capacidade = 120, tipo = 'cars'  },
	{ hash = 178350184, name = 'g65', price = 600000, banido = false, modelo = 'G65', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 908897389, name = 'toro2', price = 290000, banido = false, modelo = 'Toro 2', capacidade = 85, tipo = 'cars'  },
	{ hash = 741586030, name = 'pranger', price = 100, banido = false, modelo = 'Pranger', capacidade = 85, tipo = 'cars'  },
	{ hash = -2122757008, name = 'stunt', price = 100, banido = false, modelo = 'Stunt', capacidade = 120, tipo = 'cars'  },
	{ hash = -2052737935, name = 'mule3', price = 700000, banido = false, modelo = 'Mule 3', capacidade = 500, tipo = 'exclusive'  },
	{ hash = -313185164, name = 'autarch', price = 100, banido = false, modelo = 'Autarch', capacidade = 120, tipo = 'cars'  },
	{ hash = 48339065, name = 'tiptruck', price = 100, banido = false, modelo = 'Tiptruck', capacidade = 120, tipo = 'cars'  },
	{ hash = 444171386, name = 'boxville4', price = 100, banido = true, modelo = 'Boxville 4', capacidade = 50, tipo = 'cars'  },
	{ hash = 788747387, name = 'buzzard', price = 100, banido = false, modelo = 'Buzzard', capacidade = 120, tipo = 'exclusive'  },
	{ hash = -1683328900, name = 'sheriff', price = 100, banido = true, modelo = 'Sheriff', capacidade = 120, tipo = 'cars'  },
	{ hash = 569305213, name = 'packer', price = 5000000, banido = false, modelo = 'Packer', capacidade = 130, tipo = 'cars'  },
	{ hash = -1134706562, name = 'taipan', price = 550000, banido = false, modelo = 'Taipan', capacidade = 85, tipo = 'cars'  },
	{ hash = -431692672, name = 'panto', price = 25000, banido = false, modelo = 'Panto', capacidade = 85, tipo = 'cars'  },
	{ hash = 1349725314, name = 'sentinel', price = 50000, banido = false, modelo = 'Sentinel', capacidade = 120, tipo = 'cars'  },
	{ hash = -54332285, name = 'freecrawler', price = 400000, banido = false, modelo = 'Freecrawler', capacidade = 160, tipo = 'cars'  },
	{ hash = 1147287684, name = 'caddy', price = 50000, banido = false, modelo = 'Caddy', capacidade = 85, tipo = 'cars'  },
	{ hash = -1071380347, name = 'tampa2', price = 100, banido = false, modelo = 'Tampa 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -150975354, name = 'blimp', price = 100, banido = false, modelo = 'Blimp', capacidade = 120, tipo = 'cars'  },
	{ hash = -32878452, name = 'bombushka', price = 100, banido = false, modelo = 'Bombushka', capacidade = 120, tipo = 'cars'  },
	{ hash = 1560980623, name = 'airtug', price = 100, banido = false, modelo = 'Airtug', capacidade = 120, tipo = 'cars'  },
	{ hash = -1216765807, name = 'adder', price = 1000000, banido = false, modelo = 'Adder', capacidade = 85, tipo = 'cars'  },
	{ hash = -326143852, name = 'dukes2', price = 100, banido = false, modelo = 'Dukes 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 972671128, name = 'tampa', price = 170000, banido = false, modelo = 'Tampa', capacidade = 40, tipo = 'cars'  },
	{ hash = -1694081890, name = 'bruiser2', price = 100, banido = false, modelo = 'Bruiser 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 661493923, name = 'comet5', price = 300000, banido = false, modelo = 'Comet 5', capacidade = 120, tipo = 'cars'  },
	{ hash = -1346687836, name = 'burrito', price = 1, banido = false, modelo = 'Burrito', capacidade = 1, tipo = 'cars'  },
	{ hash = 719660200, name = 'ruston', price = 300000, banido = false, modelo = 'Ruston', capacidade = 85, tipo = 'cars'  },
	{ hash = 917809321, name = 'xa21', price = 1700000, banido = false, modelo = 'Xa21', capacidade = 85, tipo = 'cars'  },
	{ hash = -488123221, name = 'predator', price = 100, banido = true, modelo = 'Predator', capacidade = 70, tipo = 'cars'  },
	{ hash = 80636076, name = 'dominator', price = 180000, banido = false, modelo = 'Dominator', capacidade = 40, tipo = 'cars'  },
	{ hash = -2022483795, name = 'comet3', price = 230000, banido = false, modelo = 'Comet 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 2044532910, name = 'menacer', price = 100, banido = false, modelo = 'Menacer', capacidade = 120, tipo = 'cars'  },
	{ hash = 534258863, name = 'dune2', price = 100, banido = false, modelo = 'Dune 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1566607184, name = 'clique', price = 360000, banido = false, modelo = 'Clique', capacidade = 120, tipo = 'cars'  },
	{ hash = 524108981, name = 'boattrailer', price = 100, banido = false, modelo = 'Boattrailer', capacidade = 120, tipo = 'cars'  },
	{ hash = 101905590, name = 'trophytruck', price = 450000, banido = false, modelo = 'Trophytruck', capacidade = 125, tipo = 'cars'  },
	{ hash = -834353991, name = 'komoda', price = 1500000, banido = false, modelo = 'Komoda', capacidade = 85, tipo = 'cars'  },
	{ hash = 1180875963, name = 'technical2', price = 100, banido = false, modelo = 'Technical 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1830407356, name = 'peyote', price = 100, banido = false, modelo = 'Peyote', capacidade = 120, tipo = 'cars'  },
	{ hash = 941494461, name = 'ruiner2', price = 100, banido = false, modelo = 'Ruiner 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 736902334, name = 'buffalo2', price = 240000, banido = false, modelo = 'Buffalo 2', capacidade = 40, tipo = 'cars'  },
	{ hash = 11251904, name = 'carbonrs', price = 300000, banido = false, modelo = 'Carbon RS', capacidade = 85, tipo = 'bikes'  },
	{ hash = 384071873, name = 'surano', price = 100, banido = false, modelo = 'Surano', capacidade = 120, tipo = 'cars'  },
	{ hash = -2140431165, name = 'bagger', price = 140000, banido = false, modelo = 'Bagger', capacidade = 85, tipo = 'bikes'  },
	{ hash = 2046537925, name = 'police', price = 100, banido = true, modelo = 'Police', capacidade = 120, tipo = 'cars'  },
	{ hash = -1744505657, name = 'impaler4', price = 100, banido = false, modelo = 'Impaler 4', capacidade = 40, tipo = 'cars'  },
	{ hash = -1660661558, name = 'maverick', price = 100, banido = false, modelo = 'Maverick', capacidade = 120, tipo = 'cars'  },
	{ hash = -2137348917, name = 'phantom', price = 5000000, banido = false, modelo = 'Phantom', capacidade = 130, tipo = 'cars'  },
	{ hash = 1861786828, name = 'longfin', price = 1000000, banido = false, modelo = 'Longfin', capacidade = 130, tipo = 'barco'  },
	{ hash = 2091594960, name = 'tr4', price = 100, banido = false, modelo = 'Tr4', capacidade = 120, tipo = 'cars'  },
	{ hash = -1041692462, name = 'banshee', price = 240000, banido = false, modelo = 'Banshee', capacidade = 110, tipo = 'cars'  },
	{ hash = -1807623979, name = 'asea2', price = 100, banido = false, modelo = 'Asea 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1987142870, name = 'osiris', price = 1500000, banido = false, modelo = 'Osiris', capacidade = 85, tipo = 'cars'  },
	{ hash = 980885719, name = 'rmodgt63', price = 800000, banido = false, modelo = 'Mercedes AMG GT63', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 353883353, name = 'polmav', price = 100, banido = false, modelo = 'Polmav', capacidade = 85, tipo = 'cars'  },
	{ hash = -1943285540, name = 'nightshade', price = 270000, banido = false, modelo = 'Nightshade', capacidade = 110, tipo = 'cars'  },
	{ hash = 745926877, name = 'buzzard2', price = 100, banido = false, modelo = 'Buzzard 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 998676702, name = 'fordtaurus', price = 100, banido = false, modelo = 'Ford Taurus', capacidade = 85, tipo = 'cars'  },
	{ hash = 1542143200, name = 'scarab2', price = 100, banido = false, modelo = 'Scarab 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 408192225, name = 'turismor', price = 2100000, banido = false, modelo = 'TurismoR', capacidade = 85, tipo = 'cars'  },
	{ hash = -616331036, name = 'seashark2', price = 170000, banido = false, modelo = 'Seashark 2', capacidade = 40, tipo = 'cars'  },
	{ hash = -1540353819, name = 'bmwi8', price = 1800000, banido = false, modelo = 'BMW I8', capacidade = 85, tipo = 'exclusive'  },
	{ hash = -121446169, name = 'kamacho', price = 150000, banido = false, modelo = 'Kamacho', capacidade = 120, tipo = 'cars'  },
	{ hash = 1077420264, name = 'velum2', price = 100, banido = false, modelo = 'Velum 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 509498602, name = 'dinghy3', price = 100, banido = false, modelo = 'Dinghy 3', capacidade = 40, tipo = 'cars'  },
	{ hash = -1842748181, name = 'faggio', price = 7000, banido = false, modelo = 'Faggio', capacidade = 70, tipo = 'bikes'  },
	{ hash = 2006142190, name = 'daemon', price = 200000, banido = false, modelo = 'Daemon', capacidade = 85, tipo = 'bikes'  },
	{ hash = -749299473, name = 'mogul', price = 100, banido = false, modelo = 'Mogul', capacidade = 120, tipo = 'cars'  },
	{ hash = 1348744438, name = 'oracle', price = 50000, banido = false, modelo = 'Oracle', capacidade = 130, tipo = 'cars'  },
	{ hash = -140902153, name = 'vader', price = 20000, banido = false, modelo = 'Vader', capacidade = 85, tipo = 'bikes'  },
	{ hash = -2128233223, name = 'blazer', price = 160000, banido = false, modelo = 'Blazer', capacidade = 70, tipo = 'cars'  },
	{ hash = -1903012613, name = 'asterope', price = 100, banido = false, modelo = 'Asterope', capacidade = 120, tipo = 'cars'  },
	{ hash = 500482303, name = 'swinger', price = 100, banido = false, modelo = 'Swinger', capacidade = 120, tipo = 'cars'  },
	{ hash = -1627000575, name = 'police2', price = 100, banido = true, modelo = 'Police 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 390201602, name = 'cliffhanger', price = 125000, banido = false, modelo = 'Cliffhanger', capacidade = 85, tipo = 'bikes'  },
	{ hash = -1170821884, name = 'hiluxpolicia', price = 100, banido = false, modelo = 'Hilux', capacidade = 85, tipo = 'cars'  },
	{ hash = -2096818938, name = 'technical', price = 100, banido = false, modelo = 'Technical', capacidade = 120, tipo = 'cars'  },
	{ hash = -915188472, name = 'amggtr', price = 800000, banido = false, modelo = 'AMG GTR', capacidade = 110, tipo = 'exclusive'  },
	{ hash = -1130810103, name = 'dilettante', price = 40000, banido = false, modelo = 'Dilettante', capacidade = 110, tipo = 'cars'  },
	{ hash = 1009171724, name = 'impaler2', price = 100, banido = false, modelo = 'Impaler 2', capacidade = 40, tipo = 'cars'  },
	{ hash = 1945374990, name = 'mule4', price = 500000, banido = false, modelo = 'Mule 4', capacidade = 400, tipo = 'exclusive'  },
	{ hash = 884422927, name = 'habanero', price = 100, banido = false, modelo = 'Habanero', capacidade = 120, tipo = 'cars'  },
	{ hash = -1566741232, name = 'feltzer3', price = 100, banido = false, modelo = 'Feltzer 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -1746576111, name = 'mammatus', price = 100, banido = false, modelo = 'Mammatus', capacidade = 120, tipo = 'cars'  },
	{ hash = -624529134, name = 'jackal', price = 60000, banido = false, modelo = 'Jackal', capacidade = 110, tipo = 'cars'  },
	{ hash = -1255452397, name = 'schafter2', price = 100, banido = false, modelo = 'Schafter 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1058115860, name = 'jet', price = 100, banido = false, modelo = 'Jet', capacidade = 120, tipo = 'cars'  },
	{ hash = -1403128555, name = 'zentorno', price = 1500000, banido = false, modelo = 'Zentorno', capacidade = 85, tipo = 'cars'  },
	{ hash = 1123216662, name = 'superd', price = 90000, banido = false, modelo = 'Superd', capacidade = 120, tipo = 'cars'  },
	{ hash = -1259134696, name = 'flashgt', price = 320000, banido = false, modelo = 'Flashgt', capacidade = 85, tipo = 'cars'  },
	{ hash = -255678177, name = 'hakuchou2', price = 1200000, banido = false, modelo = 'Hakuchou 2', capacidade = 85, tipo = 'bikes'  },
	{ hash = -1006919392, name = 'cutter', price = 100, banido = false, modelo = 'Cutter', capacidade = 120, tipo = 'cars'  },
	{ hash = -566387422, name = 'elegy2', price = 280000, banido = false, modelo = 'Elegy 2', capacidade = 110, tipo = 'cars'  },
	{ hash = -692292317, name = 'chernobog', price = 100, banido = false, modelo = 'Chernobog', capacidade = 120, tipo = 'cars'  },
	{ hash = -613725916, name = 'blimp2', price = 100, banido = false, modelo = 'Blimp 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1106353882, name = 'jester2', price = 100, banido = false, modelo = 'Jester 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1749831384, name = 'bmwm3e36', price = 3500000, banido = false, modelo = 'BMW M3 E36', capacidade = 85, tipo = 'cars'  },
	{ hash = 231083307, name = 'speeder', price = 250000, banido = false, modelo = 'Speeder', capacidade = 85, tipo = 'barco'  },
	{ hash = 276773164, name = 'dinghy2', price = 100, banido = false, modelo = 'Dinghy 2', capacidade = 40, tipo = 'cars'  },
	{ hash = -891462355, name = 'bati2', price = 120000, banido = false, modelo = 'Bati 2', capacidade = 85, tipo = 'bikes'  },
	{ hash = 159274291, name = 'ardent', price = 100, banido = false, modelo = 'Ardent', capacidade = 120, tipo = 'cars'  },
	{ hash = -2072933068, name = 'coach', price = 750000, banido = false, modelo = 'Coach', capacidade = 40, tipo = 'cars'  },
	{ hash = 408970549, name = 'avenger2', price = 100, banido = false, modelo = 'Avenger 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1601422646, name = 'dodgechargersrt', price = 2500000, banido = false, modelo = 'Charger SRT', capacidade = 85, tipo = 'cars'  },
	{ hash = 777714999, name = 'ruiner3', price = 100, banido = false, modelo = 'Ruiner 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -674927303, name = 'raptor', price = 200000, banido = false, modelo = 'Raptor', capacidade = 85, tipo = 'exclusive'  },
	{ hash = -1453280962, name = 'sanchez2', price = 220000, banido = false, modelo = 'Sanchez 2', capacidade = 85, tipo = 'bikes'  },
	{ hash = -498054846, name = 'virgo', price = 150000, banido = false, modelo = 'Virgo', capacidade = 40, tipo = 'cars'  },
	{ hash = -1207771834, name = 'rebel', price = 220, banido = false, modelo = 'Rebel', capacidade = 40, tipo = 'cars'  },
	{ hash = 1074745671, name = 'specter2', price = 310000, banido = false, modelo = 'Specter 2', capacidade = 85, tipo = 'cars'  },
	{ hash = -311022263, name = 'seashark3', price = 170000, banido = false, modelo = 'Seashark 3', capacidade = 40, tipo = 'barco'  },
	{ hash = -537896628, name = 'caddy2', price = 50000, banido = false, modelo = 'Caddy 2', capacidade = 85, tipo = 'cars'  },
	{ hash = -1375060657, name = 'dominator5', price = 100, banido = false, modelo = 'Dominator 5', capacidade = 40, tipo = 'cars'  },
	{ hash = -377465520, name = 'penumbra', price = 100, banido = false, modelo = 'Penumbra', capacidade = 120, tipo = 'cars'  },
	{ hash = 1762279763, name = 'tornado3', price = 100, banido = false, modelo = 'Tornado 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 456714581, name = 'policet', price = 100, banido = false, modelo = 'PoliceT', capacidade = 85, tipo = 'cars'  },
	{ hash = -1812949672, name = 'deathbike2', price = 100, banido = false, modelo = 'Deathbike 2', capacidade = 50, tipo = 'cars'  },
	{ hash = 349315417, name = 'gauntlet2', price = 100, banido = false, modelo = 'Gauntlet 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1353720154, name = 'flatbed', price = 180000, banido = true, modelo = 'Flatbed', capacidade = 50, tipo = 'cars'  },
	{ hash = 1653666139, name = 'pounder2', price = 500000, banido = false, modelo = 'Pounder 2', capacidade = 800, tipo = 'exclusive'  },
	{ hash = 177270108, name = 'phantom3', price = 100, banido = false, modelo = 'Phantom 3', capacidade = 70, tipo = 'cars'  },
	{ hash = -1205801634, name = 'blade', price = 100, banido = false, modelo = 'Blade', capacidade = 120, tipo = 'cars'  },
	{ hash = 1118611807, name = 'asbo', price = 25000, banido = false, modelo = 'Corsa', capacidade = 85, tipo = 'cars'  },
	{ hash = 321186144, name = 'stafford', price = 400000, banido = false, modelo = 'Stafford', capacidade = 120, tipo = 'cars'  },
	{ hash = 861409633, name = 'jetmax', price = 260000, banido = false, modelo = 'Jetmax', capacidade = 85, tipo = 'barco'  },
	{ hash = -713569950, name = 'bus', price = 13000, banido = false, modelo = 'Bus', capacidade = 40, tipo = 'cars'  },
	{ hash = 1126868326, name = 'bfinjection', price = 80000, banido = false, modelo = 'Bfinjection', capacidade = 85, tipo = 'cars'  },
	{ hash = -975345305, name = 'rogue', price = 100, banido = false, modelo = 'Rogue', capacidade = 120, tipo = 'cars'  },
	{ hash = 1127861609, name = 'tribike', price = 1000, banido = true, modelo = 'Tribike', capacidade = 40, tipo = 'bikes'  },
	{ hash = 1644055914, name = 'weevil', price = 25000, banido = false, modelo = 'Fusca', capacidade = 85, tipo = 'cars'  },
	{ hash = 1234311532, name = 'gp1', price = 100, banido = false, modelo = 'Gp1', capacidade = 120, tipo = 'cars'  },
	{ hash = 1824333165, name = 'besra', price = 100, banido = false, modelo = 'Besra', capacidade = 120, tipo = 'cars'  },
	{ hash = -405626514, name = 'shotaro', price = 60000, banido = false, modelo = 'Shotaro', capacidade = 85, tipo = 'cars'  },
	{ hash = 1504306544, name = 'torero', price = 100, banido = false, modelo = 'Torero', capacidade = 120, tipo = 'cars'  },
	{ hash = 1456744817, name = 'tulip', price = 300000, banido = false, modelo = 'Tulip', capacidade = 40, tipo = 'cars'  },
	{ hash = 390902130, name = 'raketrailer', price = 100, banido = false, modelo = 'Raketrailer', capacidade = 120, tipo = 'cars'  },
	{ hash = -1237253773, name = 'dubsta3', price = 70000, banido = false, modelo = 'Dubsta 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 520007028, name = 'nissangtr2', price = 1700000, banido = false, modelo = 'Nissan GTR EE', capacidade = 110, tipo = 'exclusive'  },
	{ hash = -746882698, name = 'schwarzer', price = 100, banido = false, modelo = 'Schwarzer', capacidade = 120, tipo = 'cars'  },
	{ hash = -604842630, name = 'cognoscenti2', price = 100, banido = false, modelo = 'Cognoscenti 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 670022011, name = 'nissangtrnismo', price = 600000, banido = false, modelo = 'GTR Nismo', capacidade = 110, tipo = 'exclusive'  },
	{ hash = -715746948, name = 'monster5', price = 100, banido = false, modelo = 'Monster 5', capacidade = 120, tipo = 'cars'  },
	{ hash = -682108547, name = 'zorrusso', price = 2500000, banido = false, modelo = 'Zorrusso', capacidade = 85, tipo = 'cars'  },
	{ hash = -1269889662, name = 'blazer3', price = 100, banido = false, modelo = 'Blazer 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -1043459709, name = 'marquis', price = 100, banido = false, modelo = 'Marquis', capacidade = 120, tipo = 'cars'  },
	{ hash = 1617472902, name = 'fagaloa', price = 300000, banido = false, modelo = 'Fagaloa', capacidade = 210, tipo = 'cars'  },
	{ hash = -1289178744, name = 'faggio3', price = 7000, banido = false, modelo = 'Faggio 3', capacidade = 70, tipo = 'bikes'  },
	{ hash = -1809822327, name = 'asea', price = 50000, banido = false, modelo = 'Asea', capacidade = 110, tipo = 'cars'  },
	{ hash = 330661258, name = 'cogcabrio', price = 75000, banido = false, modelo = 'Cogcabrio', capacidade = 130, tipo = 'cars'  },
	{ hash = 841808271, name = 'rhapsody', price = 7500, banido = false, modelo = 'Rhapsody', capacidade = 85, tipo = 'cars'  },
	{ hash = 822018448, name = 'defiler', price = 180000, banido = false, modelo = 'Defiler', capacidade = 85, tipo = 'bikes'  },
	{ hash = -1647941228, name = 'fbi2', price = 100, banido = false, modelo = 'Fbi 2', capacidade = 85, tipo = 'cars'  },
	{ hash = 475220373, name = 'mixer2', price = 100, banido = false, modelo = 'Mixer 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1019737494, name = 'graintrailer', price = 100, banido = false, modelo = 'Graintrailer', capacidade = 120, tipo = 'cars'  },
	{ hash = -307958377, name = 'blimp3', price = 100, banido = false, modelo = 'Blimp 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -1374500452, name = 'deathbike3', price = 100, banido = false, modelo = 'Deathbike 3', capacidade = 50, tipo = 'cars'  },
	{ hash = 219613597, name = 'speedo4', price = 100, banido = false, modelo = 'Speedo 4', capacidade = 40, tipo = 'cars'  },
	{ hash = 1356124575, name = 'technical3', price = 100, banido = false, modelo = 'Technical 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -1311154784, name = 'cheetah', price = 100, banido = false, modelo = 'Cheetah', capacidade = 120, tipo = 'cars'  },
	{ hash = -1696146015, name = 'bullet', price = 100, banido = false, modelo = 'Bullet', capacidade = 120, tipo = 'cars'  },
	{ hash = -631760477, name = 'massacro2', price = 100, banido = false, modelo = 'Massacro 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -831834716, name = 'btype2', price = 160000, banido = false, modelo = 'Btype 2', capacidade = 130, tipo = 'cars'  },
	{ hash = 836725157, name = 'stretcher', price = 100, banido = false, modelo = 'Maca Hospitalar', capacidade = 85, tipo = 'cars'  },
	{ hash = -32236122, name = 'halftrack', price = 100, banido = false, modelo = 'Halftrack', capacidade = 120, tipo = 'cars'  },
	{ hash = -391594584, name = 'felon', price = 60000, banido = false, modelo = 'Felon', capacidade = 130, tipo = 'cars'  },
	{ hash = -1205689942, name = 'riot', price = 100, banido = false, modelo = 'Caveirão 1', capacidade = 40, tipo = 'cars'  },
	{ hash = 55628203, name = 'faggio2', price = 7000, banido = false, modelo = 'Faggio 2', capacidade = 70, tipo = 'bikes'  },
	{ hash = 1518533038, name = 'hauler', price = 100, banido = false, modelo = 'Hauler', capacidade = 85, tipo = 'cars'  },
	{ hash = -511601230, name = 'oracle2', price = 300000, banido = false, modelo = 'Oracle 2', capacidade = 160, tipo = 'cars'  },
	{ hash = -825837129, name = 'vigero', price = 170000, banido = false, modelo = 'Vigero', capacidade = 40, tipo = 'cars'  },
	{ hash = -769147461, name = 'caddy3', price = 45000, banido = false, modelo = 'Caddy 3', capacidade = 70, tipo = 'cars'  },
	{ hash = -1386191424, name = 'pyro', price = 100, banido = false, modelo = 'Pyro', capacidade = 120, tipo = 'cars'  },
	{ hash = -376434238, name = 'tyrant', price = 1500000, banido = false, modelo = 'Tyrant', capacidade = 85, tipo = 'cars'  },
	{ hash = -1122289213, name = 'zion', price = 36000, banido = false, modelo = 'Zion', capacidade = 85, tipo = 'cars'  },
	{ hash = 1531094468, name = 'tornado2', price = 160000, banido = false, modelo = 'Tornado 2', capacidade = 160, tipo = 'cars'  },
	{ hash = -1800170043, name = 'gauntlet', price = 145000, banido = false, modelo = 'Gauntlet', capacidade = 120, tipo = 'cars'  },
	{ hash = -282946103, name = 'suntrap', price = 230000, banido = false, modelo = 'Suntrap', capacidade = 85, tipo = 'barco'  },
	{ hash = -884690486, name = 'docktug', price = 100, banido = false, modelo = 'Docktug', capacidade = 120, tipo = 'cars'  },
	{ hash = -1705304628, name = 'rubble', price = 100, banido = false, modelo = 'Rubble', capacidade = 120, tipo = 'cars'  },
	{ hash = -1008861746, name = 'tailgater', price = 25000, banido = false, modelo = 'Tailgater', capacidade = 90, tipo = 'cars'  },
	{ hash = 630371791, name = 'barracks3', price = 100, banido = false, modelo = 'Barracks 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 734217681, name = 'sadler2', price = 100, banido = false, modelo = 'Sadler 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 2069146067, name = 'oppressor2', price = 60000, banido = false, modelo = 'Oppressor 2', capacidade = 85, tipo = 'cars'  },
	{ hash = -2095439403, name = 'phoenix', price = 100, banido = false, modelo = 'Phoenix', capacidade = 120, tipo = 'cars'  },
	{ hash = 1591739866, name = 'deveste', price = 100, banido = false, modelo = 'Deveste', capacidade = 120, tipo = 'cars'  },
	{ hash = -2119578145, name = 'faction', price = 5000000, banido = false, modelo = 'Faction', capacidade = 40, tipo = 'cars'  },
	{ hash = -1089039904, name = 'furoregt', price = 100, banido = false, modelo = 'Furoregt', capacidade = 85, tipo = 'cars'  },
	{ hash = -2130482718, name = 'dump', price = 100, banido = false, modelo = 'Dump', capacidade = 120, tipo = 'cars'  },
	{ hash = 729783779, name = 'slamvan', price = 150000, banido = false, modelo = 'Slamvan', capacidade = 40, tipo = 'cars'  },
	{ hash = 2049897956, name = 'rapidgt3', price = 190000, banido = false, modelo = 'Rapidgt 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 234062309, name = 'reaper', price = 950000, banido = false, modelo = 'Reaper', capacidade = 85, tipo = 'cars'  },
	{ hash = 1672195559, name = 'akuma', price = 420000, banido = false, modelo = 'Akuma', capacidade = 85, tipo = 'bikes'  },
	{ hash = -893578776, name = 'ruffian', price = 450000, banido = false, modelo = 'Ruffian', capacidade = 85, tipo = 'bikes'  },
	{ hash = -286046740, name = 'rcbandito', price = 100, banido = false, modelo = 'Rcbandito', capacidade = 120, tipo = 'cars'  },
	{ hash = 447548909, name = 'volatol', price = 100, banido = false, modelo = 'Volatol', capacidade = 120, tipo = 'cars'  },
	{ hash = -89291282, name = 'felon2', price = 170000, banido = false, modelo = 'Felon 2', capacidade = 85, tipo = 'cars'  },
	{ hash = -1126264336, name = 'minivan2', price = 80000, banido = false, modelo = 'Minivan 2', capacidade = 160, tipo = 'cars'  },
	{ hash = 2136773105, name = 'rocoto', price = 110000, banido = false, modelo = 'Rocoto', capacidade = 120, tipo = 'cars'  },
	{ hash = -339587598, name = 'swift', price = 17000, banido = false, modelo = 'Swift', capacidade = 70, tipo = 'cars'  },
	{ hash = 1114244595, name = 'lamborghinihuracan', price = 1700000, banido = false, modelo = 'Lamborghini Huracan', capacidade = 85, tipo = 'exclusive'  },
	{ hash = -1984275979, name = 'havok', price = 100, banido = false, modelo = 'Havok', capacidade = 120, tipo = 'cars'  },
	{ hash = -394074634, name = 'dubsta2', price = 180000, banido = false, modelo = 'Dubsta 2', capacidade = 210, tipo = 'cars'  },
	{ hash = -589178377, name = 'ratloader2', price = 180000, banido = false, modelo = 'Ratloader 2', capacidade = 40, tipo = 'cars'  },
	{ hash = 1564782073, name = 'zr380s', price = 1500000, banido = false, modelo = 'ZR 380s', capacidade = 85, tipo = 'cars'  },
	{ hash = -2098947590, name = 'stingergt', price = 100, banido = false, modelo = 'Stingergt', capacidade = 120, tipo = 'cars'  },
	{ hash = 1483171323, name = 'deluxo', price = 100, banido = false, modelo = 'Deluxo', capacidade = 120, tipo = 'cars'  },
	{ hash = -1600252419, name = 'valkyrie', price = 100, banido = false, modelo = 'Valkyrie', capacidade = 120, tipo = 'cars'  },
	{ hash = 784565758, name = 'coquette3', price = 170000, banido = false, modelo = 'Coquette 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -783406593, name = 'skyliner34', price = 1800000, banido = false, modelo = 'Skyline R34', capacidade = 85, tipo = 'exclusive'  },
	{ hash = -1132721664, name = 'imorgon', price = 850000, banido = false, modelo = 'Imorgon', capacidade = 85, tipo = 'cars'  },
	{ hash = 914654722, name = 'mesa', price = 90000, banido = false, modelo = 'Mesa', capacidade = 130, tipo = 'cars'  },
	{ hash = 223258115, name = 'sabregt2', price = 300000, banido = false, modelo = 'Sabregt 2', capacidade = 40, tipo = 'cars'  },
	{ hash = -143695728, name = 'r820', price = 2000000, banido = false, modelo = 'Audi R8', capacidade = 85, tipo = 'exclusive'  },
	{ hash = -1829802492, name = 'pfister811', price = 460000, banido = false, modelo = 'Pfister 811', capacidade = 85, tipo = 'cars'  },
	{ hash = -1311240698, name = 'surfer2', price = 90000, banido = false, modelo = 'Surfer 2', capacidade = 210, tipo = 'cars'  },
	{ hash = -14495224, name = 'regina', price = 30000, banido = false, modelo = 'Regina', capacidade = 110, tipo = 'cars'  },
	{ hash = -1541955062, name = 'hilux1', price = 600000, banido = false, modelo = 'Hilux', capacidade = 250, tipo = 'exclusive'  },
	{ hash = -682211828, name = 'buccaneer', price = 120000, banido = false, modelo = 'Buccaneer', capacidade = 130, tipo = 'cars'  },
	{ hash = -877478386, name = 'trailers', price = 100, banido = false, modelo = 'Trailers', capacidade = 120, tipo = 'cars'  },
	{ hash = -1661854193, name = 'dune', price = 100, banido = false, modelo = 'Dune', capacidade = 120, tipo = 'cars'  },
	{ hash = 1621617168, name = 'cargobob2', price = 100, banido = false, modelo = 'Cargobob 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1337041428, name = 'serrano', price = 70000, banido = false, modelo = 'Serrano', capacidade = 120, tipo = 'cars'  },
	{ hash = -186537451, name = 'scorcher', price = 1000, banido = true, modelo = 'Scorcher', capacidade = 40, tipo = 'bikes'  },
	{ hash = -82626025, name = 'savage', price = 100, banido = false, modelo = 'Savage', capacidade = 120, tipo = 'cars'  },
	{ hash = -1193103848, name = 'zion2', price = 170000, banido = false, modelo = 'Zion 2', capacidade = 85, tipo = 'cars'  },
	{ hash = 1119641113, name = 'slamvan3', price = 200000, banido = false, modelo = 'Slamvan 3', capacidade = 40, tipo = 'cars'  },
	{ hash = 321739290, name = 'crusader', price = 100, banido = false, modelo = 'Crusader', capacidade = 120, tipo = 'cars'  },
	{ hash = -433375717, name = 'monroe', price = 100, banido = false, modelo = 'Monroe', capacidade = 120, tipo = 'cars'  },
	{ hash = 893081117, name = 'burrito4', price = 140000, banido = false, modelo = 'Burrito 4', capacidade = 40, tipo = 'cars'  },
	{ hash = 1093697054, name = 'bmci', price = 800000, banido = false, modelo = 'BMW M5', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 668439077, name = 'bruiser', price = 100, banido = false, modelo = 'Bruiser', capacidade = 120, tipo = 'cars'  },
	{ hash = -2039755226, name = 'faction3', price = 5000000, banido = false, modelo = 'Faction 3', capacidade = 40, tipo = 'cars'  },
	{ hash = -1890996696, name = 'brutus2', price = 100, banido = false, modelo = 'Brutus 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 873639469, name = 'sentinel2', price = 50000, banido = false, modelo = 'Sentinel 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 771711535, name = 'submersible', price = 100, banido = false, modelo = 'Submersible', capacidade = 120, tipo = 'cars'  },
	{ hash = -142942670, name = 'massacro', price = 290000, banido = false, modelo = 'Massacro', capacidade = 130, tipo = 'cars'  },
	{ hash = 1106910537, name = 'fordmustanggt', price = 100, banido = false, modelo = 'Ford Mustang GT', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 743478836, name = 'sovereign', price = 120000, banido = false, modelo = 'Sovereign', capacidade = 40, tipo = 'bikes'  },
	{ hash = -1728685474, name = 'coquette4', price = 1800000, banido = false, modelo = 'Coquette 4', capacidade = 85, tipo = 'cars'  },
	{ hash = -391595372, name = 'viseris', price = 100, banido = false, modelo = 'Viseris', capacidade = 120, tipo = 'cars'  },
	{ hash = -755532233, name = 'imperator3', price = 100, banido = false, modelo = 'Imperator 3', capacidade = 40, tipo = 'cars'  },
	{ hash = -1149725334, name = 'italirsx', price = 3500000, banido = false, modelo = 'Itali RSX', capacidade = 85, tipo = 'cars'  },
	{ hash = -1295027632, name = 'nimbus', price = 100, banido = false, modelo = 'Nimbus', capacidade = 120, tipo = 'cars'  },
	{ hash = -1615154052, name = 'bmwm8prf', price = 100, banido = false, modelo = 'M8 BPVE', capacidade = 85, tipo = 'cars'  },
	{ hash = 1239379790, name = '20ramambo', price = 100, banido = false, modelo = 'Ambulancia Bombeiro', capacidade = 85, tipo = 'cars'  },
	{ hash = 2025593404, name = 'cargobob4', price = 100, banido = false, modelo = 'Cargobob 4', capacidade = 120, tipo = 'cars'  },
	{ hash = 1051415893, name = 'jb700', price = 200000, banido = false, modelo = 'Jb700', capacidade = 110, tipo = 'cars'  },
	{ hash = 427718536, name = 'q8pc', price = 100, banido = false, modelo = 'Q8 Civil', capacidade = 85, tipo = 'cars'  },
	{ hash = 960812448, name = 'furia', price = 2000000, banido = false, modelo = 'Furia', capacidade = 85, tipo = 'cars'  },
	{ hash = -2124201592, name = 'manana', price = 120000, banido = false, modelo = 'Manana', capacidade = 180, tipo = 'cars'  },
	{ hash = 494265960, name = 'cb500x', price = 800000, banido = false, modelo = 'CB 500X', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 444994115, name = 'imperator', price = 100, banido = false, modelo = 'Imperator', capacidade = 40, tipo = 'cars'  },
	{ hash = -1671539132, name = 'supervolito2', price = 10000000, banido = false, modelo = 'Supervolito 2', capacidade = 70, tipo = 'cars'  },
	{ hash = -208911803, name = 'jugular', price = 1700000, banido = false, modelo = 'Jugular', capacidade = 85, tipo = 'cars'  },
	{ hash = 788045382, name = 'sanchez', price = 100000, banido = false, modelo = 'Sanchez', capacidade = 85, tipo = 'bikes'  },
	{ hash = 1380975330, name = 'amarokprf', price = 100, banido = false, modelo = 'Amarok', capacidade = 85, tipo = 'cars'  },
	{ hash = -591610296, name = 'f620', price = 400000, banido = false, modelo = 'F620', capacidade = 110, tipo = 'cars'  },
	{ hash = -827162039, name = 'dune4', price = 100, banido = false, modelo = 'Dune 4', capacidade = 120, tipo = 'cars'  },
	{ hash = 728614474, name = 'speedo2', price = 100, banido = false, modelo = 'Speedo 2', capacidade = 40, tipo = 'cars'  },
	{ hash = -2045594037, name = 'rebel2', price = 220000, banido = false, modelo = 'Rebel 2', capacidade = 250, tipo = 'cars'  },
	{ hash = 1939284556, name = 'vagner', price = 540000, banido = false, modelo = 'Vagner', capacidade = 85, tipo = 'cars'  },
	{ hash = -958790484, name = 'c981', price = 800000, banido = false, modelo = 'Porshe Cayman', capacidade = 110, tipo = 'exclusive'  },
	{ hash = -1829436850, name = 'novak', price = 800000, banido = false, modelo = 'Novak', capacidade = 110, tipo = 'cars'  },
	{ hash = 144259586, name = '911r', price = 800000, banido = false, modelo = 'Porshe 911', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 1682114128, name = 'dilettante2', price = 100, banido = false, modelo = 'Dilettante 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -2064372143, name = 'mesa3', price = 600000, banido = false, modelo = 'Mesa 3', capacidade = 160, tipo = 'cars'  },
	{ hash = 1162065741, name = 'rumpo', price = 23000, banido = false, modelo = 'Rumpo', capacidade = 50, tipo = 'cars'  },
	{ hash = 499169875, name = 'fusilade', price = 100, banido = false, modelo = 'Fusilade', capacidade = 120, tipo = 'cars'  },
	{ hash = 867799010, name = 'pariah', price = 400000, banido = false, modelo = 'Pariah', capacidade = 110, tipo = 'cars'  },
	{ hash = -1232836011, name = 'le7b', price = 100, banido = false, modelo = 'Le7b', capacidade = 120, tipo = 'cars'  },
	{ hash = -399841706, name = 'baletrailer', price = 100, banido = false, modelo = 'Baletrailer', capacidade = 120, tipo = 'cars'  },
	{ hash = -1156537658, name = 'tiger', price = 800000, banido = false, modelo = 'Triumph Tiger', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 652623448, name = 'fxxk16', price = 800000, banido = false, modelo = 'Ferrari FXX-K', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 436874758, name = 's1000rr', price = 600000, banido = false, modelo = 'BMW S1000RR', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 624514487, name = 'raptor2017', price = 600000, banido = false, modelo = 'Pickup Raptor', capacidade = 250, tipo = 'exclusive'  },
	{ hash = 1766797915, name = 'focusrj', price = 100, banido = false, modelo = 'Focus', capacidade = 85, tipo = 'cars'  },
	{ hash = 1032823388, name = 'ninef', price = 100, banido = false, modelo = 'Ninef', capacidade = 120, tipo = 'cars'  },
	{ hash = 903794909, name = 'savestra', price = 200000, banido = false, modelo = 'Savestra', capacidade = 120, tipo = 'cars'  },
	{ hash = -947761570, name = 'tiptruck2', price = 100, banido = false, modelo = 'Tiptruck 2', capacidade = 70, tipo = 'cars'  },
	{ hash = 991407206, name = 'r1250', price = 600000, banido = false, modelo = 'BMW R1250', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 196747873, name = 'elegy', price = 260000, banido = false, modelo = 'Elegy', capacidade = 130, tipo = 'cars'  },
	{ hash = 642617954, name = 'freightgrain', price = 100, banido = false, modelo = 'Freightgrain', capacidade = 120, tipo = 'cars'  },
	{ hash = -1361687965, name = 'chino2', price = 5000000, banido = false, modelo = 'Chino 2', capacidade = 40, tipo = 'cars'  },
	{ hash = 1491375716, name = 'forklift', price = 100, banido = false, modelo = 'Forklift', capacidade = 120, tipo = 'cars'  },
	{ hash = 86520421, name = 'bf400', price = 350000, banido = false, modelo = 'Bf400', capacidade = 85, tipo = 'bikes'  },
	{ hash = -777275802, name = 'freighttrailer', price = 100, banido = false, modelo = 'Freighttrailer', capacidade = 120, tipo = 'cars'  },
	{ hash = 640818791, name = 'lectro', price = 150000, banido = false, modelo = 'Lectro', capacidade = 85, tipo = 'bikes'  },
	{ hash = -808831384, name = 'baller', price = 77000, banido = false, modelo = 'Baller', capacidade = 120, tipo = 'cars'  },
	{ hash = -1744543332, name = 'panameragts', price = 800000, banido = false, modelo = 'Panamera GTS', capacidade = 110, tipo = 'exclusive'  },
	{ hash = -4816535, name = 'nissanskyliner34', price = 600000, banido = false, modelo = 'Skyliner', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 1656094088, name = 'huracan', price = 800000, banido = false, modelo = 'Lamborghini Huracan', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 1426219628, name = 'fmj', price = 100, banido = false, modelo = 'Fmj', capacidade = 120, tipo = 'cars'  },
	{ hash = 406183167, name = 'golf75r', price = 600000, banido = false, modelo = 'VW Golf', capacidade = 110, tipo = 'exclusive'  },
	{ hash = -2120700196, name = 'entity2', price = 100, banido = false, modelo = 'Entity 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 272929391, name = 'tempesta', price = 520000, banido = false, modelo = 'Tempesta', capacidade = 85, tipo = 'cars'  },
	{ hash = 580861919, name = 'fc15', price = 800000, banido = false, modelo = 'Ferrari California', capacidade = 110, tipo = 'exclusive'  },
	{ hash = -2007026063, name = 'pbus', price = 100, banido = false, modelo = 'Onibus', capacidade = 50, tipo = 'cars'  },
	{ hash = 1753414259, name = 'enduro', price = 90000, banido = false, modelo = 'Enduro', capacidade = 85, tipo = 'bikes'  },
	{ hash = 1502869817, name = 'trailerlarge', price = 100, banido = false, modelo = 'Trailerlarge', capacidade = 120, tipo = 'cars'  },
	{ hash = -1404319008, name = 'bmwm8', price = 800000, banido = false, modelo = 'BMW M8', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 1177543287, name = 'dubsta', price = 100000, banido = false, modelo = 'Dubsta', capacidade = 120, tipo = 'cars'  },
	{ hash = -1523428744, name = 'manchez', price = 500000, banido = false, modelo = 'Manchez', capacidade = 85, tipo = 'bikes'  },
	{ hash = 1871995513, name = 'yosemite', price = 350000, banido = false, modelo = 'Yosemite', capacidade = 250, tipo = 'cars'  },
	{ hash = -899509638, name = 'virgo2', price = 250000, banido = false, modelo = 'Virgo 2', capacidade = 40, tipo = 'cars'  },
	{ hash = 547134075, name = 'mclarenp1', price = 2000000, banido = false, modelo = 'Mc Laren P1', capacidade = 110, tipo = 'exclusive'  },
	{ hash = -1078631178, name = 'urusrj', price = 100, banido = false, modelo = 'Urus Comando', capacidade = 85, tipo = 'cars'  },
	{ hash = 2112052861, name = 'pounder', price = 900000, banido = false, modelo = 'Pounder', capacidade = 700, tipo = 'exclusive'  },
	--{ hash = -1098847618, name = 'amarokrj', price = 1, banido = false, modelo = 'amarokrj', capacidade = 1, tipo = 'cars'  },
	{ hash = -1370111350, name = '720s', price = 800000, banido = false, modelo = '720s', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 1611740349, name = 'caveiraobope', price = 100, banido = false, modelo = 'Caveirão 2', capacidade = 40, tipo = 'cars'  },
	{ hash = 486987393, name = 'huntley', price = 100000, banido = false, modelo = 'Huntley', capacidade = 160, tipo = 'cars'  },
	{ hash = 1084099044, name = 'samumav', price = 100, banido = false, modelo = 'Helicóptero SAMU', capacidade = 40, tipo = 'cars'  },
	{ hash = -685276541, name = 'emperor', price = 100, banido = false, modelo = 'Emperor', capacidade = 120, tipo = 'cars'  },
	{ hash = -1098847618, name = 'amarokrj', price = 1000, banido = false, modelo = 'Amarok PMERJ', capacidade = 40, tipo = 'cars'  },
	{ hash = 2037834373, name = 'flatbed3', price = 10000, banido = false, modelo = 'Guincho', capacidade = 50, tipo = 'cars'  },
	{ hash = -597548221, name = 'frontierbope', price = 100, banido = false, modelo = 'Frontier Bope', capacidade = 40, tipo = 'cars'  },
	{ hash = 2020856025, name = 'frontierrj', price = 100, banido = false, modelo = 'Frontier Pmerj', capacidade = 85, tipo = 'cars'  },
	{ hash = 1890188937, name = 'aventador', price = 800000, banido = false, modelo = 'Aventador', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 1265391242, name = 'hakuchou', price = 750000, banido = false, modelo = 'Hakuchou', capacidade = 85, tipo = 'bikes'  },
	{ hash = -50547061, name = 'cargobob', price = 100, banido = false, modelo = 'Cargobob', capacidade = 120, tipo = 'cars'  },
	{ hash = 1641462412, name = 'tractor', price = 100, banido = false, modelo = 'Tractor', capacidade = 40, tipo = 'cars'  },
	{ hash = -777172681, name = 'omnis', price = 100, banido = false, modelo = 'Omnis', capacidade = 120, tipo = 'cars'  },
	{ hash = -1940666165, name = 'r1250rj', price = 100, banido = false, modelo = 'R1250 GTM', capacidade = 85, tipo = 'cars'  },
	{ hash = 1343246649, name = 'corollarj', price = 100, banido = false, modelo = 'Corolla', capacidade = 85, tipo = 'cars'  },
	{ hash = 1033245328, name = 'dinghy', price = 250000, banido = false, modelo = 'Dinghy', capacidade = 40, tipo = 'barco'  },
	{ hash = -1291952903, name = 'entityxf', price = 400000, banido = false, modelo = 'Entity XF', capacidade = 85, tipo = 'cars'  },
	{ hash = -1289722222, name = 'ingot', price = 100, banido = false, modelo = 'Ingot', capacidade = 120, tipo = 'cars'  },
	{ hash = -966289722, name = 'fordambulancia', price = 100, banido = false, modelo = 'Ambulancia Ford', capacidade = 85, tipo = 'cars'  },
	{ hash = -1372848492, name = 'kuruma', price = 220000, banido = false, modelo = 'Kuruma', capacidade = 130, tipo = 'cars'  },
	{ hash = -1764396287, name = 'mercambulancia', price = 100, banido = false, modelo = 'Ambulancia Mercedes', capacidade = 85, tipo = 'cars'  },
	{ hash = -140613189, name = 'dodgecharger2015', price = 100, banido = false, modelo = 'Charger 2015', capacidade = 85, tipo = 'cars'  },
	{ hash = -349601129, name = 'bifta', price = 190000, banido = false, modelo = 'Bifta', capacidade = 85, tipo = 'cars'  },
	{ hash = 1909189272, name = 'gb200', price = 120000, banido = false, modelo = 'Gb200', capacidade = 120, tipo = 'cars'  },
	{ hash = -402863496, name = 'dodgecharger2014', price = 100, banido = false, modelo = 'Charger 2014', capacidade = 85, tipo = 'cars'  },
	{ hash = 1799969023, name = 'crownvictoria', price = 100, banido = false, modelo = 'Crown Victoria', capacidade = 85, tipo = 'cars'  },
	{ hash = 1030400667, name = 'freight', price = 100, banido = false, modelo = 'Freight', capacidade = 120, tipo = 'cars'  },
	{ hash = 1233534620, name = 'marshall', price = 100, banido = false, modelo = 'Marshall', capacidade = 120, tipo = 'cars'  },
	{ hash = 723779872, name = 'toyotasupra', price = 1600000, banido = false, modelo = 'Toyota Supra', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 351980252, name = 'teslaprior', price = 1200000, banido = false, modelo = 'Tesla Prior', capacidade = 85, tipo = 'exclusive'  },
	{ hash = -941271649, name = 'subaruimpreza', price = 1400000, banido = false, modelo = 'Subaru Impreza', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 1132262048, name = 'burrito5', price = 100, banido = false, modelo = 'Burrito 5', capacidade = 40, tipo = 'cars'  },
	{ hash = 886934177, name = 'intruder', price = 100, banido = false, modelo = 'Intruder', capacidade = 120, tipo = 'cars'  },
	{ hash = 2038858402, name = 'brutus3', price = 100, banido = false, modelo = 'Brutus 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -1297672541, name = 'jester', price = 750000, banido = false, modelo = 'Jester', capacidade = 85, tipo = 'cars'  },
	{ hash = -1390169318, name = 'silvias15', price = 2000000, banido = false, modelo = 'Silvia S15', capacidade = 110, tipo = 'cars'  },
	{ hash = 1352136073, name = 'sc1', price = 100, banido = false, modelo = 'Sc1', capacidade = 120, tipo = 'cars'  },
	{ hash = 184361638, name = 'freightcar', price = 100, banido = false, modelo = 'Freightcar', capacidade = 120, tipo = 'cars'  },
	{ hash = 2068293287, name = 'lurcher', price = 100, banido = false, modelo = 'Lurcher', capacidade = 120, tipo = 'cars'  },
	{ hash = -567034757, name = 'mustangfast', price = 1400000, banido = false, modelo = 'Mustang Fastback', capacidade = 85, tipo = 'exclusive'  },
	{ hash = -1561625274, name = 'mclarensenna', price = 2000000, banido = false, modelo = 'Mc Laren Senna', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 712162987, name = 'trailersmall', price = 100, banido = false, modelo = 'Trailersmall', capacidade = 120, tipo = 'cars'  },
	{ hash = 2034235290, name = 'mazdarx7', price = 1500000, banido = false, modelo = 'Mazda RX7', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 600450546, name = 'hustler', price = 180000, banido = false, modelo = 'Hustler', capacidade = 120, tipo = 'cars'  },
	{ hash = -1573350092, name = 'fordmustang', price = 1600000, banido = false, modelo = 'Ford Mustang', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 627535535, name = 'fcr', price = 140000, banido = false, modelo = 'Fcr', capacidade = 85, tipo = 'bikes'  },
	{ hash = 666166960, name = 'baller6', price = 310000, banido = false, modelo = 'Baller 6', capacidade = 130, tipo = 'cars'  },
	{ hash = -1173768715, name = 'ferrariitalia', price = 800000, banido = false, modelo = 'Ferrari Italia', capacidade = 110, tipo = 'exclusive'  },
	{ hash = -1352468814, name = 'trflat', price = 100, banido = false, modelo = 'Trflat', capacidade = 120, tipo = 'cars'  },
	{ hash = -506359117, name = 'x6m', price = 800000, banido = false, modelo = 'BMW X6M', capacidade = 85, tipo = 'exclusive'  },
	{ hash = -322014905, name = 'ferrari812', price = 2000000, banido = false, modelo = 'Ferrari 812', capacidade = 110, tipo = 'exclusive'  },
	{ hash = -1267543371, name = 'ellie', price = 230000, banido = false, modelo = 'Ellie', capacidade = 85, tipo = 'cars'  },
	{ hash = -634879114, name = 'nemesis', price = 140000, banido = false, modelo = 'Nemesis', capacidade = 85, tipo = 'bikes'  },
	{ hash = 65402552, name = 'youga', price = 800000, banido = false, modelo = 'Youga', capacidade = 250, tipo = 'cars'  },
	{ hash = 1026149675, name = 'youga2', price = 500000, banido = false, modelo = 'Youga 2', capacidade = 250, tipo = 'cars'  },
	{ hash = 628003514, name = 'issi4', price = 100, banido = false, modelo = 'Issi 4', capacidade = 120, tipo = 'cars'  },
	{ hash = -784816453, name = 'mixer', price = 100, banido = false, modelo = 'Mixer', capacidade = 120, tipo = 'cars'  },
	{ hash = 699456151, name = 'surfer', price = 90000, banido = false, modelo = 'Surfer', capacidade = 40, tipo = 'cars'  },
	{ hash = -810318068, name = 'speedo', price = 230000, banido = false, modelo = 'Speedo', capacidade = 160, tipo = 'cars'  },
	{ hash = 1475773103, name = 'rumpo3', price = 700000, banido = false, modelo = 'Rumpo 3', capacidade = 210, tipo = 'cars'  },
	{ hash = -1776615689, name = 'rumpo2', price = 23000, banido = false, modelo = 'Rumpo 2', capacidade = 50, tipo = 'cars'  },
	{ hash = 1949211328, name = 'frogger2', price = 100, banido = false, modelo = 'Frogger 2', capacidade = 50, tipo = 'cars'  },
	{ hash = -1151600959, name = 'ferrarif12', price = 2000000, banido = false, modelo = 'Ferrari F12', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 400514754, name = 'squalo', price = 100, banido = false, modelo = 'Squalo', capacidade = 120, tipo = 'cars'  },
	{ hash = -34623805, name = 'policeb', price = 100, banido = false, modelo = 'Police B', capacidade = 85, tipo = 'cars'  },
	{ hash = 387748548, name = 'hauler2', price = 100, banido = false, modelo = 'Hauler 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 464687292, name = 'tornado', price = 140000, banido = false, modelo = 'Tornado', capacidade = 180, tipo = 'cars'  },
	{ hash = -304802106, name = 'buffalo', price = 15000, banido = false, modelo = 'Buffalo', capacidade = 85, tipo = 'cars'  },
	{ hash = 1491277511, name = 'sanctus', price = 80000, banido = false, modelo = 'Sanctus', capacidade = 50, tipo = 'bikes'  },
	{ hash = -119658072, name = 'pony', price = 150000, banido = false, modelo = 'Pony', capacidade = 130, tipo = 'cars'  },
	{ hash = 1488164764, name = 'paradise', price = 95000, banido = false, modelo = 'Paradise', capacidade = 160, tipo = 'cars'  },
	{ hash = -159126838, name = 'innovation', price = 120000, banido = false, modelo = 'Innovation', capacidade = 85, tipo = 'bikes'  },
	{ hash = -310465116, name = 'minivan', price = 100000, banido = false, modelo = 'Minivan', capacidade = 160, tipo = 'cars'  },
	{ hash = -120287622, name = 'journey', price = 100, banido = false, modelo = 'Journey', capacidade = 120, tipo = 'cars'  },
	{ hash = 296357396, name = 'gburrito2', price = 100, banido = false, modelo = 'Gburrito 2', capacidade = 50, tipo = 'cars'  },
	{ hash = -1745203402, name = 'gburrito', price = 140000, banido = false, modelo = 'Gburrito', capacidade = 160, tipo = 'cars'  },
	{ hash = 1876516712, name = 'camper', price = 140000, banido = false, modelo = 'Camper', capacidade = 160, tipo = 'cars'  },
	{ hash = -2118308144, name = 'avenger', price = 100, banido = false, modelo = 'Avenger', capacidade = 120, tipo = 'cars'  },
	{ hash = 433954513, name = 'nightshark', price = 100, banido = false, modelo = 'Nightshark', capacidade = 120, tipo = 'cars'  },
	{ hash = -1924433270, name = 'insurgent3', price = 100, banido = false, modelo = 'Insurgent 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 1981688531, name = 'titan', price = 100, banido = false, modelo = 'Titan', capacidade = 120, tipo = 'cars'  },
	{ hash = -907477130, name = 'burrito2', price = 140000, banido = false, modelo = 'Burrito 2', capacidade = 40, tipo = 'cars'  },
	{ hash = 682434785, name = 'boxville5', price = 100, banido = false, modelo = 'Boxville 5', capacidade = 120, tipo = 'cars'  },
	{ hash = 121658888, name = 'boxville3', price = 100, banido = false, modelo = 'Boxville 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 6774487, name = 'chimera', price = 140000, banido = false, modelo = 'Chimera', capacidade = 85, tipo = 'bikes'  },
	{ hash = 819197656, name = 'sheava', price = 460000, banido = false, modelo = 'Sheava', capacidade = 85, tipo = 'cars'  },
	{ hash = -233098306, name = 'boxville2', price = 100, banido = false, modelo = 'Boxville 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1171614426, name = 'ambulance', price = 100, banido = false, modelo = 'Ambulance', capacidade = 85, tipo = 'cars'  },
	{ hash = -1987130134, name = 'boxville', price = 100, banido = false, modelo = 'Boxville', capacidade = 120, tipo = 'cars'  },
	{ hash = -1883002148, name = 'emperor2', price = 100, banido = false, modelo = 'Emperor 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 2072156101, name = 'bison2', price = 100, banido = false, modelo = 'Bison 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -42959138, name = 'hunter', price = 100, banido = false, modelo = 'Hunter', capacidade = 120, tipo = 'cars'  },
	{ hash = -16948145, name = 'bison', price = 100, banido = false, modelo = 'Bison', capacidade = 120, tipo = 'cars'  },
	{ hash = -988501280, name = 'cheburek', price = 150000, banido = false, modelo = 'Cheburek', capacidade = 130, tipo = 'cars'  },
	{ hash = 931280609, name = 'issi3', price = 90000, banido = false, modelo = 'Issi 3', capacidade = 130, tipo = 'cars'  },
	{ hash = 634118882, name = 'baller4', price = 77000, banido = false, modelo = 'Baller 4', capacidade = 120, tipo = 'cars'  },
	{ hash = 523724515, name = 'voodoo2', price = 7000000, banido = false, modelo = 'Voodoo 2', capacidade = 40, tipo = 'cars'  },
	{ hash = 2132890591, name = 'utillitruck3', price = 100, banido = false, modelo = 'Utillitruck 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 887537515, name = 'utillitruck2', price = 100, banido = false, modelo = 'Utillitruck 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1281684762, name = 'lazer', price = 100, banido = false, modelo = 'Lazer', capacidade = 120, tipo = 'cars'  },
	{ hash = 516990260, name = 'utillitruck', price = 100, banido = false, modelo = 'Utillitruck', capacidade = 120, tipo = 'cars'  },
	{ hash = 850991848, name = 'biff', price = 100, banido = false, modelo = 'Biff', capacidade = 120, tipo = 'cars'  },
	{ hash = 1445631933, name = 'tractor3', price = 100, banido = false, modelo = 'Tractor 3', capacidade = 40, tipo = 'cars'  },
	{ hash = 1912215274, name = 'police3', price = 100, banido = true, modelo = 'Police 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -2076478498, name = 'tractor2', price = 100, banido = false, modelo = 'Tractor 2', capacidade = 40, tipo = 'cars'  },
	{ hash = -442313018, name = 'towtruck2', price = 100, banido = true, modelo = 'Towtruck 2', capacidade = 40, tipo = 'cars'  },
	{ hash = -1323100960, name = 'towtruck', price = 100, banido = true, modelo = 'Towtruck', capacidade = 120, tipo = 'cars'  },
	{ hash = -1848994066, name = 'neon', price = 1000000, banido = false, modelo = 'Neon', capacidade = 85, tipo = 'cars'  },
	{ hash = 1394036463, name = 'cargobob3', price = 100, banido = false, modelo = 'Cargobob 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 1755270897, name = 'policebike', price = 100, banido = false, modelo = 'Police Bike', capacidade = 85, tipo = 'cars'  },
	{ hash = 373261600, name = 'slamvan5', price = 100, banido = false, modelo = 'Slamvan 5', capacidade = 40, tipo = 'cars'  },
	{ hash = -599568815, name = 'sadler', price = 100, banido = false, modelo = 'Sadler', capacidade = 120, tipo = 'cars'  },
	{ hash = 240201337, name = 'freightcont2', price = 100, banido = false, modelo = 'Freightcont 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -2061049099, name = 'slamvan4', price = 100, banido = false, modelo = 'Slamvan 4', capacidade = 40, tipo = 'cars'  },
	{ hash = 1783355638, name = 'mower', price = 100, banido = false, modelo = 'Mower', capacidade = 120, tipo = 'cars'  },
	{ hash = -1536924937, name = 'policeold1', price = 100, banido = true, modelo = 'Policeold 1', capacidade = 120, tipo = 'cars'  },
	{ hash = 868868440, name = 'metrotrain', price = 100, banido = false, modelo = 'Metrotrain', capacidade = 120, tipo = 'cars'  },
	{ hash = -845979911, name = 'ripley', price = 100, banido = false, modelo = 'Ripley', capacidade = 120, tipo = 'cars'  },
	{ hash = 444583674, name = 'handler', price = 100, banido = false, modelo = 'Handler', capacidade = 120, tipo = 'cars'  },
	{ hash = -1293924613, name = 'dominator6', price = 100, banido = false, modelo = 'Dominator 6', capacidade = 40, tipo = 'cars'  },
	{ hash = 840387324, name = 'monster4', price = 100, banido = false, modelo = 'Monster 4', capacidade = 120, tipo = 'cars'  },
	{ hash = 920453016, name = 'freightcont1', price = 100, banido = false, modelo = 'Freightcont 1', capacidade = 120, tipo = 'cars'  },
	{ hash = -1100548694, name = 'trailers4', price = 100, banido = false, modelo = 'Trailers 4', capacidade = 120, tipo = 'cars'  },
	{ hash = -2058878099, name = 'trailers3', price = 100, banido = false, modelo = 'Trailers 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -1579533167, name = 'trailers2', price = 100, banido = false, modelo = 'Trailers 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1353081087, name = 'vindicator', price = 120000, banido = false, modelo = 'Vindicator', capacidade = 85, tipo = 'bikes'  },
	{ hash = -1045541610, name = 'comet2', price = 200000, banido = false, modelo = 'Comet 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1444047101, name = 'bugatti', price = 800000, banido = false, modelo = 'Veyron', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 1956216962, name = 'tanker2', price = 100, banido = false, modelo = 'Tanker 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -901163259, name = 'dodo', price = 100, banido = false, modelo = 'Dodo', capacidade = 120, tipo = 'cars'  },
	{ hash = -909201658, name = 'pcj', price = 15000, banido = false, modelo = 'Pcj', capacidade = 85, tipo = 'bikes'  },
	{ hash = 838982985, name = 'z190', price = 100, banido = false, modelo = 'Z190', capacidade = 120, tipo = 'cars'  },
	{ hash = -1770643266, name = 'tvtrailer', price = 100, banido = false, modelo = 'Tvtrailer', capacidade = 120, tipo = 'cars'  },
	{ hash = 1784254509, name = 'tr3', price = 100, banido = false, modelo = 'Tr3', capacidade = 120, tipo = 'cars'  },
	{ hash = 356391690, name = 'proptrailer', price = 100, banido = false, modelo = 'Proptrailer', capacidade = 120, tipo = 'cars'  },
	{ hash = 904750859, name = 'mule', price = 1000000, banido = false, modelo = 'Caminhão 150 kg', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 2035069708, name = 'esskey', price = 320000, banido = false, modelo = 'Esskey', capacidade = 85, tipo = 'bikes'  },
	{ hash = 2078290630, name = 'tr2', price = 100, banido = false, modelo = 'Tr2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1283517198, name = 'airbus', price = 100, banido = false, modelo = 'Airbus', capacidade = 120, tipo = 'cars'  },
	{ hash = -2140210194, name = 'docktrailer', price = 100, banido = false, modelo = 'Docktrailer', capacidade = 120, tipo = 'cars'  },
	{ hash = -1637149482, name = 'armytrailer2', price = 100, banido = false, modelo = 'Armytrailer 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -982130927, name = 'turismo2', price = 700000, banido = false, modelo = 'Turismo 2', capacidade = 110, tipo = 'cars'  },
	{ hash = -1476447243, name = 'armytrailer', price = 100, banido = false, modelo = 'Armytrailer', capacidade = 120, tipo = 'cars'  },
	{ hash = 633712403, name = 'banshee2', price = 300000, banido = false, modelo = 'Banshee 2', capacidade = 85, tipo = 'cars'  },
	{ hash = 1545842587, name = 'stinger', price = 100, banido = false, modelo = 'Stinger', capacidade = 120, tipo = 'cars'  },
	{ hash = 470404958, name = 'baller5', price = 77000, banido = false, modelo = 'Baller 5', capacidade = 120, tipo = 'cars'  },
	{ hash = -1242608589, name = 'vigilante', price = 100, banido = false, modelo = 'Vigilante', capacidade = 120, tipo = 'cars'  },
	{ hash = 338562499, name = 'vacca', price = 100, banido = false, modelo = 'Vacca', capacidade = 120, tipo = 'cars'  },
	{ hash = 2067820283, name = 'tyrus', price = 100, banido = false, modelo = 'Tyrus', capacidade = 120, tipo = 'cars'  },
	{ hash = 1031562256, name = 'tezeract', price = 1250000, banido = false, modelo = 'Tezeract', capacidade = 85, tipo = 'cars'  },
	{ hash = -2042350822, name = 'bruiser3', price = 100, banido = false, modelo = 'Bruiser 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -1894894188, name = 'surge', price = 70000, banido = false, modelo = 'Surge', capacidade = 85, tipo = 'cars'  },
	{ hash = -295689028, name = 'sultanrs', price = 500000, banido = false, modelo = 'Sultan RS', capacidade = 85, tipo = 'cars'  },
	{ hash = -60313827, name = 'nissangtr', price = 1500000, banido = false, modelo = 'Nissan GTR', capacidade = 110, tipo = 'exclusive'  },
	{ hash = 1537277726, name = 'issi5', price = 100, banido = false, modelo = 'Issi 5', capacidade = 120, tipo = 'cars'  },
	{ hash = 2123327359, name = 'prototipo', price = 100, banido = false, modelo = 'Prototipo', capacidade = 120, tipo = 'cars'  },
	{ hash = 1127131465, name = 'fbi', price = 100, banido = false, modelo = 'Fbi', capacidade = 85, tipo = 'cars'  },
	{ hash = 1274868363, name = 'bestiagts', price = 850000, banido = false, modelo = 'Bestiagts', capacidade = 85, tipo = 'cars'  },
	{ hash = -27326686, name = 'deathbike', price = 100, banido = false, modelo = 'Deathbike', capacidade = 50, tipo = 'cars'  },
	{ hash = 1044954915, name = 'skylift', price = 100, banido = false, modelo = 'Skylift', capacidade = 120, tipo = 'cars'  },
	{ hash = 741090084, name = 'gargoyle', price = 40000, banido = false, modelo = 'Gargoyle', capacidade = 50, tipo = 'bikes'  },
	{ hash = -212993243, name = 'barrage', price = 100, banido = false, modelo = 'Barrage', capacidade = 120, tipo = 'cars'  },
	{ hash = 1034187331, name = 'nero', price = 100, banido = false, modelo = 'Nero', capacidade = 120, tipo = 'cars'  },
	{ hash = 1878062887, name = 'baller3', price = 150000, banido = false, modelo = 'Baller 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -432008408, name = 'xls2', price = 350000, banido = false, modelo = 'Xls 2', capacidade = 130, tipo = 'cars'  },
	{ hash = -48031959, name = 'blazer2', price = 100, banido = false, modelo = 'Blazer 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 437538602, name = 'speeder2', price = 250000, banido = false, modelo = 'Speeder 2', capacidade = 85, tipo = 'cars'  },
	{ hash = -1009268949, name = 'zombiea', price = 110000, banido = false, modelo = 'Zombie A', capacidade = 85, tipo = 'bikes'  },
	{ hash = -1461482751, name = 'ninef2', price = 250000, banido = false, modelo = 'Ninef 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 2006667053, name = 'voodoo', price = 7000000, banido = false, modelo = 'Voodoo', capacidade = 40, tipo = 'cars'  },
	{ hash = 1203490606, name = 'xls', price = 150000, banido = false, modelo = 'Xls', capacidade = 110, tipo = 'cars'  },
	{ hash = -2048333973, name = 'italigtb', price = 500000, banido = false, modelo = 'Italigtb', capacidade = 85, tipo = 'cars'  },
	{ hash = 2053223216, name = 'benson', price = 500000, banido = false, modelo = 'Benson', capacidade = 600, tipo = 'exclusive'  },
	{ hash = 1873600305, name = 'ratbike', price = 60000, banido = false, modelo = 'Ratbike', capacidade = 85, tipo = 'cars'  },
	{ hash = 418536135, name = 'infernus', price = 100, banido = false, modelo = 'Infernus', capacidade = 120, tipo = 'cars'  },
	{ hash = -1178021069, name = 'wheelchair', price = 100, banido = false, modelo = 'Cadeira de Rodas', capacidade = 1, tipo = 'cars'  },
	{ hash = 1175363380, name = 'frontiercivil', price = 800000, banido = false, modelo = 'Frontier', capacidade = 250, tipo = 'cars'  },
	{ hash = 1392481335, name = 'cyclone', price = 1500000, banido = false, modelo = 'Cyclone', capacidade = 85, tipo = 'cars'  },
	{ hash = -214455498, name = 'stockade3', price = 100, banido = false, modelo = 'Stockade 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -730904777, name = 'tanker', price = 100, banido = false, modelo = 'Tanker', capacidade = 120, tipo = 'cars'  },
	{ hash = 1897744184, name = 'dune3', price = 100, banido = false, modelo = 'Dune 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 1549126457, name = 'brioso', price = 40000, banido = false, modelo = 'Brioso', capacidade = 85, tipo = 'cars'  },
	{ hash = -2079788230, name = 'gt500', price = 250000, banido = false, modelo = 'Gt500', capacidade = 120, tipo = 'cars'  },
	{ hash = -1137532101, name = 'fq2', price = 100, banido = false, modelo = 'Fq2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1349095620, name = 'caracara2', price = 1200000, banido = false, modelo = 'Caracara', capacidade = 250, tipo = 'cars'  },
	{ hash = -1558399629, name = 'tornado6', price = 100, banido = false, modelo = 'Tornado 6', capacidade = 120, tipo = 'cars'  },
	{ hash = -1797613329, name = 'tornado5', price = 250000, banido = false, modelo = 'Tornado 5', capacidade = 160, tipo = 'cars'  },
	{ hash = -2033222435, name = 'tornado4', price = 100, banido = false, modelo = 'Tornado 4', capacidade = 120, tipo = 'cars'  },
	{ hash = 1886268224, name = 'specter', price = 100, banido = false, modelo = 'Specter', capacidade = 120, tipo = 'cars'  },
	{ hash = 943752001, name = 'pony2', price = 150000, banido = false, modelo = 'Pony 2', capacidade = 130, tipo = 'cars'  },
	{ hash = 540101442, name = 'zr380', price = 100, banido = false, modelo = 'Zr380', capacidade = 120, tipo = 'cars'  },
	{ hash = 1836027715, name = 'thrust', price = 140000, banido = false, modelo = 'Thrust', capacidade = 85, tipo = 'bikes'  },
	{ hash = -239841468, name = 'diablous', price = 600000, banido = false, modelo = 'Diablous', capacidade = 85, tipo = 'bikes'  },
	{ hash = 989381445, name = 'sandking2', price = 250000, banido = false, modelo = 'Sandking 2', capacidade = 130, tipo = 'cars'  },
	{ hash = 886810209, name = 'stromberg', price = 100, banido = false, modelo = 'Stromberg', capacidade = 120, tipo = 'cars'  },
	{ hash = 1181327175, name = 'akula', price = 100, banido = false, modelo = 'Akula', capacidade = 120, tipo = 'cars'  },
	{ hash = -400295096, name = 'tribike3', price = 1000, banido = true, modelo = 'Tribike 3', capacidade = 40, tipo = 'bikes'  },
	{ hash = 1279262537, name = 'deviant', price = 300000, banido = false, modelo = 'Deviant', capacidade = 130, tipo = 'cars'  },
	{ hash = 989294410, name = 'voltic2', price = 75000, banido = false, modelo = 'Voltic 2', capacidade = 85, tipo = 'cars'  },
	{ hash = -823509173, name = 'barracks', price = 100, banido = false, modelo = 'Barracks', capacidade = 120, tipo = 'cars'  },
	{ hash = 1075432268, name = 'swift2', price = 17000, banido = false, modelo = 'Swift 2', capacidade = 70, tipo = 'cars'  },
	{ hash = -1543762099, name = 'gresley', price = 80000, banido = false, modelo = 'Gresley', capacidade = 120, tipo = 'cars'  },
	{ hash = -1241712818, name = 'emperor3', price = 100, banido = false, modelo = 'Emperor 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 1474015055, name = 'r1', price = 700000, banido = false, modelo = 'Yamaha R1', capacidade = 85, tipo = 'exclusive'  },
	{ hash = 1841130506, name = 'retinue', price = 100, banido = false, modelo = 'Retinue', capacidade = 120, tipo = 'cars'  },
	{ hash = 1078682497, name = 'pigalle', price = 100, banido = false, modelo = 'Pigalle', capacidade = 120, tipo = 'cars'  },
	{ hash = 1046206681, name = 'michelli', price = 160000, banido = false, modelo = 'Michelli', capacidade = 120, tipo = 'cars'  },
	{ hash = -1007528109, name = 'howard', price = 100, banido = false, modelo = 'Howard', capacidade = 120, tipo = 'cars'  },
	{ hash = 970598228, name = 'sultan', price = 200000, banido = false, modelo = 'Sultan', capacidade = 110, tipo = 'cars'  },
	{ hash = 1323778901, name = 'emerus', price = 1500000, banido = false, modelo = 'Emerus', capacidade = 85, tipo = 'cars'  },
	{ hash = 1036591958, name = 'nokota', price = 100, banido = false, modelo = 'Nokota', capacidade = 120, tipo = 'cars'  },
	{ hash = 1777363799, name = 'washington', price = 100, banido = false, modelo = 'Washington', capacidade = 120, tipo = 'cars'  },
	{ hash = -1660945322, name = 'mamba', price = 240000, banido = false, modelo = 'Mamba', capacidade = 130, tipo = 'cars'  },
	{ hash = 1044193113, name = 'thrax', price = 2000000, banido = false, modelo = 'Thrax', capacidade = 85, tipo = 'cars'  },
	{ hash = -1405937764, name = 'infernus2', price = 250000, banido = false, modelo = 'Infernus 2', capacidade = 85, tipo = 'cars'  },
	{ hash = 1011753235, name = 'coquette2', price = 500000, banido = false, modelo = 'Coquette 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1478704292, name = 'zr3803', price = 100, banido = false, modelo = 'Zr380 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 223240013, name = 'cheetah2', price = 100, banido = false, modelo = 'Cheetah 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -5153954, name = 'exemplar', price = 550000, banido = false, modelo = 'Exemplar', capacidade = 90, tipo = 'cars'  },
	{ hash = -956048545, name = 'taxi', price = 100, banido = true, modelo = 'Taxi', capacidade = 50, tipo = 'cars'  },
	{ hash = -2030171296, name = 'cognoscenti', price = 250000, banido = false, modelo = 'Cognoscenti', capacidade = 130, tipo = 'cars'  },
	{ hash = 941800958, name = 'casco', price = 250000, banido = false, modelo = 'Casco', capacidade = 130, tipo = 'cars'  },
	{ hash = -2096690334, name = 'impaler', price = 102000, banido = false, modelo = 'Impaler', capacidade = 85, tipo = 'cars'  },
	{ hash = -602287871, name = 'btype3', price = 120000, banido = false, modelo = 'Btype 3', capacidade = 50, tipo = 'cars'  },
	{ hash = 117401876, name = 'btype', price = 120000, banido = false, modelo = 'Btype', capacidade = 130, tipo = 'cars'  },
	{ hash = 165154707, name = 'miljet', price = 100, banido = false, modelo = 'Miljet', capacidade = 120, tipo = 'cars'  },
	{ hash = 1102544804, name = 'verlierer2', price = 330000, banido = false, modelo = 'Verlierer 2', capacidade = 85, tipo = 'cars'  },
	{ hash = -1606187161, name = 'nightblade', price = 500000, banido = false, modelo = 'Nightblade', capacidade = 85, tipo = 'bikes'  },
	{ hash = 544021352, name = 'khamelion', price = 100, banido = false, modelo = 'Khamelion', capacidade = 120, tipo = 'cars'  },
	{ hash = -1177863319, name = 'issi2', price = 50000, banido = false, modelo = 'Issi 2', capacidade = 130, tipo = 'cars'  },
	{ hash = -1673356438, name = 'velum', price = 100, banido = false, modelo = 'Velum', capacidade = 120, tipo = 'cars'  },
	{ hash = 1933662059, name = 'rancherxl2', price = 100, banido = false, modelo = 'Rancherxl 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1922255844, name = 'schafter6', price = 100, banido = false, modelo = 'Schafter 6', capacidade = 120, tipo = 'cars'  },
	{ hash = 2016027501, name = 'trailerlogs', price = 100, banido = false, modelo = 'Trailerlogs', capacidade = 120, tipo = 'cars'  },
	{ hash = -1757836725, name = 'seven70', price = 300000, banido = false, modelo = 'Seven70', capacidade = 85, tipo = 'cars'  },
	{ hash = 1104234922, name = 'sentinel3', price = 150000, banido = false, modelo = 'Sentinel 3', capacidade = 110, tipo = 'cars'  },
	{ hash = -507495760, name = 'schlagen', price = 1000000, banido = false, modelo = 'Schlagen', capacidade = 85, tipo = 'cars'  },
	{ hash = -1485523546, name = 'schafter3', price = 180000, banido = false, modelo = 'Schafter 3', capacidade = 130, tipo = 'cars'  },
	{ hash = 1747439474, name = 'stockade', price = 100, banido = false, modelo = 'Stockade', capacidade = 50, tipo = 'cars'  },
	{ hash = -618617997, name = 'wolfsbane', price = 150000, banido = false, modelo = 'Wolfsbane', capacidade = 85, tipo = 'bikes'  },
	{ hash = -410205223, name = 'revolter', price = 100, banido = false, modelo = 'Revolter', capacidade = 120, tipo = 'cars'  },
	{ hash = 1737773231, name = 'rapidgt2', price = 240000, banido = false, modelo = 'Rapidgt 2', capacidade = 85, tipo = 'cars'  },
	{ hash = 837858166, name = 'annihilator', price = 100, banido = false, modelo = 'Annihilator', capacidade = 120, tipo = 'cars'  },
	{ hash = -1934452204, name = 'rapidgt', price = 220000, banido = false, modelo = 'Rapidgt', capacidade = 85, tipo = 'cars'  },
	{ hash = 1093792632, name = 'nero2', price = 420000, banido = false, modelo = 'Nero 2', capacidade = 85, tipo = 'cars'  },
	{ hash = 1527683961, name = 'ursa', price = 600000, banido = false, modelo = 'Porshe Macan', capacidade = 110, tipo = 'cars'  },
	{ hash = 1667876730, name = 'xtz', price = 100, banido = false, modelo = 'XTZ GTM', capacidade = 85, tipo = 'cars'  },
	{ hash = -482719877, name = 'italigtb2', price = 540000, banido = false, modelo = 'Italigtb 2', capacidade = 85, tipo = 'cars'  },
	{ hash = 482197771, name = 'lynx', price = 100, banido = false, modelo = 'Lynx', capacidade = 120, tipo = 'cars'  },
	{ hash = -1529242755, name = 'raiden', price = 800000, banido = false, modelo = 'Raiden', capacidade = 85, tipo = 'cars'  },
	{ hash = -214906006, name = 'jester3', price = 500000, banido = false, modelo = 'Jester 3', capacidade = 110, tipo = 'cars'  },
	{ hash = -2115793025, name = 'avarus', price = 160000, banido = false, modelo = 'Avarus', capacidade = 85, tipo = 'bikes'  },
	{ hash = 1115909093, name = 'hotring', price = 300000, banido = false, modelo = 'Hotring', capacidade = 160, tipo = 'cars'  },
	{ hash = 469291905, name = 'lguard', price = 100, banido = true, modelo = 'Lguard', capacidade = 120, tipo = 'cars'  },
	{ hash = 1637620610, name = 'imperator2', price = 100, banido = false, modelo = 'Imperator 2', capacidade = 40, tipo = 'cars'  },
	{ hash = 2016857647, name = 'futo', price = 150000, banido = false, modelo = 'Futo', capacidade = 120, tipo = 'cars'  },
	{ hash = 884483972, name = 'oppressor', price = 60000, banido = false, modelo = 'Oppressor', capacidade = 85, tipo = 'cars'  },
	{ hash = -1995326987, name = 'feltzer2', price = 200000, banido = false, modelo = 'Feltzer2', capacidade = 130, tipo = 'cars'  },
	{ hash = 1561920505, name = 'comet4', price = 230000, banido = false, modelo = 'Comet 4', capacidade = 120, tipo = 'cars'  },
	{ hash = -570033273, name = 'zombieb', price = 250000, banido = false, modelo = 'Zombie B', capacidade = 85, tipo = 'bikes'  },
	{ hash = -1670998136, name = 'double', price = 370000, banido = false, modelo = 'Double', capacidade = 85, tipo = 'bikes'  },
	{ hash = 1741861769, name = 'streiter', price = 100, banido = false, modelo = 'Streiter', capacidade = 120, tipo = 'cars'  },
	{ hash = 1043222410, name = 'tula', price = 100, banido = false, modelo = 'Tula', capacidade = 120, tipo = 'cars'  },
	{ hash = 237764926, name = 'buffalo3', price = 100, banido = false, modelo = 'Buffalo 3', capacidade = 40, tipo = 'cars'  },
	{ hash = 1039032026, name = 'blista2', price = 40000, banido = false, modelo = 'Blista 2', capacidade = 85, tipo = 'cars'  },
	{ hash = 410882957, name = 'kuruma2', price = 100, banido = false, modelo = 'Kuruma 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1938952078, name = 'firetruk', price = 100, banido = false, modelo = 'Firetruk', capacidade = 85, tipo = 'cars'  },
	{ hash = 767087018, name = 'alpha', price = 100, banido = false, modelo = 'Alpha', capacidade = 120, tipo = 'cars'  },
	{ hash = 37348240, name = 'hotknife', price = 180000, banido = false, modelo = 'Hotknife', capacidade = 110, tipo = 'cars'  },
	{ hash = -1912017790, name = 'wastelander', price = 100, banido = false, modelo = 'Wastelander', capacidade = 120, tipo = 'cars'  },
	{ hash = -1255698084, name = 'trash2', price = 100, banido = false, modelo = 'Trash 2', capacidade = 40, tipo = 'cars'  },
	{ hash = -986944621, name = 'dominator3', price = 450000, banido = false, modelo = 'Dominator3', capacidade = 85, tipo = 'cars'  },
	{ hash = 1917016601, name = 'trash', price = 100, banido = false, modelo = 'Trash', capacidade = 50, tipo = 'cars'  },
	{ hash = -579747861, name = 'scarab3', price = 100, banido = false, modelo = 'Scarab 3', capacidade = 120, tipo = 'cars'  },
	{ hash = 867467158, name = 'dinghy4', price = 100, banido = false, modelo = 'Dinghy 4', capacidade = 40, tipo = 'cars'  },
	{ hash = 345756458, name = 'pbus2', price = 100, banido = false, modelo = 'Pbus 2', capacidade = 40, tipo = 'cars'  },
	{ hash = -1649536104, name = 'phantom2', price = 100, banido = false, modelo = 'Phantom 2', capacidade = 70, tipo = 'cars'  },
	{ hash = 1373123368, name = 'warrener', price = 90000, banido = false, modelo = 'Warrener', capacidade = 120, tipo = 'cars'  },
	{ hash = 1663218586, name = 't20', price = 1500000, banido = false, modelo = 'T20', capacidade = 85, tipo = 'cars'  },
	{ hash = 1896491931, name = 'moonbeam2', price = 5000000, banido = false, modelo = 'Moonbeam 2', capacidade = 40, tipo = 'cars'  },
	{ hash = -1775728740, name = 'granger', price = 280000, banido = false, modelo = 'Granger', capacidade = 250, tipo = 'cars'  },
	{ hash = 1886712733, name = 'bulldozer', price = 100, banido = false, modelo = 'Bulldozer', capacidade = 120, tipo = 'cars'  },
	{ hash = 970356638, name = 'duster', price = 100, banido = false, modelo = 'Duster', capacidade = 120, tipo = 'cars'  },
	{ hash = -392675425, name = 'seabreeze', price = 100, banido = false, modelo = 'Seabreeze', capacidade = 120, tipo = 'cars'  },
	{ hash = -1961627517, name = 'stretch', price = 200000, banido = false, modelo = 'Stretch', capacidade = 120, tipo = 'cars'  },
	{ hash = 1239571361, name = 'issi6', price = 100, banido = false, modelo = 'Issi 6', capacidade = 120, tipo = 'cars'  },
	{ hash = -1450650718, name = 'prairie', price = 10000, banido = false, modelo = 'Prairie', capacidade = 85, tipo = 'cars'  },
	{ hash = -1477580979, name = 'stanier', price = 100, banido = false, modelo = 'Stanier', capacidade = 120, tipo = 'cars'  },
	{ hash = 1887331236, name = 'tropos', price = 100, banido = false, modelo = 'Tropos', capacidade = 120, tipo = 'cars'  },
	{ hash = -888242983, name = 'schafter5', price = 100, banido = false, modelo = 'Schafter 5', capacidade = 120, tipo = 'cars'  },
	{ hash = 627094268, name = 'romero', price = 120000, banido = false, modelo = 'Romero', capacidade = 110, tipo = 'cars'  },
	{ hash = -2040426790, name = 'primo2', price = 100, banido = false, modelo = 'Primo 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1883869285, name = 'premier', price = 100, banido = false, modelo = 'Premier', capacidade = 120, tipo = 'cars'  },
	{ hash = -312295511, name = 'dune5', price = 100, banido = false, modelo = 'Dune 5', capacidade = 120, tipo = 'cars'  },
	{ hash = 2006918058, name = 'cavalcade', price = 110000, banido = false, modelo = 'Cavalcade', capacidade = 160, tipo = 'cars'  },
	{ hash = 1692272545, name = 'strikeforce', price = 100, banido = false, modelo = 'Strikeforce', capacidade = 120, tipo = 'cars'  },
	{ hash = -1779120616, name = 'policeold2', price = 100, banido = true, modelo = 'Policeold 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1924800695, name = 'impaler3', price = 100, banido = false, modelo = 'Impaler 3', capacidade = 40, tipo = 'cars'  },
	{ hash = 906642318, name = 'cog55', price = 200000, banido = false, modelo = 'Cog55', capacidade = 130, tipo = 'cars'  },
	{ hash = -1168952148, name = 'toros', price = 400000, banido = false, modelo = 'Toros', capacidade = 130, tipo = 'cars'  },
	{ hash = 16646064, name = 'virgo3', price = 180000, banido = false, modelo = 'Virgo 3', capacidade = 40, tipo = 'cars'  },
	{ hash = 1221512915, name = 'seminole', price = 100, banido = false, modelo = 'Seminole', capacidade = 120, tipo = 'cars'  },
	{ hash = -2107990196, name = 'guardian', price = 180000, banido = false, modelo = 'Guardian', capacidade = 120, tipo = 'cars'  },
	{ hash = -808457413, name = 'patriot', price = 220000, banido = false, modelo = 'Patriot', capacidade = 130, tipo = 'cars'  },
	{ hash = -1693015116, name = 'riot2', price = 100, banido = true, modelo = 'Riot 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 448402357, name = 'cruiser', price = 1000, banido = true, modelo = 'Cruiser', capacidade = 40, tipo = 'bikes'  },
	{ hash = -1435919434, name = 'bodhi2', price = 170000, banido = false, modelo = 'Bodhi 2', capacidade = 210, tipo = 'cars'  },
	{ hash = -748008636, name = 'mesa2', price = 100, banido = false, modelo = 'Mesa 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1269098716, name = 'landstalker', price = 100, banido = false, modelo = 'Landstalker', capacidade = 120, tipo = 'cars'  },
	{ hash = -1973172295, name = 'police4', price = 100, banido = false, modelo = 'Police 4', capacidade = 85, tipo = 'cars'  },
	{ hash = 683047626, name = 'contender', price = 150000, banido = false, modelo = 'Contender', capacidade = 120, tipo = 'cars'  },
	{ hash = 1978088379, name = 'lancerevolutionx', price = 4500000, banido = false, modelo = 'Lancer Evolution X', capacidade = 85, tipo = 'cars'  },
	{ hash = 850565707, name = 'bjxl', price = 100, banido = false, modelo = 'Bjxl', capacidade = 120, tipo = 'cars'  },
	{ hash = 744705981, name = 'frogger', price = 100, banido = false, modelo = 'Frogger', capacidade = 50, tipo = 'cars'  },
	{ hash = -1622444098, name = 'voltic', price = 320000, banido = false, modelo = 'Voltic', capacidade = 85, tipo = 'cars'  },
	{ hash = -836512833, name = 'fixter', price = 1000, banido = true, modelo = 'Fixter', capacidade = 40, tipo = 'bikes'  },
	{ hash = 1341619767, name = 'vestra', price = 100, banido = false, modelo = 'Vestra', capacidade = 120, tipo = 'cars'  },
	{ hash = 75131841, name = 'glendale', price = 100, banido = false, modelo = 'Glendale', capacidade = 120, tipo = 'cars'  },
	{ hash = 1923400478, name = 'stalion', price = 150000, banido = false, modelo = 'Stalion', capacidade = 110, tipo = 'cars'  },
	{ hash = 782665360, name = 'rhino', price = 100, banido = false, modelo = 'Rhino', capacidade = 120, tipo = 'cars'  },
	{ hash = 83136452, name = 'rebla', price = 1000000, banido = false, modelo = 'Rebla', capacidade = 110, tipo = 'cars'  },
	{ hash = -1479664699, name = 'brawler', price = 300000, banido = false, modelo = 'Brawler', capacidade = 120, tipo = 'cars'  },
	{ hash = -1106120762, name = 'zr3802', price = 100, banido = false, modelo = 'Zr380 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1214293858, name = 'luxor2', price = 100, banido = false, modelo = 'Luxor 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1581459400, name = 'windsor', price = 100000, banido = false, modelo = 'Windsor', capacidade = 85, tipo = 'cars'  },
	{ hash = -1404136503, name = 'daemon2', price = 130000, banido = false, modelo = 'Daemon 2', capacidade = 85, tipo = 'bikes'  },
	{ hash = 970385471, name = 'hydra', price = 100, banido = false, modelo = 'Hydra', capacidade = 120, tipo = 'cars'  },
	{ hash = 1941029835, name = 'tourbus', price = 100, banido = false, modelo = 'Tourbus', capacidade = 40, tipo = 'cars'  },
	{ hash = 368211810, name = 'cargoplane', price = 100, banido = false, modelo = 'Cargoplane', capacidade = 120, tipo = 'cars'  },
	{ hash = -1845487887, name = 'volatus', price = 3000000, banido = false, modelo = 'Volatus', capacidade = 70, tipo = 'exclusive'  },
	{ hash = -667151410, name = 'ratloader', price = 100, banido = false, modelo = 'Ratloader', capacidade = 50, tipo = 'cars'  },
	{ hash = 1645267888, name = 'rancherxl', price = 200000, banido = false, modelo = 'Rancherxl', capacidade = 180, tipo = 'cars'  },
	{ hash = -1189015600, name = 'sandking', price = 350000, banido = false, modelo = 'Sandking', capacidade = 130, tipo = 'cars'  },
	{ hash = 1721676810, name = 'monster3', price = 100, banido = false, modelo = 'Monster 3', capacidade = 120, tipo = 'cars'  },
	{ hash = -845961253, name = 'monster', price = 100, banido = false, modelo = 'Monster', capacidade = 120, tipo = 'cars'  },
	{ hash = -1743316013, name = 'burrito3', price = 500000, banido = false, modelo = 'Burrito 3', capacidade = 250, tipo = 'cars'  },
	{ hash = 2071877360, name = 'insurgent2', price = 100, banido = false, modelo = 'Insurgent 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1860900134, name = 'insurgent', price = 100, banido = false, modelo = 'Insurgent', capacidade = 120, tipo = 'cars'  },
	{ hash = 1770332643, name = 'dloader', price = 100, banido = false, modelo = 'Dloader', capacidade = 120, tipo = 'cars'  },
	{ hash = 1676738519, name = 'audirs6', price = 1400000, banido = false, modelo = 'Audi RS6', capacidade = 160, tipo = 'exclusive'  },
	{ hash = -1590337689, name = 'blazer5', price = 100, banido = false, modelo = 'Blazer 5', capacidade = 120, tipo = 'cars'  },
	{ hash = -726768679, name = 'seasparrow', price = 2000000, banido = false, modelo = 'Seasparrow', capacidade = 70, tipo = 'exclusive'  },
	{ hash = -49115651, name = 'vamos', price = 80000, banido = false, modelo = 'Vamos', capacidade = 85, tipo = 'cars'  },
	{ hash = -1790546981, name = 'faction2', price = 5000000, banido = false, modelo = 'Faction 2', capacidade = 40, tipo = 'cars'  },
	{ hash = -1881846085, name = 'trailersmall2', price = 100, banido = false, modelo = 'Trailersmall 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -401643538, name = 'stalion2', price = 100, banido = false, modelo = 'Stalion 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -1700874274, name = 'starling', price = 100, banido = false, modelo = 'Starling', capacidade = 120, tipo = 'cars'  },
	{ hash = -1700801569, name = 'scrap', price = 100, banido = false, modelo = 'Scrap', capacidade = 120, tipo = 'cars'  },
	{ hash = 833469436, name = 'slamvan2', price = 190000, banido = false, modelo = 'Slamvan 2', capacidade = 40, tipo = 'cars'  },
	{ hash = -1685021548, name = 'sabregt', price = 7000000, banido = false, modelo = 'Sabregt', capacidade = 40, tipo = 'cars'  },
	{ hash = -663299102, name = 'trophytruck2', price = 100, banido = false, modelo = 'Trophytruck 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -644710429, name = 'cuban800', price = 100, banido = false, modelo = 'Cuban800', capacidade = 120, tipo = 'cars'  },
	{ hash = 704435172, name = 'cog552', price = 100, banido = false, modelo = 'Cog55 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -789894171, name = 'cavalcade2', price = 130000, banido = false, modelo = 'Cavalcade 2', capacidade = 160, tipo = 'cars'  },
	{ hash = -688189648, name = 'dominator4', price = 100, banido = false, modelo = 'Dominator 4', capacidade = 40, tipo = 'cars'  },
	{ hash = -915704871, name = 'dominator2', price = 100, banido = false, modelo = 'Dominator 2', capacidade = 40, tipo = 'cars'  },
	{ hash = 1340840936, name = 'dl2016', price = 1500000, banido = false, modelo = 'Ram', capacidade = 250, tipo = 'exclusive'  },
	{ hash = 1448677353, name = 'tropic2', price = 270000, banido = false, modelo = 'Tropic 2', capacidade = 85, tipo = 'cars'  },
	{ hash = -1758137366, name = 'penetrator', price = 100, banido = false, modelo = 'Penetrator', capacidade = 120, tipo = 'cars'  },
	{ hash = -1050465301, name = 'mule2', price = 500000, banido = false, modelo = 'Mule 2', capacidade = 250, tipo = 'exclusive'  },
	{ hash = -1233807380, name = 'tribike2', price = 1000, banido = true, modelo = 'Tribike 2', capacidade = 40, tipo = 'bikes'  },
	{ hash = 2004548589, name = 'civictyper', price = 1400000, banido = false, modelo = 'Civic Type R', capacidade = 85, tipo = 'exclusive'  },
	{ hash = -1066334226, name = 'submersible2', price = 100, banido = false, modelo = 'Submersible 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 1790834270, name = 'diablous2', price = 55000, banido = false, modelo = 'Diablous 2', capacidade = 85, tipo = 'bikes'  },
	{ hash = -114291515, name = 'bati', price = 300000, banido = false, modelo = 'Bati', capacidade = 85, tipo = 'bikes'  },
	{ hash = -1210451983, name = 'tampa3', price = 100, banido = false, modelo = 'Tampa 3', capacidade = 40, tipo = 'cars'  },
	{ hash = 1489874736, name = 'thruster', price = 100, banido = false, modelo = 'Thruster', capacidade = 120, tipo = 'cars'  },
	{ hash = 1507916787, name = 'picador', price = 30000, banido = false, modelo = 'Picador', capacidade = 110, tipo = 'cars'  },
	{ hash = -1146969353, name = 'scarab', price = 100, banido = false, modelo = 'Scarab', capacidade = 120, tipo = 'cars'  },
	{ hash = -1214505995, name = 'shamal', price = 100, banido = false, modelo = 'Shamal', capacidade = 120, tipo = 'cars'  },
	{ hash = 1074326203, name = 'barracks2', price = 100, banido = false, modelo = 'Barracks 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 562680400, name = 'apc', price = 100, banido = false, modelo = 'Apc', capacidade = 120, tipo = 'cars'  },
	{ hash = -420911112, name = 'patriot2', price = 100, banido = false, modelo = 'Patriot 2', capacidade = 120, tipo = 'cars'  },
	{ hash = -227741703, name = 'ruiner', price = 150000, banido = false, modelo = 'Ruiner', capacidade = 130, tipo = 'cars'  },
	{ hash = 710198397, name = 'supervolito', price = 100, banido = false, modelo = 'Supervolito', capacidade = 120, tipo = 'cars'  },
	{ hash = 1909141499, name = 'fugitive', price = 50000, banido = false, modelo = 'Fugitive', capacidade = 90, tipo = 'cars'  },
	{ hash = -609625092, name = 'vortex', price = 250000, banido = false, modelo = 'Vortex', capacidade = 85, tipo = 'bikes'  },
	{ hash = -1930048799, name = 'windsor2', price = 270000, banido = false, modelo = 'Windsor 2', capacidade = 120, tipo = 'cars'  },
	{ hash = 290013743, name = 'tropic', price = 270000, banido = false, modelo = 'Tropic', capacidade = 85, tipo = 'barco'  },
	{ hash = 1070967343, name = 'toro', price = 290000, banido = false, modelo = 'Toro', capacidade = 85, tipo = 'cars'  },
	{ hash = -913589546, name = 'glendale2', price = 2900000, banido = false, modelo = 'glendalee', capacidade = 85, tipo = 'cars'  },


	---------------- CARROS BRASILEIROS ADICIONADOS DIA 21

	{ hash = -1773424714, name = 'passat', price = 270000, banido = false, modelo = 'Passat', capacidade = 120, tipo = 'cars'  },
	{ hash = -1702326766, name = 'corolla ', price = 250000, banido = false, modelo = 'Corolla', capacidade = 120, tipo = 'cars'  },
	{ hash = -1927169751, name = 'megane4', price = 230000, banido = false, modelo = 'Megane', capacidade = 120, tipo = 'cars'  },
	{ hash = 1042517460, name = 'frontier17', price = 150000, banido = false, modelo = 'Frontier 2017', capacidade = 200, tipo = 'cars'  },
	{ hash = -1947578251, name = 'amarok17', price = 140000, banido = false, modelo = 'Amarok 2017', capacidade = 200, tipo = 'cars'  },
	{ hash = -252643265, name = 'ftoro', price = 95000, banido = false, modelo = 'Fiat Toro', capacidade = 120, tipo = 'cars'  },
	{ hash = -361155694, name = 'punto', price = 95000, banido = false, modelo = 'Punto', capacidade = 120, tipo = 'cars'  },
	{ hash = -1090954194, name = 'pajero4', price = 80000, banido = false, modelo = 'Pajero', capacidade = 150, tipo = 'cars'  },
	{ hash = -2019386221, name = 'golfgti', price = 70000, banido = false, modelo = 'Golf Gti', capacidade = 120, tipo = 'cars'  },
	--{ hash = 999999999, name = 'rrs08', price = 2900000, banido = false, modelo = 'glendalee', capacidade = 85, tipo = 'cars'  },
	{ hash = -1642332635, name = '208', price = 50000, banido = false, modelo = 'Peugeot 208', capacidade = 120, tipo = 'cars'  },
	{ hash = -854631421, name = '206', price = 45000, banido = false, modelo = 'Peugeot 206', capacidade = 120, tipo = 'cars'  },
	{ hash = -493679946, name = 'civc', price = 40000, banido = false, modelo = 'Civic 2003', capacidade = 120, tipo = 'cars'  },
	--{ hash = 999999999, name = 'honda', price = 2900000, banido = false, modelo = 'glendalee', capacidade = 85, tipo = 'cars'  },
	--{ hash = -1777553685, name = 'xr3', price = 2900000, banido = false, modelo = 'glendalee', capacidade = 85, tipo = 'cars'  },
	--{ hash = 999999999, name = 'glendale2', price = 2900000, banido = false, modelo = 'glendalee', capacidade = 85, tipo = 'cars'  },
	{ hash = -723997994, name = 'kombi', price = 30000, banido = false, modelo = 'VW Kombi', capacidade = 85, tipo = 'cars'  },
	{ hash = 1924372706, name = 'fusca', price = 25000, banido = false, modelo = 'VW Fusca', capacidade = 85, tipo = 'cars'  },

-------------- MOTOS NOVAS BRASILEIRAS
	{ hash = 1088829493, name = 'cg160', price = 25000, banido = false, modelo = 'CG Titan 160', capacidade = 20, tipo = 'cars'  },
}


----------------------------------------------
----------------------------------------------


-- RETORNA A LISTA DE VEÍCULOS
config.getVehList = function()
	return config.vehList
end

-- RETORNA AS INFORMAÇÕES CONTIDAS NA LISTA DE UM VEÍCULO ESPECÍFICO
config.getVehicleInfo = function(vehicle)
	for i in ipairs(config.vehList) do
		if vehicle == config.vehList[i].hash or vehicle == config.vehList[i].name then
            return config.vehList[i]
        end
    end
    return false
end

-- RETORNA O MODELO DE UM VEÍCULO ESPECÍFICO (NOME BONITINHO)
config.getVehicleModel = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.modelo or vehicle
	end
	return vehicle
end

-- RETORNA A CAPACIDADE DO PORTA-MALAS DE UM VEÍCULO ESPECÍFICO
config.getVehicleTrunk = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.capacidade or 0
	end
	return 0
end

-- RETORNA O PREÇO DE UM VEÍCULO ESPECÍFICO
config.getVehiclePrice = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.price or 0
	end
	return 0
end

-- RETORNA O TIPO DE UM VEÍCULO ESPECÍFICO
config.getVehicleType = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.tipo or 0
	end
	return "none"
end

-- RETORNA O STATUS DE BANIDO DE UM VEÍCULO ESPECÍFICO
config.isVehicleBanned = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.banido
	end
	return false
end



-----------------------------------------------------------------
------------- GARAGENS PÚBLICAS E DE SERVIÇO --------------------
-----------------------------------------------------------------

config.garages = {
	[1] = { type = 'public', coords = vec3(55.43,-876.19,30.66), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(50.66,-873.02,30.45), h = 159.65 },
		[2] = { vec3(47.34,-871.81,30.45), h = 159.65 },
		[3] = { vec3(44.17,-870.5,30.45), h = 159.65 },
	  },
	},
	[2] = { type = 'public', coords = vec3(317.25,2623.14,44.46), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(334.52,2623.09,44.49), h = 20.0 },
	  },
	},
	[3] = { type = 'public', coords = vec3(-773.34,5598.15,33.6), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-772.89,5578.5,33.49), h = 88.93 },
		[2] = { vec3(-773.05,5575.46,33.49), h = 89.8 },
		[3] = { vec3(-772.88,5572.48,33.49), h = 88.7 },
	  },
	},
	[4] = { type = 'public', coords = vec3(275.23,-345.54,45.17), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(283.78,-342.62,44.92), h = 248.66 },
		[2] = { vec3(285.04,-339.32,44.92), h = 249.32 },
		[3] = { vec3(286.38,-336.12,44.92), h = 249.51 },
	  },
	},
	[5] = { type = 'public', coords = vec3(-352.43,-148.73,38.25), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-364.97,-145.09,38.39), h = 61.25 },
	  },
	},
	[6] = { type = 'public', coords = vec3(-340.76,265.97,85.67), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-348.93,272.36,85.14), h = 268.69 },
		[2] = { vec3(-348.88,275.8,85.07), h = 273.08 },
		[3] = { vec3(-348.97,279.16,84.98), h = 271.96 },
	  },
	},
	[7] = { type = 'public', coords = vec3(2530.88,-376.16,93.0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(2540.26,-380.66,93.0), h = 352.36 },
	  },
	},
	[8] = { type = 'public', coords = vec3(-706.09,-1464.1,5.05), perm = nil, marker = "helicóptero",
	  vehiclePositions = {
		[1] = { vec3(-724.65,-1443.79,5.01), h = 153.75 },
		[2] = { vec3(-744.53,-1468.1,5.01), h = 137.04 },
	  },
	},
	[9] = { type = 'public', coords = vec3(214.02,-808.44,31.01), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(205.55,-800.85,30.7), h = 248.62 },
		[2] = { vec3(206.51,-798.32,30.68), h = 249.19 },
		[3] = { vec3(207.57,-795.93,30.66), h = 248.62 },
		[4] = { vec3(208.44,-793.43,30.64), h = 248.53 },
	  },
	},
	[10] = { type = 'public', coords = vec3(-761.94,-1420.15,1.61), perm = nil, tipo = "barco", marker = "barco",
	  vehiclePositions = {
		[1] = { vec3(-773.28,-1426.46,-0.47), h = 129.76 },
	  },
	},
	[11] = { type = 'service', coords = vec3(459.02,-1010.71,28.18), perm = 'Police',
	  vehiclePositions = {
		[1] = { vec3(451.46,-1018.64,28.47), h = 12.2 },
	  },
	  vehicles = {
		{ vehicle = 'corollarj', modelo = 'corollarj' },
		{ vehicle = 'r1250rj', modelo = 'r1250rj' },
		{ vehicle = 'xtz', modelo = 'xtz' },
		{ vehicle = 'focusrj', modelo = 'focusrj' },
		{ vehicle = 'urusrj', modelo = 'urusrj' },
		{ vehicle = 'frontierrj', modelo = 'frontierrj' },
		{ vehicle = 'hiluxpolicia', modelo = 'hiluxpolicia' },
		{ vehicle = 'bmwm8prf', modelo = 'bmwm8prf' },
		{ vehicle = 'amarokprf', modelo = 'amarokprf' },
		{ vehicle = 'q8pc', modelo = 'q8pc' },
		{ vehicle = 'pranger', modelo = 'pranger' },
		{ vehicle = 'pbus', modelo = 'pbus' },
		{ vehicle = 'policet', modelo = 'policet' },
		{ vehicle = 'caveiraobope', modelo = 'caveiraobope' },
		{ vehicle = 'riot', modelo = 'riot' },
		{ vehicle = 'frontierbope', modelo = 'frontierbope' },
		{ vehicle = 'amarokrj', modelo = 'amarokrj' },  
	  }
	},
	[12] = { type = 'service', coords = vec3(-1632.14,-1160.35,1.84), perm = 'Police',
	  vehiclePositions = {
		[1] = { vec3(-1631.99,-1166.39,-0.09), h = 12.2 },
	  },
	  vehicles = {
		{ vehicle = 'predator', modelo = 'predator' },
	  }
	},
	[13] = { type = 'service', coords = vec3(2505.06,-336.22,118.03), perm = 'Police',
	  vehiclePositions = {
		[1] = { vec3(2512.85,-340.22,118.19), h = 319.78 },
	  },
	  vehicles = {
		{ vehicle = 'polmav', modelo = 'polmav' },
		{ vehicle = 'swift', modelo = 'swift' }, 
	  }
	},
	[14] = { type = 'service', coords = vec3(-450.86,-351.15,34.5), perm = 'Paramedic',
	  vehiclePositions = {
		[1] = { vec3(-454.78,-341.2,34.36), h = 170.0 },
	  },
	  vehicles = {
		{ vehicle = 'mercambulancia', modelo = 'mercambulancia' },
		{ vehicle = 'fordambulancia', modelo = 'fordambulancia' },
		{ vehicle = 'wheelchair', modelo = 'wheelchair' },
		{ vehicle = 'hiluxpolicia', modelo = 'hiluxpolicia' },
		{ vehicle = 'ambulance', modelo = 'ambulance' },
		{ vehicle = '20ramambo', modelo = '20ramambo' },
		{ vehicle = 'stretcher', modelo = 'stretcher' },
		{ vehicle = 'jeepsamu', modelo = 'jeepsamu' },  
	  }
	},
	[15] = { type = 'service', coords = vec3(-495.63,-323.63,73.16), perm = 'Paramedic',
	  vehiclePositions = {
		[1] = { vec3(-503.16,-314.71,73.16), h = 170.53 },
	  },
	  vehicles = {
		{ vehicle = 'samumav', modelo = 'samumav' },
	  }
	},
	[16] = { type = 'service', coords = vec3(-351.83,-109.1,38.7), perm = 'LosSantos',
	  vehiclePositions = {
		[1] = { vec3(-361.61,-116.6,38.7), h = 129.76 },
	  },
	  vehicles = {
		{ vehicle = 'flatbed', modelo = 'flatbed' },
		{ vehicle = 'slamtruck', modelo = 'slamtruck' },  
	  }
	},
	[17] = { type = 'service', coords = vec3(453.89,-600.57,28.58), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(462.73,-605.53,28.49), h = 217.18 },
		[2] = { vec3(462.33,-612.98,28.49), h = 217.18 },
		[3] = { vec3(461.59,-620.42,28.49), h = 217.18 },
		[4] = { vec3(461.09,-627.97,28.49), h = 217.18 },
	},
	vehicles = {
	  { vehicle = 'bus', modelo = 'bus' },  
	}
  },
	[18] = { type = 'service', coords = vec3(351.97,279.27,103.33), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(361.29,273.9,103.15), h = 345.96 },
		[2] = { vec3(370.52,273.38,103.13), h = 326.96 },
	},
	vehicles = {
	  { vehicle = 'stockade', modelo = 'stockade' },  
	}
  },
	[19] = { type = 'service', coords = vec3(-841.92,5401.73,34.62), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-837.2,5405.47,33.78), h = 339.19 },
	},
	vehicles = {
	  { vehicle = 'ratloader', modelo = 'ratloader' }, 
		}
	 },
	[20] = { type = 'service', coords = vec3(-581.9,-1645.0,19.47), perm = nil, marker = "truck",
	  vehiclePositions = {
		[1] = { vec3(-585.9,-1638.38,19.47), h = 239.07 },
		[2] = { vec3(-574.8,-1641.93,19.42), h = 229.69 },
	},
	vehicles = {
	  { vehicle = 'trash', modelo = 'trash' },  
	}
  },
	[21] = { type = 'service', coords = vec3(114.94,277.32,109.98), perm = nil, -- TACO
	  vehiclePositions = {
		[1] = { vec3(121.08,287.8,109.98), h = 69.31 },
		[2] = { vec3(107.53,286.44,109.98), h = 251.26 },
		[3] = { vec3(108.64,290.32,109.98), h = 244.69 },
		--[4] = { vec3(43.76,-1629.64,29.19), h = 320.08 },
	},
	vehicles = {
	  { vehicle = 'faggio2', modelo = 'faggio2' },  
	}
  },
	[22] = { type = 'service', coords = vec3(407.89,-1624.71,29.3), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(408.61,-1646.79,29.3), h = 227.65 },
	},
	vehicles = {
	  { vehicle = 'flatbed', modelo = 'flatbed' },  
	}
  },
	[23] = { type = 'service', coords = vec3(1696.16,4785.13,42.03), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1689.8,4788.04,42.01), h = 89.15 },
		[2] = { vec3(1689.82,4782.18,42.01), h = 89.1 },
		[3] = { vec3(1689.79,4778.24,42.01), h = 89.74 },
	},
	vehicles = {
	  { vehicle = 'flatbed', modelo = 'flatbed' },  
	}
  },
	[24] = { type = 'service', coords = vec3(899.86,-171.44,74.08), perm = 'Taxista',
	  vehiclePositions = {
		[1] = { vec3(909.08,-176.69,74.21), h = 236.25 },
	  },
	  vehicles = {
		{ vehicle = 'taxi', modelo = 'taxi' },  
	  }
	},
	[25] = { type = 'service', coords = vec3(-569.55,-925.95,36.83), perm = 'Jornal',
	  vehiclePositions = {
		[1] = { vec3(-582.39,-930.48,36.83), h = 75.0 },
	  },
	  vehicles = {
		{ vehicle = 'rumpo', modelo = 'rumpo' },  
	  }
	},
	[26] = { type = 'service', coords = vec3(-537.1,-886.54,25.2), perm = 'Jornal',
	  vehiclePositions = {
		[1] = { vec3(-544.0,-900.64,23.93), h = 168.44 },
	  },
	  vehicles = {
		{ vehicle = 'rumpo', modelo = 'rumpo' },  
	  }
	},
	[27] = { type = 'service', coords = vec3(-1923.33,2053.88,140.83), perm = 'Mafia',
	  vehiclePositions = {
		[1] = { vec3(-1914.0,2050.32,140.74), h = 255.1 },
	  },
	  vehicles = {
		{ vehicle = 'ztype', modelo = 'ztype' },
		{ vehicle = 'btype3', modelo = 'btype3' },  
	  }
	},
	[28] = { type = 'service', coords = vec3(1388.08,-727.54,67.19), perm = 'TheLost',
	  vehiclePositions = {
		[1] = { vec3(1380.61,-734.66,67.23), h = 126.62 },
	  },
	  vehicles = {
		{ vehicle = 'deathbike', modelo = 'deathbike' },
		{ vehicle = 'hexer', modelo = 'hexer' },
		{ vehicle = 'sanctus', modelo = 'sanctus' },
		{ vehicle = 'gburrito', modelo = 'gburrito' },
		{ vehicle = 'gargoyle', modelo = 'gargoyle' },  
	  }
	},
	[29] = { type = 'service', coords = vec3(992.72,-1541.05,30.84), perm = 'Lowrider',
	  vehiclePositions = {
		[1] = { vec3(988.66,-1534.63,30.8), h = 86.87 },
	  },
	  vehicles = {
		{ vehicle = 'faction2', modelo = 'faction2' },
		{ vehicle = 'faction3', modelo = 'faction3' },
		{ vehicle = 'moonbeam2', modelo = 'moonbeam2' },
		{ vehicle = 'sabregt2', modelo = 'sabregt2' },
		{ vehicle = 'voodoo', modelo = 'voodoo' },
		{ vehicle = 'chino2', modelo = 'chino2' },  
	  }
	},
	[30] = { type = 'service', coords = vec3(1080.89,-1971.87,31.02), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1071.41,-1961.99,31.02), h = 137.34 },
	},
	vehicles = {
	  { vehicle = 'tiptruck2', modelo = 'tiptruck2' },
	}
  },
	[31] = { type = 'service', coords = vec3(-1728.06,-1050.69,1.71), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1742.36,-1065.43,0.14), h = 136.11 },
	},
	vehicles = {
	  { vehicle = 'marquis', modelo = 'marquis' },
	  { vehicle = 'seashark', modelo = 'seashark' },
	  { vehicle = 'dinghy', modelo = 'dinghy' },
	}
  },
	[32] = { type = 'service', coords = vec3(-893.95,5687.78,3.29), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-920.05,5677.73,-0.3), h = 107.48 },
	},
	vehicles = {
	  { vehicle = 'marquis', modelo = 'marquis' },
	  { vehicle = 'seashark', modelo = 'seashark' },
	  { vehicle = 'dinghy', modelo = 'dinghy' },
	}
  },
	[33] = { type = 'service', coords = vec3(-776.72,-1495.02,2.29), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-794.34,-1502.12,-0.47), h = 110.84 },
	},
	vehicles = {
	  { vehicle = 'marquis', modelo = 'marquis' },
	  { vehicle = 'seashark', modelo = 'seashark' },
	  { vehicle = 'dinghy', modelo = 'dinghy' },
	}
  },
	[34] = { type = 'service', coords = vec3(2505.46,-432.38,118.24), perm = 'Police',
	  vehiclePositions = {
		[1] = { vec3(2512.71,-428.38,118.34), h = 234.11 },
	  },
	  vehicles = {
		{ vehicle = 'corollarj', modelo = 'corollarj' },
		{ vehicle = 'r1250rj', modelo = 'r1250rj' },
		{ vehicle = 'xtz', modelo = 'xtz' },
		{ vehicle = 'focusrj', modelo = 'focusrj' },
		{ vehicle = 'urusrj', modelo = 'urusrj' },
		{ vehicle = 'frontierrj', modelo = 'frontierrj' },
		{ vehicle = 'hiluxpolicia', modelo = 'hiluxpolicia' },
		{ vehicle = 'bmwm8prf', modelo = 'bmwm8prf' },
		{ vehicle = 'amarokprf', modelo = 'amarokprf' },
		{ vehicle = 'q8pc', modelo = 'q8pc' },
		{ vehicle = 'pranger', modelo = 'pranger' },
		{ vehicle = 'pbus', modelo = 'pbus' },
		{ vehicle = 'policet', modelo = 'policet' },
		{ vehicle = 'caveiraobope', modelo = 'caveiraobope' },
		{ vehicle = 'riot', modelo = 'riot' },
		{ vehicle = 'frontierbope', modelo = 'frontierbope' },
		{ vehicle = 'amarokrj', modelo = 'amarokrj' },  
	  }
	},
	[35] = { type = 'service', coords = vec3(2532.2,-388.26,93.12), perm = 'Police',
	  vehiclePositions = {
		[1] = { vec3(2539.86,-387.15,93.0), h = 196.87 },
	  },
	  vehicles = {
		{ vehicle = 'corollarj', modelo = 'corollarj' },
		{ vehicle = 'r1250rj', modelo = 'r1250rj' },
		{ vehicle = 'xtz', modelo = 'xtz' },
		{ vehicle = 'focusrj', modelo = 'focusrj' },
		{ vehicle = 'urusrj', modelo = 'urusrj' },
		{ vehicle = 'frontierrj', modelo = 'frontierrj' },
		{ vehicle = 'hiluxpolicia', modelo = 'hiluxpolicia' },
		{ vehicle = 'bmwm8prf', modelo = 'bmwm8prf' },
		{ vehicle = 'amarokprf', modelo = 'amarokprf' },
		{ vehicle = 'q8pc', modelo = 'q8pc' },
		{ vehicle = 'pranger', modelo = 'pranger' },
		{ vehicle = 'pbus', modelo = 'pbus' },
		{ vehicle = 'policet', modelo = 'policet' },
		{ vehicle = 'caveiraobope', modelo = 'caveiraobope' },
		{ vehicle = 'riot', modelo = 'riot' },
		{ vehicle = 'frontierbope', modelo = 'frontierbope' },
		{ vehicle = 'amarokrj', modelo = 'amarokrj' },  
	  }
	},
	[36] = { type = 'service', coords = vec3(-424.09,-2789.27,6.29), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-421.49,-2783.25,6.01), h = 335.84 },
		},
	vehicles = {
	  { vehicle = 'boxville4', modelo = 'boxville4' },
	}
	},
 	[37] = { type = 'service', coords = vec3(-1565.4,-978.83,13.02), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1549.42,-988.01,13.02), h = 22.11 },
	  },
	  vehicles = {
		{ vehicle = 'mule2', modelo = 'mule2' }, 
	  }
	},
	[38] = { type = 'service', coords = vec3(209.86,-1640.46,29.8), perm = 'Paramedic',
	  vehiclePositions = {
		[1] = { vec3(216.75,-1636.39,29.43), h = 22.11 },
	  },
	  vehicles = {
		{ vehicle = 'arrowladder', modelo = 'arrowladder' },
		{ vehicle = 'firetruk', modelo = 'firetruk' },
		{ vehicle = 'lguard', modelo = 'lguard' },
	  }
	},
	[39] = { type = 'service', coords = vec3(-351.83,-109.1,38.7), perm = 'LosSantos',
	  vehiclePositions = {
		[1] = { vec3(-361.61,-116.6,38.7), h = 129.76 },
	  },
	  vehicles = {
		{ vehicle = 'flatbed', modelo = 'flatbed' },
		{ vehicle = 'slamtruck', modelo = 'slamtruck' },  
	  }
	},
	[40] = { type = 'service', coords = vec3(1754.24,-1649.14,112.66), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1765.31,-1652.54,112.66), h = 239.58 },
	  },
	  vehicles = {
		{ vehicle = 'gburrito2', modelo = 'gburrito2' },
	  }
	},
	[41] = { type = 'service', coords = vec3(463.42,-982.79,43.7), perm = 'Police',
	  vehiclePositions = {
		[1] = { vec3(449.66,-981.3,43.7), h = 319.78 },
	  },
	  vehicles = {
		{ vehicle = 'polmav', modelo = 'polmav' },
		{ vehicle = 'swift', modelo = 'swift' }, 
	  }
	},
	[42] = { type = 'service', coords = vec3(-1053.86,-841.98,5.05), perm = 'Police',
	  vehiclePositions = {
		[1] = { vec3(-1048.29,-846.11,4.87), h = 214.89 },
		[2] = { vec3(-1052.13,-847.21,4.87), h = 214.89 },
		[3] = { vec3(-1055.22,-849.47,4.87), h = 214.89 },
		[4] = { vec3(-1058.44,-851.74,4.87), h = 214.89 },
		[5] = { vec3(-1061.55,-853.95,4.87), h = 214.89 },

		[6] = { vec3(-1039.41,-855.37,4.88), h = 60.26 },
		[7] = { vec3(-1042.07,-858.62,4.89), h = 60.26 },
		[8] = { vec3(-1045.01,-861.49,4.93), h = 60.26 },
		[9] = { vec3(-1045.05,-861.46,4.93), h = 60.26 },
	  },
	  vehicles = {
		{ vehicle = 'corollarj', modelo = 'corollarj' },
		{ vehicle = 'r1250rj', modelo = 'r1250rj' },
		{ vehicle = 'xtz', modelo = 'xtz' },
		{ vehicle = 'focusrj', modelo = 'focusrj' },
		{ vehicle = 'urusrj', modelo = 'urusrj' },
		{ vehicle = 'frontierrj', modelo = 'frontierrj' },
		{ vehicle = 'hiluxpolicia', modelo = 'hiluxpolicia' },
		{ vehicle = 'bmwm8prf', modelo = 'bmwm8prf' },
		{ vehicle = 'amarokprf', modelo = 'amarokprf' },
		{ vehicle = 'q8pc', modelo = 'q8pc' },
		{ vehicle = 'pranger', modelo = 'pranger' },
		{ vehicle = 'pbus', modelo = 'pbus' },
		{ vehicle = 'policet', modelo = 'policet' },
		{ vehicle = 'caveiraobope', modelo = 'caveiraobope' },
		{ vehicle = 'riot', modelo = 'riot' },
		{ vehicle = 'frontierbope', modelo = 'frontierbope' },
		{ vehicle = 'amarokrj', modelo = 'amarokrj' },  
	  }
	},
	[43] = { type = 'public', coords = vec3(-1082.53,-866.54,5.05), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1079.54,-884.25,4.61), h = 29.13 },
		[2] = { vec3(-1076.14,-882.48,4.68), h = 25.02 },
		[3] = { vec3(-1073.05,-879.93,4.77), h = 27.34 },
	  },
	},

	[44] = { type = 'public', coords = vec3(1702.74,4937.15,42.08), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1700.24,4945.11,42.31), h = 48.28 },
		[2] = { vec3(1695.99,4941.64,42.21), h = 48.28 },
	  },
	},

	[45] = { type = 'service', coords = vec3(-1107.03,-832.86,37.7), perm = 'Police',
	  vehiclePositions = {
		[1] = { vec3(-1096.58,-832.54,37.71), h = 308.0 },
	  },
	  vehicles = {
		{ vehicle = 'polmav', modelo = 'polmav' },
		{ vehicle = 'swift', modelo = 'swift' }, 
	  }
	},

	[46] = { type = 'public', coords = vec3(-1033.59,-2733.13,20.17), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1029.35,-2732.12,20.11), h = 238.31 },
		[2] = { vec3(-1037.42,-2727.14,20.12), h = 241.11 },
	  },
	},
	-- VERDE
	[47] = { type = 'public', coords = vec3(1001.55,903.13,210.38), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1004.74,898.49,210.0), h = 134.66 },
	  },
	},
	-- AZUL
	[48] = { type = 'public', coords = vec3(-1033.59,-2733.13,20.17), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(3053.45,5050.87,25.3), h = 238.31 },
		[2] = { vec3(3058.39,5051.03,25.29), h = 169.44 },
	  },
	},
	-- VERMELHO
	[49] = { type = 'public', coords = vec3(1217.09,-278.24,69.22), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1222.22,-282.79,69.56), h = 107.71 },
	  },
	},
	-- LARANJA
	[50] = { type = 'public', coords = vec3(-82.06,1514.02,282.91), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-76.44,1515.03,282.58), h = 201.81 },
	  },
	},
	-- BARCOS BOAT
	[51] = { type = 'service', coords = vec3(13.78,-2799.96,2.53), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(11.18,-2805.79,-0.04), h = 83.67 },
	  },
	  vehicles = {
		{ vehicle = 'dinghy', modelo = 'dinghy' },
		{ vehicle = 'jetmax', modelo = 'jetmax' }, 
		{ vehicle = 'speeder', modelo = 'speeder' }, 
		{ vehicle = 'seashark3', modelo = 'seashark3' }, 
	  }
	},

	[52] = { type = 'service', coords = vec3(-1802.08,-1228.21,1.63), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1799.69,-1231.88,-0.47), h = 325.31 },
	  },
	  vehicles = {
		{ vehicle = 'dinghy', modelo = 'dinghy' },
		{ vehicle = 'jetmax', modelo = 'jetmax' }, 
		{ vehicle = 'speeder', modelo = 'speeder' }, 
		{ vehicle = 'seashark3', modelo = 'seashark3' }, 
	  }
	},
}
  
-----------------------------------------------------------------
-----------------------------------------------------------------
-----------------------------------------------------------------



-----------------------------------------------------------------
------------------ GARAGENS DAS CASAS ---------------------------
-----------------------------------------------------------------


config.homeGarages = {
	[1] = { type = 'home', coords = vec3(854.97,-516.04,57.74),
	  vehiclePositions = {
		[1] = { vec3(859.71,-522.74,57.28), h = 223.75 },
	  },
	  home = 'Middle012'
	},
	[2] = { type = 'home', coords = vec3(1031.52,-406.78,65.96),
	  vehiclePositions = {
		[1] = { vec3(1035.58,-410.92,66.11), h = 211.67 },
	  },
	  home = 'Middle020'
	},
	[3] = { type = 'home', coords = vec3(984.3,-579.11,59.28),
	  vehiclePositions = {
		[1] = { vec3(982.96,-573.33,59.29), h = 27.01 },
	  },
	  home = 'Middle024'
	},
	[4] = { type = 'home', coords = vec3(1008.82,-565.19,60.2),
	  vehiclePositions = {
		[1] = { vec3(1011.92,-563.34,60.2), h = 260.86 },
	  },
	  home = 'Middle025'
	},
	[5] = { type = 'home', coords = vec3(1003.84,-588.14,59.14),
	  vehiclePositions = {
		[1] = { vec3(1010.12,-590.49,58.89), h = 254.58 },
	  },
	  home = 'Middle026'
	},
	[6] = { type = 'home', coords = vec3(924.46,-566.82,57.97),
	  vehiclePositions = {
		[1] = { vec3(929.56,-573.1,57.73), h = 207.34 },
	  },
	  home = 'Middle027'
	},
	[7] = { type = 'home', coords = vec3(896.36,-549.29,58.13),
	  vehiclePositions = {
		[1] = { vec3(886.85,-553.21,57.81), h = 111.85 },
	  },
	  home = 'Middle028'
	},
	[8] = { type = 'home', coords = vec3(920.79,-529.92,59.21),
	  vehiclePositions = {
		[1] = { vec3(916.85,-521.94,58.75), h = 16.27 },
	  },
	  home = 'Middle029'
	},
	[9] = { type = 'home', coords = vec3(950.29,-517.05,60.24),
	  vehiclePositions = {
		[1] = { vec3(945.97,-509.01,60.21), h = 28.77 },
	  },
	  home = 'Middle030'
	},
	[10] = { type = 'home', coords = vec3(1261.81,-446.31,69.87),
	  vehiclePositions = {
		[1] = { vec3(1268.81,-441.86,69.44), h = 282.87 },
	  },
	  home = 'Middle060'
	},
	[11] = { type = 'home', coords = vec3(1260.49,-422.64,69.42),
	  vehiclePositions = {
		[1] = { vec3(1262.72,-418.37,69.23), h = 297.4 },
	  },
	  home = 'Middle061'
	},
	[12] = { type = 'home', coords = vec3(1308.31,-528.34,71.32),
	  vehiclePositions = {
		[1] = { vec3(1307.65,-536.31,71.25), h = 164.16 },
	  },
	  home = 'Middle062'
	},
	[13] = { type = 'home', coords = vec3(1321.89,-524.86,72.13),
	  vehiclePositions = {
		[1] = { vec3(1318.17,-534.73,72.07), h = 174.33 },
	  },
	  home = 'Middle063'
	},
	[14] = { type = 'home', coords = vec3(1353.44,-548.16,73.81),
	  vehiclePositions = {
		[1] = { vec3(1352.7,-555.56,74.21), h = 155.42 },
	  },
	  home = 'Middle064'
	},
	[15] = { type = 'home', coords = vec3(1366.94,-544.45,74.34),
	  vehiclePositions = {
		[1] = { vec3(1363.24,-553.44,74.34), h = 160.46 },
	  },
	  home = 'Middle065'
	},
	[16] = { type = 'home', coords = vec3(1391.82,-573.98,74.34),
	  vehiclePositions = {
		[1] = { vec3(1387.55,-577.93,74.34), h = 109.7 },
	  },
	  home = 'Middle066'
	},
	[17] = { type = 'home', coords = vec3(1383.72,-597.98,74.34),
	  vehiclePositions = {
		[1] = { vec3(1378.11,-596.27,74.34), h = 71.53 },
	  },
	  home = 'Middle067'
	},
	[18] = { type = 'home', coords = vec3(1362.15,-607.42,74.34),
	  vehiclePositions = {
		[1] = { vec3(1359.93,-601.15,74.34), h = 356.32 },
	  },
	  home = 'Middle068'
	},
	[19] = { type = 'home', coords = vec3(1344.59,-609.82,74.36),
	  vehiclePositions = {
		[1] = { vec3(1349.55,-602.16,74.36), h = 335.72 },
	  },
	  home = 'Middle069'
	},
	[20] = { type = 'home', coords = vec3(1318.39,-581.76,73.2),
	  vehiclePositions = {
		[1] = { vec3(1319.17,-574.33,72.93), h = 332.5 },
	  },
	  home = 'Middle070'
	},
	[21] = { type = 'home', coords = vec3(1295.93,-573.53,71.68),
	  vehiclePositions = {
		[1] = { vec3(1295.47,-566.69,71.12), h = 340.58 },
	  },
	  home = 'Middle071'
	},
	[22] = { type = 'home', coords = vec3(24.87,6663.02,31.71),
	  vehiclePositions = {
		[1] = { vec3(21.47,6659.52,31.53), h = 184.62 },
	  },
	  home = 'Middle072'
	},
	[23] = { type = 'home', coords = vec3(-17.95,6650.12,31.15),
	  vehiclePositions = {
		[1] = { vec3(-15.45,6643.66,31.09), h = 206.31 },
	  },
	  home = 'Middle073'
	},
	[24] = { type = 'home', coords = vec3(-48.81,6633.45,30.22),
	  vehiclePositions = {
		[1] = { vec3(-52.44,6621.17,29.93), h = 213.46 },
	  },
	  home = 'Middle074'
	},
	[25] = { type = 'home', coords = vec3(-122.61,6561.92,29.53),
	  vehiclePositions = {
		[1] = { vec3(-115.03,6569.67,29.53), h = 221.33 },
	  },
	  home = 'Middle075'
	},
	[26] = { type = 'home', coords = vec3(-220.5,6436.73,31.2),
	  vehiclePositions = {
		[1] = { vec3(-221.46,6432.58,31.21), h = 223.22 },
	  },
	  home = 'Middle076'
	},
	[27] = { type = 'home', coords = vec3(-253.48,6411.8,31.16),
	  vehiclePositions = {
		[1] = { vec3(-249.66,6406.83,31.16), h = 216.76 },
	  },
	  home = 'Middle077'
	},
	[28] = { type = 'home', coords = vec3(-268.1,6405.85,30.9),
	  vehiclePositions = {
		[1] = { vec3(-262.43,6402.6,30.94), h = 218.15 },
	  },
	  home = 'Middle078'
	},
	[29] = { type = 'home', coords = vec3(-356.65,6337.91,29.85),
	  vehiclePositions = {
		[1] = { vec3(-352.36,6333.03,29.91), h = 219.69 },
	  },
	  home = 'Middle079'
	},
	[30] = { type = 'home', coords = vec3(-403.32,6317.65,28.95),
	  vehiclePositions = {
		[1] = { vec3(-393.41,6308.17,29.27), h = 218.45 },
	  },
	  home = 'Middle080'
	},
	[31] = { type = 'home', coords = vec3(-435.77,6266.8,30.08),
	  vehiclePositions = {
		[1] = { vec3(-427.67,6260.45,30.48), h = 257.5 },
	  },
	  home = 'Middle081'
	},
	[32] = { type = 'home', coords = vec3(-442.85,6204.34,29.56),
	  vehiclePositions = {
		[1] = { vec3(-431.66,6206.85,29.97), h = 284.01 },
	  },
	  home = 'Middle082'
	},
	[33] = { type = 'home', coords = vec3(-4.87,6612.17,31.51),
	  vehiclePositions = {
		[1] = { vec3(-7.3,6619.84,31.34), h = 40.98 },
	  },
	  home = 'Middle083'
	},
	[34] = { type = 'home', coords = vec3(-13.63,6600.15,31.48),
	  vehiclePositions = {
		[1] = { vec3(-16.01,6607.77,31.18), h = 31.23 },
	  },
	  home = 'Middle084'
	},
	[35] = { type = 'home', coords = vec3(-41.39,6582.69,31.37),
	  vehiclePositions = {
		[1] = { vec3(-40.01,6593.17,30.48), h = 37.46 },
	  },
	  home = 'Middle085'
	},
	[36] = { type = 'home', coords = vec3(32.43,6601.99,32.43),
	  vehiclePositions = {
		[1] = { vec3(42.34,6604.89,32.39), h = 224.26 },
	  },
	  home = 'Middle086'
	},
	[37] = { type = 'home', coords = vec3(9.6,6582.18,32.66),
	  vehiclePositions = {
		[1] = { vec3(17.98,6579.74,32.35), h = 222.24 },
	  },
	  home = 'Middle087'
	},
	[38] = { type = 'home', coords = vec3(-15.0,6566.59,31.91),
	  vehiclePositions = {
		[1] = { vec3(-5.62,6557.64,31.98), h = 222.71 },
	  },
	  home = 'Middle088'
	},
	[39] = { type = 'home', coords = vec3(-101.7,6531.62,29.81),
	  vehiclePositions = {
		[1] = { vec3(-107.45,6537.11,29.81), h = 42.94 },
	  },
	  home = 'Middle089'
	},
	[40] = { type = 'home', coords = vec3(-185.0,6412.39,31.92),
	  vehiclePositions = {
		[1] = { vec3(-188.78,6419.57,31.87), h = 44.75 },
	  },
	  home = 'Middle090'
	},
	[41] = { type = 'home', coords = vec3(-202.64,6397.55,31.87),
	  vehiclePositions = {
		[1] = { vec3(-203.6,6403.92,31.87), h = 32.9 },
	  },
	  home = 'Middle091'
	},
	[42] = { type = 'home', coords = vec3(-223.36,6380.76,31.51),
	  vehiclePositions = {
		[1] = { vec3(-223.63,6386.89,31.6), h = 32.06 },
	  },
	  home = 'Middle092'
	},
	[43] = { type = 'home', coords = vec3(-250.25,6355.14,31.5),
	  vehiclePositions = {
		[1] = { vec3(-256.97,6363.19,31.49), h = 39.06 },
	  },
	  home = 'Middle093'
	},
	[44] = { type = 'home', coords = vec3(-272.3,6353.47,32.49),
	  vehiclePositions = {
		[1] = { vec3(-271.07,6359.57,32.1), h = 39.34 },
	  },
	  home = 'Middle094'
	},
	[45] = { type = 'home', coords = vec3(-291.8,6335.98,32.49),
	  vehiclePositions = {
		[1] = { vec3(-296.88,6341.79,31.71), h = 45.26 },
	  },
	  home = 'Middle095'
	},
	[46] = { type = 'home', coords = vec3(-312.44,6309.72,32.48),
	  vehiclePositions = {
		[1] = { vec3(-319.73,6320.07,31.49), h = 43.05 },
	  },
	  home = 'Middle096'
	},
	[47] = { type = 'home', coords = vec3(-358.75,6267.65,31.43),
	  vehiclePositions = {
		[1] = { vec3(-364.09,6278.42,30.36), h = 39.73 },
	  },
	  home = 'Middle097'
	},
	[48] = { type = 'home', coords = vec3(-383.66,6265.98,30.91),
	  vehiclePositions = {
		[1] = { vec3(-385.72,6271.17,30.39), h = 46.31 },
	  },
	  home = 'Middle098'
	},
	[49] = { type = 'home', coords = vec3(-378.11,6186.79,31.5),
	  vehiclePositions = {
		[1] = { vec3(-376.5,6182.08,31.51), h = 220.75 },
	  },
	  home = 'Middle099'
	},
	[50] = { type = 'home', coords = vec3(-363.33,6202.85,31.58),
	  vehiclePositions = {
		[1] = { vec3(-365.71,6197.22,31.49), h = 218.44 },
	  },
	  home = 'Middle100'
	},
	[51] = { type = 'home', coords = vec3(-359.15,6227.23,31.5),
	  vehiclePositions = {
		[1] = { vec3(-351.7,6219.14,31.49), h = 223.16 },
	  },
	  home = 'Middle101'
	},
	[52] = { type = 'home', coords = vec3(2637.13,3288.47,55.26),
	  vehiclePositions = {
		[1] = { vec3(2634.43,3283.33,55.31), h = 231.62 },
	  },
	  home = 'Middle102'
	},
	[53] = { type = 'home', coords = vec3(2615.39,3273.54,55.26),
	  vehiclePositions = {
		[1] = { vec3(2618.83,3268.49,55.25), h = 278.42 },
	  },
	  home = 'Middle103'
	},
	[54] = { type = 'home', coords = vec3(2635.03,3256.1,55.26),
	  vehiclePositions = {
		[1] = { vec3(2640.01,3259.4,55.26), h = 229.5 },
	  },
	  home = 'Middle104'
	},
	[55] = { type = 'home', coords = vec3(-34.08,-1855.71,26.01),
	  vehiclePositions = {
		[1] = { vec3(-27.47,-1850.84,25.73), h = 316.87 },
	  },
	  home = 'Middle105'
	},
	[56] = { type = 'home', coords = vec3(-25.4,-1855.05,25.01),
	  vehiclePositions = {
		[1] = { vec3(-20.93,-1850.23,25.12), h = 318.67 },
	  },
	  home = 'Middle106'
	},
	[57] = { type = 'home', coords = vec3(-3.56,-1877.86,23.82),
	  vehiclePositions = {
		[1] = { vec3(4.02,-1873.88,23.71), h = 318.12 },
	  },
	  home = 'Middle107'
	},
	[58] = { type = 'home', coords = vec3(14.29,-1887.06,23.27),
	  vehiclePositions = {
		[1] = { vec3(18.66,-1882.14,23.0), h = 316.64 },
	  },
	  home = 'Middle108'
	},
	[59] = { type = 'home', coords = vec3(32.45,-1895.73,22.28),
	  vehiclePositions = {
		[1] = { vec3(35.27,-1892.39,22.19), h = 317.8 },
	  },
	  home = 'Middle109'
	},
	[60] = { type = 'home', coords = vec3(39.16,-1920.13,21.78),
	  vehiclePositions = {
		[1] = { vec3(44.15,-1918.04,21.66), h = 319.58 },
	  },
	  home = 'Middle110'
	},
	[61] = { type = 'home', coords = vec3(66.4,-1924.2,21.42),
	  vehiclePositions = {
		[1] = { vec3(68.85,-1920.85,21.3), h = 324.83 },
	  },
	  home = 'Middle111'
	},
	[62] = { type = 'home', coords = vec3(77.0,-1931.84,20.81),
	  vehiclePositions = {
		[1] = { vec3(80.42,-1931.74,20.73), h = 314.64 },
	  },
	  home = 'Middle112'
	},
	[63] = { type = 'home', coords = vec3(80.18,-1946.69,20.87),
	  vehiclePositions = {
		[1] = { vec3(88.56,-1942.23,20.75), h = 299.07 },
	  },
	  home = 'Middle113'
	},
	[64] = { type = 'home', coords = vec3(84.22,-1966.67,20.94),
	  vehiclePositions = {
		[1] = { vec3(91.95,-1963.71,20.75), h = 317.29 },
	  },
	  home = 'Middle114'
	},
	[65] = { type = 'home', coords = vec3(118.57,-1951.21,20.75),
	  vehiclePositions = {
		[1] = { vec3(114.87,-1948.38,20.62), h = 51.65 },
	  },
	  home = 'Middle115'
	},
	[66] = { type = 'home', coords = vec3(122.66,-1937.46,20.76),
	  vehiclePositions = {
		[1] = { vec3(118.16,-1938.61,20.64), h = 57.64 },
	  },
	  home = 'Middle116'
	},
	[67] = { type = 'home', coords = vec3(111.46,-1920.59,20.96),
	  vehiclePositions = {
		[1] = { vec3(109.61,-1925.76,20.76), h = 159.77 },
	  },
	  home = 'Middle117'
	},
	[68] = { type = 'home', coords = vec3(92.12,-1914.29,20.78),
	  vehiclePositions = {
		[1] = { vec3(89.52,-1917.33,20.72), h = 138.58 },
	  },
	  home = 'Middle118'
	},
	[69] = { type = 'home', coords = vec3(58.6,-1878.46,22.38),
	  vehiclePositions = {
		[1] = { vec3(48.82,-1879.91,22.15), h = 138.39 },
	  },
	  home = 'Middle119'
	},
	[70] = { type = 'home', coords = vec3(45.37,-1849.1,22.84),
	  vehiclePositions = {
		[1] = { vec3(37.77,-1856.95,22.84), h = 133.82 },
	  },
	  home = 'Middle120'
	},
	[71] = { type = 'home', coords = vec3(22.98,-1853.34,23.71),
	  vehiclePositions = {
		[1] = { vec3(20.4,-1858.27,23.62), h = 160.57 },
	  },
	  home = 'Middle121'
	},
	[72] = { type = 'home', coords = vec3(11.77,-1843.15,24.53),
	  vehiclePositions = {
		[1] = { vec3(7.88,-1847.1,24.32), h = 139.95 },
	  },
	  home = 'Middle122'
	},
	[73] = { type = 'home', coords = vec3(102.27,-1883.86,24.01),
	  vehiclePositions = {
		[1] = { vec3(106.11,-1879.0,23.94), h = 319.7 },
	  },
	  home = 'Middle123'
	},
	[74] = { type = 'home', coords = vec3(124.59,-1884.73,23.59),
	  vehiclePositions = {
		[1] = { vec3(127.66,-1882.29,23.56), h = 335.1 },
	  },
	  home = 'Middle124'
	},
	[75] = { type = 'home', coords = vec3(137.51,-1897.18,23.43),
	  vehiclePositions = {
		[1] = { vec3(140.88,-1891.59,23.29), h = 334.15 },
	  },
	  home = 'Middle125'
	},
	[76] = { type = 'home', coords = vec3(157.45,-1901.09,23.0),
	  vehiclePositions = {
		[1] = { vec3(161.58,-1897.78,23.01), h = 334.95 },
	  },
	  home = 'Middle126'
	},
	[77] = { type = 'home', coords = vec3(163.73,-1922.71,21.2),
	  vehiclePositions = {
		[1] = { vec3(170.04,-1931.19,21.02), h = 230.23 },
	  },
	  home = 'Middle127'
	},
	[78] = { type = 'home', coords = vec3(163.8,-1954.65,19.33),
	  vehiclePositions = {
		[1] = { vec3(165.55,-1958.39,19.2), h = 231.19 },
	  },
	  home = 'Middle128'
	},
	[79] = { type = 'home', coords = vec3(151.54,-1968.05,18.86),
	  vehiclePositions = {
		[1] = { vec3(154.92,-1967.29,18.59), h = 228.69 },
	  },
	  home = 'Middle129'
	},
	[80] = { type = 'home', coords = vec3(149.24,-1973.67,18.39),
	  vehiclePositions = {
		[1] = { vec3(150.18,-1977.3,18.38), h = 230.13 },
	  },
	  home = 'Middle130'
	},
	[81] = { type = 'home', coords = vec3(201.73,-1894.12,24.45),
	  vehiclePositions = {
		[1] = { vec3(198.77,-1897.79,24.2), h = 140.86 },
	  },
	  home = 'Middle131'
	},
	[82] = { type = 'home', coords = vec3(189.39,-1872.29,24.73),
	  vehiclePositions = {
		[1] = { vec3(185.4,-1880.24,24.43), h = 155.18 },
	  },
	  home = 'Middle132'
	},
	[83] = { type = 'home', coords = vec3(167.8,-1854.05,24.29),
	  vehiclePositions = {
		[1] = { vec3(163.65,-1866.24,24.06), h = 156.03 },
	  },
	  home = 'Middle133'
	},
	[84] = { type = 'home', coords = vec3(140.47,-1866.08,24.33),
	  vehiclePositions = {
		[1] = { vec3(138.42,-1870.22,24.06), h = 154.0 },
	  },
	  home = 'Middle134'
	},
	[85] = { type = 'home', coords = vec3(128.62,-1860.79,24.68),
	  vehiclePositions = {
		[1] = { vec3(123.55,-1861.1,24.81), h = 130.85 },
	  },
	  home = 'Middle135'
	},
	[86] = { type = 'home', coords = vec3(142.58,-1832.44,27.07),
	  vehiclePositions = {
		[1] = { vec3(137.68,-1827.66,27.04), h = 49.46 },
	  },
	  home = 'Middle136'
	},
	[87] = { type = 'home', coords = vec3(209.46,-1728.3,29.32),
	  vehiclePositions = {
		[1] = { vec3(211.61,-1731.96,28.93), h = 205.87 },
	  },
	  home = 'Middle137'
	},
	[88] = { type = 'home', coords = vec3(212.92,-1726.26,29.3),
	  vehiclePositions = {
		[1] = { vec3(214.61,-1729.02,29.01), h = 228.45 },
	  },
	  home = 'Middle138'
	},
	[89] = { type = 'home', coords = vec3(224.78,-1710.83,29.3),
	  vehiclePositions = {
		[1] = { vec3(228.33,-1712.29,29.23), h = 225.75 },
	  },
	  home = 'Middle139'
	},
	[90] = { type = 'home', coords = vec3(240.15,-1698.1,29.27),
	  vehiclePositions = {
		[1] = { vec3(243.07,-1700.42,29.06), h = 240.62 },
	  },
	  home = 'Middle140'
	},
	[91] = { type = 'home', coords = vec3(251.56,-1680.14,29.3),
	  vehiclePositions = {
		[1] = { vec3(254.45,-1684.65,29.16), h = 231.28 },
	  },
	  home = 'Middle141'
	},
	[92] = { type = 'home', coords = vec3(248.35,-1732.71,29.38),
	  vehiclePositions = {
		[1] = { vec3(244.47,-1728.99,29.25), h = 48.8 },
	  },
	  home = 'Middle142'
	},
	[93] = { type = 'home', coords = vec3(261.17,-1719.72,29.28),
	  vehiclePositions = {
		[1] = { vec3(258.73,-1713.86,29.27), h = 48.35 },
	  },
	  home = 'Middle143'
	},
	[94] = { type = 'home', coords = vec3(271.79,-1703.65,29.32),
	  vehiclePositions = {
		[1] = { vec3(267.88,-1699.6,29.25), h = 50.26 },
	  },
	  home = 'Middle144'
	},
	[95] = { type = 'home', coords = vec3(277.61,-1688.87,29.29),
	  vehiclePositions = {
		[1] = { vec3(273.72,-1687.41,29.33), h = 51.04 },
	  },
	  home = 'Middle145'
	},
	[96] = { type = 'home', coords = vec3(311.11,-1735.36,29.54),
	  vehiclePositions = {
		[1] = { vec3(326.02,-1747.83,29.32), h = 229.13 },
	  },
	  home = 'Middle146'
	},
	[97] = { type = 'home', coords = vec3(319.42,-1769.4,29.08),
	  vehiclePositions = {
		[1] = { vec3(322.89,-1772.34,28.69), h = 230.1 },
	  },
	  home = 'Middle147'
	},
	[98] = { type = 'home', coords = vec3(311.73,-1779.93,28.45),
	  vehiclePositions = {
		[1] = { vec3(312.04,-1784.42,28.23), h = 230.87 },
	  },
	  home = 'Middle148'
	},
	[99] = { type = 'home', coords = vec3(291.45,-1784.08,28.04),
	  vehiclePositions = {
		[1] = { vec3(296.81,-1790.98,27.96), h = 227.97 },
	  },
	  home = 'Middle149'
	},
	[100] = { type = 'home', coords = vec3(296.62,-1798.04,27.67),
	  vehiclePositions = {
		[1] = { vec3(302.86,-1803.77,27.49), h = 137.86 },
	  },
	  home = 'Middle150'
	},
	[101] = { type = 'home', coords = vec3(-1744.31,-702.68,10.17),
	  vehiclePositions = {
		[1] = { vec3(-1740.73,-696.99,10.12), h = 228.8 },
	  },
	  home = 'Middle151'
	},
	[102] = { type = 'home', coords = vec3(-1753.52,-695.07,10.16),
	  vehiclePositions = {
		[1] = { vec3(-1749.62,-689.9,10.08), h = 223.1 },
	  },
	  home = 'Middle152'
	},
	[103] = { type = 'home', coords = vec3(-1758.54,-689.49,10.14),
	  vehiclePositions = {
		[1] = { vec3(-1756.93,-683.32,10.08), h = 226.87 },
	  },
	  home = 'Middle153'
	},
	[104] = { type = 'home', coords = vec3(-1768.52,-679.63,10.38),
	  vehiclePositions = {
		[1] = { vec3(-1764.76,-675.18,10.18), h = 221.27 },
	  },
	  home = 'Middle154'
	},
	[105] = { type = 'home', coords = vec3(-1779.07,-669.19,10.44),
	  vehiclePositions = {
		[1] = { vec3(-1775.53,-664.7,10.39), h = 219.83 },
	  },
	  home = 'Middle155'
	},
	[106] = { type = 'home', coords = vec3(-1786.84,-663.27,10.5),
	  vehiclePositions = {
		[1] = { vec3(-1784.06,-655.42,10.41), h = 258.68 },
	  },
	  home = 'Middle156'
	},
	[107] = { type = 'home', coords = vec3(-1798.77,-649.14,10.97),
	  vehiclePositions = {
		[1] = { vec3(-1795.22,-643.88,10.93), h = 216.59 },
	  },
	  home = 'Middle157'
	},
	[108] = { type = 'home', coords = vec3(-1808.32,-644.77,10.94),
	  vehiclePositions = {
		[1] = { vec3(-1804.95,-640.95,10.97), h = 322.27 },
	  },
	  home = 'Middle158'
	},
	[109] = { type = 'home', coords = vec3(-1814.6,-638.87,10.94),
	  vehiclePositions = {
		[1] = { vec3(-1811.21,-635.12,10.95), h = 321.22 },
	  },
	  home = 'Middle159'
	},
	[110] = { type = 'home', coords = vec3(-1828.11,-627.07,11.02),
	  vehiclePositions = {
		[1] = { vec3(-1824.93,-623.31,11.13), h = 323.47 },
	  },
	  home = 'Middle160'
	},
	[111] = { type = 'home', coords = vec3(-1835.17,-618.32,10.98),
	  vehiclePositions = {
		[1] = { vec3(-1831.56,-611.26,11.31), h = 226.24 },
	  },
	  home = 'Middle161'
	},
	[112] = { type = 'home', coords = vec3(-1867.26,-592.63,11.85),
	  vehiclePositions = {
		[1] = { vec3(-1864.23,-588.91,11.67), h = 321.7 },
	  },
	  home = 'Middle162'
	},
	[113] = { type = 'home', coords = vec3(-1874.14,-587.16,11.88),
	  vehiclePositions = {
		[1] = { vec3(-1871.23,-583.24,11.75), h = 322.85 },
	  },
	  home = 'Middle163'
	},
	[114] = { type = 'home', coords = vec3(-1880.89,-581.08,11.86),
	  vehiclePositions = {
		[1] = { vec3(-1879.43,-576.35,11.72), h = 322.15 },
	  },
	  home = 'Middle164'
	},
	[115] = { type = 'home', coords = vec3(-1890.37,-572.97,11.82),
	  vehiclePositions = {
		[1] = { vec3(-1887.25,-569.32,11.74), h = 322.92 },
	  },
	  home = 'Middle165'
	},
	[116] = { type = 'home', coords = vec3(-1902.81,-563.61,11.82),
	  vehiclePositions = {
		[1] = { vec3(-1898.76,-559.47,11.76), h = 323.78 },
	  },
	  home = 'Middle166'
	},
	[117] = { type = 'home', coords = vec3(-1909.27,-553.51,11.84),
	  vehiclePositions = {
		[1] = { vec3(-1905.59,-549.58,11.77), h = 232.98 },
	  },
	  home = 'Middle167'
	},
	[118] = { type = 'home', coords = vec3(-1914.81,-545.92,11.83),
	  vehiclePositions = {
		[1] = { vec3(-1911.9,-543.15,11.79), h = 220.57 },
	  },
	  home = 'Middle168'
	},
	[119] = { type = 'home', coords = vec3(-1935.0,-536.97,11.83),
	  vehiclePositions = {
		[1] = { vec3(-1931.52,-532.96,11.84), h = 320.77 },
	  },
	  home = 'Middle169'
	},
	[120] = { type = 'home', coords = vec3(-1941.28,-532.1,11.86),
	  vehiclePositions = {
		[1] = { vec3(-1937.67,-527.72,11.85), h = 321.6 },
	  },
	  home = 'Middle170'
	},
	[121] = { type = 'home', coords = vec3(-1947.51,-525.56,11.84),
	  vehiclePositions = {
		[1] = { vec3(-1942.86,-519.27,11.86), h = 228.79 },
	  },
	  home = 'Middle171'
	},
	[122] = { type = 'home', coords = vec3(-1955.56,-517.8,11.93),
	  vehiclePositions = {
		[1] = { vec3(-1951.63,-512.08,11.86), h = 233.44 },
	  },
	  home = 'Middle172'
	},
	[123] = { type = 'home', coords = vec3(-1963.47,-511.88,11.84),
	  vehiclePositions = {
		[1] = { vec3(-1959.04,-506.22,11.85), h = 228.55 },
	  },
	  home = 'Middle173'
	},
	[124] = { type = 'home', coords = vec3(-1969.16,-503.96,11.85),
	  vehiclePositions = {
		[1] = { vec3(-1965.7,-499.7,11.81), h = 229.48 },
	  },
	  home = 'Middle174'
	},
	[125] = { type = 'home', coords = vec3(-3085.46,217.94,14.0),
	  vehiclePositions = {
		[1] = { vec3(-3083.49,224.65,14.03), h = 326.76 },
	  },
	  home = 'Middle175'
	},
	[126] = { type = 'home', coords = vec3(-3106.48,249.58,12.5),
	  vehiclePositions = {
		[1] = { vec3(-3100.11,249.76,12.03), h = 226.91 },
	  },
	  home = 'Middle176'
	},
	[127] = { type = 'home', coords = vec3(-3105.03,290.07,8.98),
	  vehiclePositions = {
		[1] = { vec3(-3100.73,285.85,9.08), h = 195.05 },
	  },
	  home = 'Middle177'
	},
	[128] = { type = 'home', coords = vec3(-3101.38,308.09,8.39),
	  vehiclePositions = {
		[1] = { vec3(-3095.66,305.91,8.28), h = 251.33 },
	  },
	  home = 'Middle178'
	},
	[129] = { type = 'home', coords = vec3(-3094.0,324.45,7.5),
	  vehiclePositions = {
		[1] = { vec3(-3089.78,322.1,7.54), h = 192.18 },
	  },
	  home = 'Middle179'
	},
	[130] = { type = 'home', coords = vec3(-3093.64,341.73,7.47),
	  vehiclePositions = {
		[1] = { vec3(-3086.41,339.98,7.37), h = 254.11 },
	  },
	  home = 'Middle180'
	},
	[131] = { type = 'home', coords = vec3(-3083.45,371.95,7.13),
	  vehiclePositions = {
		[1] = { vec3(-3078.58,370.49,7.13), h = 254.57 },
	  },
	  home = 'Middle181'
	},
	[132] = { type = 'home', coords = vec3(-3078.15,393.05,6.97),
	  vehiclePositions = {
		[1] = { vec3(-3072.87,393.07,6.97), h = 251.49 },
	  },
	  home = 'Middle182'
	},
	[133] = { type = 'home', coords = vec3(-3058.28,447.7,6.37),
	  vehiclePositions = {
		[1] = { vec3(-3052.3,444.74,6.37), h = 242.76 },
	  },
	  home = 'Middle183'
	},
	[134] = { type = 'home', coords = vec3(-3042.76,479.37,6.78),
	  vehiclePositions = {
		[1] = { vec3(-3036.53,477.38,6.73), h = 264.51 },
	  },
	  home = 'Middle184'
	},
	[135] = { type = 'home', coords = vec3(-3035.16,498.72,6.77),
	  vehiclePositions = {
		[1] = { vec3(-3030.43,497.68,6.83), h = 264.2 },
	  },
	  home = 'Middle185'
	},
	[136] = { type = 'home', coords = vec3(-3031.41,529.55,7.43),
	  vehiclePositions = {
		[1] = { vec3(-3027.2,528.6,7.39), h = 271.21 },
	  },
	  home = 'Middle186'
	},
	[137] = { type = 'home', coords = vec3(-3035.91,548.35,7.51),
	  vehiclePositions = {
		[1] = { vec3(-3031.29,547.87,7.51), h = 277.03 },
	  },
	  home = 'Middle187'
	},
	[138] = { type = 'home', coords = vec3(-3035.66,555.29,7.51),
	  vehiclePositions = {
		[1] = { vec3(-3030.74,555.74,7.51), h = 274.53 },
	  },
	  home = 'Middle188'
	},
	[139] = { type = 'home', coords = vec3(-3030.24,572.88,7.83),
	  vehiclePositions = {
		[1] = { vec3(-3026.26,573.14,7.66), h = 188.06 },
	  },
	  home = 'Middle189'
	},
	[140] = { type = 'home', coords = vec3(-3075.33,655.14,11.62),
	  vehiclePositions = {
		[1] = { vec3(-3071.06,658.68,10.73), h = 312.8 },
	  },
	  home = 'Middle190'
	},
	[141] = { type = 'home', coords = vec3(-3104.8,715.79,20.53),
	  vehiclePositions = {
		[1] = { vec3(-3101.12,716.41,20.47), h = 283.5 },
	  },
	  home = 'Middle191'
	},
	[142] = { type = 'home', coords = vec3(-3098.65,747.2,21.29),
	  vehiclePositions = {
		[1] = { vec3(-3094.75,743.96,20.98), h = 137.13 },
	  },
	  home = 'Middle192'
	},
	[143] = { type = 'home', coords = vec3(406.07,-1742.19,29.34),
	  vehiclePositions = {
		[1] = { vec3(403.69,-1738.57,29.3), h = 48.16 },
	  },
	  home = 'Middle193'
	},
	[144] = { type = 'home', coords = vec3(436.47,-1739.43,29.22),
	  vehiclePositions = {
		[1] = { vec3(425.59,-1730.65,29.25), h = 47.97 },
	  },
	  home = 'Middle194'
	},
	[145] = { type = 'home', coords = vec3(433.9,-1716.6,29.31),
	  vehiclePositions = {
		[1] = { vec3(429.6,-1712.42,29.29), h = 49.76 },
	  },
	  home = 'Middle195'
	},
	[146] = { type = 'home', coords = vec3(442.83,-1698.34,29.37),
	  vehiclePositions = {
		[1] = { vec3(440.34,-1694.4,29.25), h = 50.35 },
	  },
	  home = 'Middle196'
	},
	[147] = { type = 'home', coords = vec3(494.06,-1699.88,29.41),
	  vehiclePositions = {
		[1] = { vec3(499.77,-1704.09,29.33), h = 236.63 },
	  },
	  home = 'Middle197'
	},
	[148] = { type = 'home', coords = vec3(479.15,-1717.91,29.37),
	  vehiclePositions = {
		[1] = { vec3(488.66,-1721.82,29.37), h = 250.35 },
	  },
	  home = 'Middle198'
	},
	[149] = { type = 'home', coords = vec3(464.68,-1740.62,29.11),
	  vehiclePositions = {
		[1] = { vec3(473.78,-1743.73,28.94), h = 248.77 },
	  },
	  home = 'Middle199'
	},
	[150] = { type = 'home', coords = vec3(482.83,-1752.64,28.59),
	  vehiclePositions = {
		[1] = { vec3(489.79,-1758.27,28.48), h = 161.4 },
	  },
	  home = 'Middle200'
	},
	[151] = { type = 'home', coords = vec3(479.12,-1792.29,28.57),
	  vehiclePositions = {
		[1] = { vec3(482.23,-1796.22,28.49), h = 230.39 },
	  },
	  home = 'Middle201'
	},
	[152] = { type = 'home', coords = vec3(487.76,-1826.69,28.53),
	  vehiclePositions = {
		[1] = { vec3(482.44,-1822.25,27.94), h = 50.43 },
	  },
	  home = 'Middle202'
	},
	[153] = { type = 'home', coords = vec3(504.76,-1799.11,28.49),
	  vehiclePositions = {
		[1] = { vec3(499.77,-1800.43,28.45), h = 65.3 },
	  },
	  home = 'Middle203'
	},
	[154] = { type = 'home', coords = vec3(507.32,-1793.6,28.51),
	  vehiclePositions = {
		[1] = { vec3(503.42,-1791.25,28.52), h = 29.78 },
	  },
	  home = 'Middle204'
	},
	[155] = { type = 'home', coords = vec3(505.93,-1775.35,28.5),
	  vehiclePositions = {
		[1] = { vec3(498.98,-1781.28,28.48), h = 19.15 },
	  },
	  home = 'Middle205'
	},
	[156] = { type = 'home', coords = vec3(431.93,-1828.88,28.18),
	  vehiclePositions = {
		[1] = { vec3(438.23,-1838.46,27.92), h = 223.54 },
	  },
	  home = 'Middle206'
	},
	[157] = { type = 'home', coords = vec3(431.98,-1838.05,28.07),
	  vehiclePositions = {
		[1] = { vec3(436.78,-1843.57,27.85), h = 225.23 },
	  },
	  home = 'Middle207'
	},
	[158] = { type = 'home', coords = vec3(395.06,-1844.79,26.84),
	  vehiclePositions = {
		[1] = { vec3(404.6,-1859.39,26.79), h = 221.34 },
	  },
	  home = 'Middle208'
	},
	[159] = { type = 'home', coords = vec3(395.89,-1873.71,26.24),
	  vehiclePositions = {
		[1] = { vec3(401.57,-1880.01,25.84), h = 222.74 },
	  },
	  home = 'Middle209'
	},
	[160] = { type = 'home', coords = vec3(384.98,-1890.88,25.31),
	  vehiclePositions = {
		[1] = { vec3(386.36,-1895.77,24.98), h = 223.73 },
	  },
	  home = 'Middle210'
	},
	[161] = { type = 'home', coords = vec3(353.04,-1893.36,24.99),
	  vehiclePositions = {
		[1] = { vec3(362.98,-1902.21,24.79), h = 226.01 },
	  },
	  home = 'Middle211'
	},
	[162] = { type = 'home', coords = vec3(308.9,-1855.8,26.93),
	  vehiclePositions = {
		[1] = { vec3(307.06,-1852.38,26.92), h = 51.3 },
	  },
	  home = 'Middle212'
	},
	[163] = { type = 'home', coords = vec3(338.74,-1840.5,27.35),
	  vehiclePositions = {
		[1] = { vec3(331.64,-1832.05,27.5), h = 45.44 },
	  },
	  home = 'Middle213'
	},
	[164] = { type = 'home', coords = vec3(340.04,-1822.63,27.99),
	  vehiclePositions = {
		[1] = { vec3(336.44,-1819.12,27.9), h = 48.26 },
	  },
	  home = 'Middle214'
	},
	[165] = { type = 'home', coords = vec3(350.25,-1811.39,28.81),
	  vehiclePositions = {
		[1] = { vec3(345.57,-1807.84,28.37), h = 51.25 },
	  },
	  home = 'Middle215'
	},
	[166] = { type = 'home', coords = vec3(308.62,-1936.97,24.84),
	  vehiclePositions = {
		[1] = { vec3(317.73,-1944.38,24.65), h = 229.38 },
	  },
	  home = 'Middle216'
	},
	[167] = { type = 'home', coords = vec3(310.7,-1965.89,23.74),
	  vehiclePositions = {
		[1] = { vec3(314.22,-1968.16,23.59), h = 227.76 },
	  },
	  home = 'Middle217'
	},
	[168] = { type = 'home', coords = vec3(305.06,-1973.91,22.72),
	  vehiclePositions = {
		[1] = { vec3(308.27,-1976.73,22.62), h = 231.41 },
	  },
	  home = 'Middle218'
	},
	[169] = { type = 'home', coords = vec3(282.96,-1980.34,21.4),
	  vehiclePositions = {
		[1] = { vec3(289.19,-1988.21,21.14), h = 228.21 },
	  },
	  home = 'Middle219'
	},
	[170] = { type = 'home', coords = vec3(280.68,-2002.42,20.23),
	  vehiclePositions = {
		[1] = { vec3(283.82,-2005.55,20.2), h = 231.44 },
	  },
	  home = 'Middle220'
	},
	[171] = { type = 'home', coords = vec3(268.88,-2013.73,19.5),
	  vehiclePositions = {
		[1] = { vec3(272.4,-2017.28,19.27), h = 229.91 },
	  },
	  home = 'Middle221'
	},
	[172] = { type = 'home', coords = vec3(250.79,-2037.81,18.09),
	  vehiclePositions = {
		[1] = { vec3(254.14,-2039.95,18.06), h = 233.01 },
	  },
	  home = 'Middle222'
	},
	[173] = { type = 'home', coords = vec3(247.03,-2043.25,17.98),
	  vehiclePositions = {
		[1] = { vec3(250.31,-2045.97,17.85), h = 232.6 },
	  },
	  home = 'Middle223'
	},
	[174] = { type = 'home', coords = vec3(241.34,-1936.6,23.86),
	  vehiclePositions = {
		[1] = { vec3(242.65,-1931.57,24.21), h = 51.31 },
	  },
	  home = 'Middle224'
	},
	[175] = { type = 'home', coords = vec3(257.68,-1917.32,25.56),
	  vehiclePositions = {
		[1] = { vec3(254.92,-1914.94,25.48), h = 50.27 },
	  },
	  home = 'Middle225'
	},
	[176] = { type = 'home', coords = vec3(273.15,-1908.07,26.48),
	  vehiclePositions = {
		[1] = { vec3(267.58,-1903.68,26.44), h = 50.32 },
	  },
	  home = 'Middle226'
	},
	[177] = { type = 'home', coords = vec3(274.49,-1897.65,26.8),
	  vehiclePositions = {
		[1] = { vec3(268.34,-1891.35,26.68), h = 320.1 },
	  },
	  home = 'Middle227'
	},
	[178] = { type = 'home', coords = vec3(7.62,-1449.82,30.55),
	  vehiclePositions = {
		[1] = { vec3(6.67,-1454.59,30.45), h = 167.08 },
	  },
	  home = 'Middle228'
	},
	[179] = { type = 'home', coords = vec3(0.94,-1449.9,30.55),
	  vehiclePositions = {
		[1] = { vec3(-0.26,-1453.34,30.47), h = 180.84 },
	  },
	  home = 'Middle229'
	},
	[180] = { type = 'home', coords = vec3(-22.89,-1431.49,30.66),
	  vehiclePositions = {
		[1] = { vec3(-24.33,-1439.25,30.66), h = 176.67 },
	  },
	  home = 'Middle230'
	},
	[181] = { type = 'home', coords = vec3(-38.63,-1442.67,31.5),
	  vehiclePositions = {
		[1] = { vec3(-38.25,-1449.53,31.52), h = 180.69 },
	  },
	  home = 'Middle231'
	},
	[182] = { type = 'home', coords = vec3(-53.0,-1452.84,32.07),
	  vehiclePositions = {
		[1] = { vec3(-52.74,-1457.88,32.0), h = 186.14 },
	  },
	  home = 'Middle232'
	},
	[183] = { type = 'home', coords = vec3(-68.98,-1457.87,32.12),
	  vehiclePositions = {
		[1] = { vec3(-67.0,-1461.67,32.01), h = 200.28 },
	  },
	  home = 'Middle233'
	},
	[184] = { type = 'home', coords = vec3(1278.02,-1605.18,54.23),
	  vehiclePositions = {
		[1] = { vec3(1271.36,-1607.83,53.95), h = 27.44 },
	  },
	  home = 'Middle234'
	},
	[185] = { type = 'home', coords = vec3(1256.56,-1618.27,53.28),
	  vehiclePositions = {
		[1] = { vec3(1251.66,-1617.82,53.43), h = 27.61 },
	  },
	  home = 'Middle235'
	},
	[186] = { type = 'home', coords = vec3(1237.43,-1627.69,51.98),
	  vehiclePositions = {
		[1] = { vec3(1235.08,-1626.86,51.7), h = 24.51 },
	  },
	  home = 'Middle236'
	},
	[187] = { type = 'home', coords = vec3(1207.84,-1637.26,46.33),
	  vehiclePositions = {
		[1] = { vec3(1205.54,-1634.57,45.82), h = 116.64 },
	  },
	  home = 'Middle237'
	},
	[188] = { type = 'home', coords = vec3(1190.59,-1649.08,41.46),
	  vehiclePositions = {
		[1] = { vec3(1186.84,-1647.39,40.78), h = 128.65 },
	  },
	  home = 'Middle238'
	},
	[189] = { type = 'home', coords = vec3(1195.08,-1631.37,43.96),
	  vehiclePositions = {
		[1] = { vec3(1194.58,-1635.35,43.54), h = 121.18 },
	  },
	  home = 'Middle239'
	},
	[190] = { type = 'home', coords = vec3(1215.85,-1617.29,48.72),
	  vehiclePositions = {
		[1] = { vec3(1218.33,-1620.86,48.89), h = 115.89 },
	  },
	  home = 'Middle240'
	},
	[191] = { type = 'home', coords = vec3(1239.32,-1600.88,52.74),
	  vehiclePositions = {
		[1] = { vec3(1243.5,-1605.88,53.01), h = 117.48 },
	  },
	  home = 'Middle241'
	},
	[192] = { type = 'home', coords = vec3(1320.82,-1539.35,50.21),
	  vehiclePositions = {
		[1] = { vec3(1321.16,-1541.97,50.44), h = 101.03 },
	  },
	  home = 'Middle242'
	},
	[193] = { type = 'home', coords = vec3(1339.67,-1533.14,53.16),
	  vehiclePositions = {
		[1] = { vec3(1339.8,-1538.73,52.78), h = 86.66 },
	  },
	  home = 'Middle243'
	},
	[194] = { type = 'home', coords = vec3(1371.25,-1517.71,57.67),
	  vehiclePositions = {
		[1] = { vec3(1373.47,-1523.71,56.94), h = 188.45 },
	  },
	  home = 'Middle244'
	},
	[195] = { type = 'home', coords = vec3(1423.45,-1501.53,60.96),
	  vehiclePositions = {
		[1] = { vec3(1421.47,-1506.53,60.88), h = 157.49 },
	  },
	  home = 'Middle245'
	},
	[196] = { type = 'home', coords = vec3(1398.27,-1536.68,57.89),
	  vehiclePositions = {
		[1] = { vec3(1394.58,-1532.17,57.48), h = 40.81 },
	  },
	  home = 'Middle246'
	},
	[197] = { type = 'home', coords = vec3(1357.45,-1547.59,54.68),
	  vehiclePositions = {
		[1] = { vec3(1356.5,-1543.02,54.58), h = 95.77 },
	  },
	  home = 'Middle247'
	},
	[198] = { type = 'home', coords = vec3(1339.03,-1551.34,53.4),
	  vehiclePositions = {
		[1] = { vec3(1336.04,-1547.52,52.6), h = 39.97 },
	  },
	  home = 'Middle248'
	},
	[199] = { type = 'home', coords = vec3(1349.97,-1571.74,54.06),
	  vehiclePositions = {
		[1] = { vec3(1353.95,-1577.84,53.82), h = 216.0 },
	  },
	  home = 'Middle249'
	},
	[200] = { type = 'home', coords = vec3(1366.25,-1708.69,62.35),
	  vehiclePositions = {
		[1] = { vec3(1365.47,-1705.03,62.03), h = 95.21 },
	  },
	  home = 'Middle250'
	},
	[201] = { type = 'home', coords = vec3(1332.44,-1737.29,56.3),
	  vehiclePositions = {
		[1] = { vec3(1331.85,-1729.27,56.09), h = 15.71 },
	  },
	  home = 'Middle251'
	},
	[202] = { type = 'home', coords = vec3(1300.3,-1738.92,53.88),
	  vehiclePositions = {
		[1] = { vec3(1299.01,-1733.65,53.89), h = 24.81 },
	  },
	  home = 'Middle252'
	},
	[203] = { type = 'home', coords = vec3(1253.27,-1752.42,47.38),
	  vehiclePositions = {
		[1] = { vec3(1252.05,-1749.3,47.43), h = 116.28 },
	  },
	  home = 'Middle253'
	},
	[204] = { type = 'home', coords = vec3(1247.2,-1746.24,46.85),
	  vehiclePositions = {
		[1] = { vec3(1244.66,-1749.49,46.16), h = 113.94 },
	  },
	  home = 'Middle254'
	},
	[205] = { type = 'home', coords = vec3(1299.9,-1699.85,55.14),
	  vehiclePositions = {
		[1] = { vec3(1304.48,-1711.55,54.84), h = 200.16 },
	  },
	  home = 'Middle255'
	},
	[206] = { type = 'home', coords = vec3(1325.13,-1708.34,55.55),
	  vehiclePositions = {
		[1] = { vec3(1324.06,-1711.11,55.46), h = 105.95 },
	  },
	  home = 'Middle256'
	},
	[207] = { type = 'home', coords = vec3(1356.72,-1695.52,60.52),
	  vehiclePositions = {
		[1] = { vec3(1360.25,-1702.14,60.96), h = 98.34 },
	  },
	  home = 'Middle257'
	},
	[208] = { type = 'home', coords = vec3(1346.93,-1760.9,60.49),
	  vehiclePositions = {
		[1] = { vec3(1351.27,-1773.04,60.22), h = 100.05 },
	  },
	  home = 'Middle258'
	},
	[209] = { type = 'home', coords = vec3(1270.64,-475.73,69.29),
	  vehiclePositions = {
		[1] = { vec3(1279.73,-478.6,69.02), h = 155.91 },
	  },
	  home = 'Middle059'
	},
	[210] = { type = 'home', coords = vec3(1251.32,-490.43,69.5),
	  vehiclePositions = {
		[1] = { vec3(1260.41,-493.59,69.42), h = 256.59 },
	  },
	  home = 'Middle058'
	},
	[211] = { type = 'home', coords = vec3(1249.02,-519.64,69.0),
	  vehiclePositions = {
		[1] = { vec3(1248.57,-522.9,68.98), h = 257.31 },
	  },
	  home = 'Middle057'
	},
	[212] = { type = 'home', coords = vec3(1259.79,-711.25,64.51),
	  vehiclePositions = {
		[1] = { vec3(1264.3,-716.27,64.48), h = 236.66 },
	  },
	  home = 'Middle056'
	},
	[213] = { type = 'home', coords = vec3(1267.41,-673.35,65.75),
	  vehiclePositions = {
		[1] = { vec3(1277.07,-672.52,66.0), h = 275.02 },
	  },
	  home = 'Middle055'
	},
	[214] = { type = 'home', coords = vec3(1269.49,-654.19,67.85),
	  vehiclePositions = {
		[1] = { vec3(1276.93,-656.6,67.65), h = 291.96 },
	  },
	  home = 'Middle054'
	},
	[215] = { type = 'home', coords = vec3(1250.42,-626.07,69.35),
	  vehiclePositions = {
		[1] = { vec3(1258.65,-622.94,69.4), h = 297.12 },
	  },
	  home = 'Middle053'
	},
	[216] = { type = 'home', coords = vec3(1240.57,-589.71,69.44),
	  vehiclePositions = {
		[1] = { vec3(1245.77,-586.0,69.23), h = 266.76 },
	  },
	  home = 'Middle052'
	},
	[217] = { type = 'home', coords = vec3(1237.45,-575.94,69.49),
	  vehiclePositions = {
		[1] = { vec3(1245.14,-578.4,69.3), h = 265.07 },
	  },
	  home = 'Middle051'
	},
	[218] = { type = 'home', coords = vec3(1191.71,-552.87,64.71),
	  vehiclePositions = {
		[1] = { vec3(1185.96,-553.48,64.51), h = 38.24 },
	  },
	  home = 'Middle050'
	},
	[219] = { type = 'home', coords = vec3(1189.77,-573.45,64.33),
	  vehiclePositions = {
		[1] = { vec3(1182.01,-573.08,64.25), h = 356.16 },
	  },
	  home = 'Middle049'
	},
	[220] = { type = 'home', coords = vec3(1192.49,-597.04,64.01),
	  vehiclePositions = {
		[1] = { vec3(1184.71,-596.52,63.95), h = 5.25 },
	  },
	  home = 'Middle048'
	},
	[221] = { type = 'home', coords = vec3(1206.55,-612.45,66.12),
	  vehiclePositions = {
		[1] = { vec3(1199.41,-613.07,64.78), h = 94.81 },
	  },
	  home = 'Middle047'
	},
	[222] = { type = 'home', coords = vec3(1220.91,-664.17,63.13),
	  vehiclePositions = {
		[1] = { vec3(1213.18,-666.15,62.4), h = 99.8 },
	  },
	  home = 'Middle046'
	},
	[223] = { type = 'home', coords = vec3(1228.37,-703.67,60.68),
	  vehiclePositions = {
		[1] = { vec3(1220.29,-704.5,60.67), h = 94.82 },
	  },
	  home = 'Middle045'
	},
	[224] = { type = 'home', coords = vec3(1225.07,-723.01,60.65),
	  vehiclePositions = {
		[1] = { vec3(1222.88,-731.03,59.94), h = 132.11 },
	  },
	  home = 'Middle044'
	},
	[225] = { type = 'home', coords = vec3(1113.65,-396.89,68.46),
	  vehiclePositions = {
		[1] = { vec3(1101.42,-398.39,67.43), h = 75.65 },
	  },
	  home = 'Middle043'
	},
	[226] = { type = 'home', coords = vec3(1101.53,-416.65,67.17),
	  vehiclePositions = {
		[1] = { vec3(1095.2,-418.09,67.15), h = 84.23 },
	  },
	  home = 'Middle042'
	},
	[227] = { type = 'home', coords = vec3(1103.29,-429.58,67.4),
	  vehiclePositions = {
		[1] = { vec3(1096.36,-428.67,67.2), h = 79.85 },
	  },
	  home = 'Middle041'
	},
	[228] = { type = 'home', coords = vec3(1098.05,-469.15,67.06),
	  vehiclePositions = {
		[1] = { vec3(1090.01,-471.26,65.73), h = 77.97 },
	  },
	  home = 'Middle040'
	},
	[229] = { type = 'home', coords = vec3(1089.56,-495.4,65.07),
	  vehiclePositions = {
		[1] = { vec3(1082.24,-495.13,63.32), h = 75.74 },
	  },
	  home = 'Middle039'
	},
	[230] = { type = 'home', coords = vec3(956.89,-546.74,59.53),
	  vehiclePositions = {
		[1] = { vec3(958.15,-552.19,59.28), h = 206.35 },
	  },
	  home = 'Middle038'
	},
	[231] = { type = 'home', coords = vec3(982.29,-530.7,60.12),
	  vehiclePositions = {
		[1] = { vec3(983.1,-535.77,60.02), h = 209.94 },
	  },
	  home = 'Middle037'
	},
	[232] = { type = 'home', coords = vec3(1001.42,-510.43,60.7),
	  vehiclePositions = {
		[1] = { vec3(1006.19,-520.45,60.72), h = 202.46 },
	  },
	  home = 'Middle036'
	},
	[233] = { type = 'home', coords = vec3(1042.35,-489.75,63.9),
	  vehiclePositions = {
		[1] = { vec3(1051.98,-488.39,63.92), h = 257.2 },
	  },
	  home = 'Middle035'
	},
	[234] = { type = 'home', coords = vec3(1052.13,-467.76,63.93),
	  vehiclePositions = {
		[1] = { vec3(1059.32,-471.58,64.24), h = 246.45 },
	  },
	  home = 'Middle034'
	},
	[235] = { type = 'home', coords = vec3(1054.74,-445.44,65.97),
	  vehiclePositions = {
		[1] = { vec3(1063.73,-445.94,65.82), h = 255.73 },
	  },
	  home = 'Middle033'
	},
	[236] = { type = 'home', coords = vec3(1021.1,-465.84,63.91),
	  vehiclePositions = {
		[1] = { vec3(1019.12,-460.01,63.98), h = 35.33 },
	  },
	  home = 'Middle032'
	},
	[237] = { type = 'home', coords = vec3(965.26,-505.83,61.74),
	  vehiclePositions = {
		[1] = { vec3(960.98,-500.55,61.41), h = 42.45 },
	  },
	  home = 'Middle031'
	},
	[238] = { type = 'home', coords = vec3(959.38,-600.85,59.5),
	  vehiclePositions = {
		[1] = { vec3(954.79,-598.68,59.38), h = 22.71 },
	  },
	  home = 'Middle023'
	},
	[239] = { type = 'home', coords = vec3(981.26,-614.68,58.84),
	  vehiclePositions = {
		[1] = { vec3(974.21,-619.59,58.84), h = 123.58 },
	  },
	  home = 'Middle022'
	},
	[240] = { type = 'home', coords = vec3(1054.41,-384.43,67.86),
	  vehiclePositions = {
		[1] = { vec3(1057.85,-388.2,67.86), h = 219.22 },
	  },
	  home = 'Middle021'
	},
	[241] = { type = 'home', coords = vec3(1008.6,-414.9,64.96),
	  vehiclePositions = {
		[1] = { vec3(1014.45,-421.84,64.99), h = 216.15 },
	  },
	  home = 'Middle019'
	},
	[242] = { type = 'home', coords = vec3(987.64,-438.05,63.75),
	  vehiclePositions = {
		[1] = { vec3(996.74,-435.44,64.02), h = 244.51 },
	  },
	  home = 'Middle018'
	},
	[243] = { type = 'home', coords = vec3(971.45,-447.99,62.41),
	  vehiclePositions = {
		[1] = { vec3(975.24,-452.18,62.41), h = 212.5 },
	  },
	  home = 'Middle017'
	},
	[244] = { type = 'home', coords = vec3(939.24,-463.14,61.26),
	  vehiclePositions = {
		[1] = { vec3(944.91,-472.23,61.26), h = 208.92 },
	  },
	  home = 'Middle016'
	},
	[245] = { type = 'home', coords = vec3(930.58,-474.79,60.71),
	  vehiclePositions = {
		[1] = { vec3(933.11,-479.86,60.69), h = 206.56 },
	  },
	  home = 'Middle015'
	},
	[246] = { type = 'home', coords = vec3(910.73,-486.57,59.07),
	  vehiclePositions = {
		[1] = { vec3(915.3,-492.06,58.97), h = 203.06 },
	  },
	  home = 'Middle014'
	},
	[247] = { type = 'home', coords = vec3(871.85,-503.93,57.5),
	  vehiclePositions = {
		[1] = { vec3(875.86,-507.71,57.48), h = 229.21 },
	  },
	  home = 'Middle013'
	},
	[248] = { type = 'home', coords = vec3(1004.33,-734.26,57.46),
	  vehiclePositions = {
		[1] = { vec3(1008.3,-730.18,57.65), h = 306.26 },
	  },
	  home = 'Middle001'
	},
	[249] = { type = 'home', coords = vec3(976.19,-714.05,57.87),
	  vehiclePositions = {
		[1] = { vec3(983.81,-708.67,57.55), h = 307.24 },
	  },
	  home = 'Middle002'
	},
	[250] = { type = 'home', coords = vec3(969.79,-688.35,57.95),
	  vehiclePositions = {
		[1] = { vec3(972.39,-685.82,57.74), h = 303.9 },
	  },
	  home = 'Middle003'
	},
	[251] = { type = 'home', coords = vec3(940.19,-672.29,58.02),
	  vehiclePositions = {
		[1] = { vec3(949.07,-667.72,58.02), h = 300.81 },
	  },
	  home = 'Middle004'
	},
	[252] = { type = 'home', coords = vec3(946.66,-657.1,58.02),
	  vehiclePositions = {
		[1] = { vec3(951.42,-653.09,57.91), h = 310.01 },
	  },
	  home = 'Middle005'
	},
	[253] = { type = 'home', coords = vec3(913.02,-645.1,57.87),
	  vehiclePositions = {
		[1] = { vec3(922.69,-633.87,57.87), h = 316.18 },
	  },
	  home = 'Middle006'
	},
	[254] = { type = 'home', coords = vec3(912.24,-631.41,58.05),
	  vehiclePositions = {
		[1] = { vec3(917.86,-624.98,58.05), h = 316.07 },
	  },
	  home = 'Middle007'
	},
	[255] = { type = 'home', coords = vec3(870.07,-602.9,58.23),
	  vehiclePositions = {
		[1] = { vec3(877.5,-594.83,58.02), h = 317.35 },
	  },
	  home = 'Middle008'
	},
	[256] = { type = 'home', coords = vec3(868.65,-594.19,58.3),
	  vehiclePositions = {
		[1] = { vec3(873.31,-588.95,57.84), h = 319.72 },
	  },
	  home = 'Middle009'
	},
	[257] = { type = 'home', coords = vec3(842.03,-567.46,57.71),
	  vehiclePositions = {
		[1] = { vec3(854.11,-565.59,57.68), h = 275.8 },
	  },
	  home = 'Middle010'
	},
	[258] = { type = 'home', coords = vec3(843.47,-541.29,57.33),
	  vehiclePositions = {
		[1] = { vec3(854.11,-542.38,57.33), h = 262.0 },
	  },
	  home = 'Middle011'
	},
	[259] = { type = 'home', coords = vec3(-1581.21,-81.11,54.15),
	  vehiclePositions = {
		[1] = { vec3(-1573.06,-80.68,54.14), h = 273.15	},
	  },
	  home = 'Middle260'
	},
}
-----------------------------------------------------------------
-----------------------------------------------------------------



--------------------------------------------------------------------------------
-- função para checar se o player é dono da casa para poder acessar à garagem --
--------------------------------------------------------------------------------
--[[ config.hasHome = function(source,user_id,home)
	local address = vRP.getUserAddress(user_id)
	if address and #address > 0 then
		for i in ipairs(address) do 
			if address[i].home == home then
				return true
			end
		end
	end
	TriggerClientEvent("Notify",source,"negado","Você não tem acesso à essa residência.",3000)
	return false
end ]]

config.hasHome = function(source,user_id,home)
	local address = vRP.query("vRP/get_homeuserid",{ user_id = user_id })
	if address and #address > 0 then
		for i in ipairs(address) do 
			if address[i].home == home then
				return true
			end
		end
	end
	TriggerClientEvent("Notify",source,"negado","Você não tem acesso à essa residência.",3000)
	return false
end
  

--[[ 


-- funcao executada sempre que puxar um veiculo

config.payTax = function(source,user_id,vehicle)
	if source and user_id and vehicle then
		local vehInfo = config.getVehicleInfo(vehicle)
		if vehInfo then
			local tipo = vehInfo.tipo
			if (tipo == "exclusive" and vRP.hasPermission(user_id,"naopagaipva.permissao")) or tipo == "rental" then
				TriggerClientEvent("Notify",source,"bom","Veículo <b>Exclusivo (com o vip ativo) ou Alugado</b>, Não será cobrado a taxa de liberação.",10000)
				return true
			elseif tipo ~= "exclusive" then
				local price = vehInfo.price
				local payment = price * 0.005
				if vRP.tryFullPayment(user_id,payment) then
					return true
				else
					TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente",10000)
				end
			end
		end
	end
	return false
end
  

-- funcao executada sempre que abrir a garagem

config.checkOpenGarage = function(source,user_id)
	if vRP.searchReturn(source,user_id) then
		return false
	end
	return true
end
 ]]



 -- funcao de cobrar a taxa de detido / desmanche / ipva

config.checkTax = function(source,user_id,vehicle,type, garage, home)
    local vehicleInfo = vRP.query("vRP/getVehicle", {user_id = user_id, vehicle = vehicle})
    if vehicleInfo and #vehicleInfo > 0 then
        local price = getVehiclePrice(vehicle)
        if vehicleInfo[1].arrest == 0 and vehicleInfo[1].desmanche == 0 and parseInt(tonumber(vehicleInfo[1].ipva) + 24 * 15 * 60 * 60) > parseInt(os.time()) and not config.getVehicleTax then
            return true
        end
        if vehicleInfo[1].arrest > 0 then
            if parseInt(vehicleInfo[1].time) == 0 then
                price = parseInt(price * (config.seguradora / 100))
            else
                price = parseInt(price * (config.detido / 100))
            end
		elseif vehicleInfo[1].desmanche > 0 then
			price = parseInt(price * (3 / 100))
        elseif type and type == "exclusive" then
            vRP.execute("vRP/setIpva", { user_id = user_id, vehicle = vehicle, ipva = parseInt(os.time())})
            return true
        elseif parseInt(tonumber(vehicleInfo[1].ipva) + 24 * 15 * 60 * 60) <= parseInt(os.time()) then
            price = parseInt(price * ((config.ipva or 1) / 100))
        elseif config.getVehicleTax then
            price = config.getVehicleTax(user_id, vehicle, price, home)
        end
        if config.use_tryFullPayment then
            if vRP.tryFullPayment(user_id, price) then
                vRP.execute("vRP/setDetido", { detido = 0, time = "0", user_id = user_id, vehicle = vehicle, ipva = parseInt(os.time()), desmanche = 0})
                return true
            end
        elseif vRP.tryPayment(user_id, price) then
            vRP.execute("vRP/setDetido", { detido = 0, time = "0", user_id = user_id, vehicle = vehicle, ipva = parseInt(os.time()), desmanche = 0})
            return true
        end
    elseif garage and garage.type == "service" and config.getRentedVehicleTax then
        local price = config.getRentedVehicleTax(user_id, vehicle, garage)
        if config.use_tryFullPayment then
            if vRP.tryFullPayment(user_id, price) then
                return true
            end
        elseif vRP.tryPayment(user_id, price) then
            return true
        end
    end
    return false
end


 
config.getVehiclePlate = function(source,veh)
    local user_id = vRP.getUserId(source)
	local vehicle = vRP.query("vRP/getVehicle", { user_id = user_id, vehicle = veh })
	if vehicle[1] then
		return vehicle[1].plate
	end
end





 -- cobrar por cada vez que puxar um veiculo na garagem

--[[ config.getVehicleTax = function(user_id,vehicle, price)
	local tax = parseInt(price * 0.1)
	-- if tax > 10000 then
	-- 	tax = 10000
	-- end
	return tax
end

config.getRentedVehiclesTax = function(user_id, vehicles, garage)
	for i, veh in ipairs(vehicles) do
		veh.tax = 1000
	end
	return vehicles
end


config.getRentedVehicleTax = function(user_id, vehicle, garage)
	return 1000
end ]]


--[[ config.checkVehicleGarage = function(source,user_id,vehicle, garage)
	return true
end ]]


config.playAnim = function()
	vRP._playAnim(true,{"anim@mp_player_intmenu@key_fob@","fob_click"},false)
end

--[[ config.checkHealth = function()
	return GetEntityHealth(PlayerPedId()) > 0
end ]]



config.webhook = ""

config.webhookMessage = function(user_id, hash, placa, coords)
	local message = "ERROR"
	if user_id and hash and placa and coords then	
		local identity = vRP.getUserIdentity(user_id)
		if not identity then return end
		local vname = config.getVehicleModel(hash)
		local x,y,z = table.unpack(coords)
		message = "```prolog\n[PASSAPORTE]: "..user_id.." | "..identity.nome.." "..identity.nome2.." \n[USOU]: /dv \n[EM]: "..vname.." | "..placa.." \n[XYZ]: "..x..", "..y..", "..z.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```"
	end
	return message
end


config.pt_BR = {
	vehicleOutOfGarage = "Você já tem um veículo deste modelo fora da garagem.",
	allSlotsOccupied = "Todas as vagas estão ocupadas no momento.",
	vehicleUnavailable = "Veículo em falta na cidade!",
	seizedVehicle = "Veículo apreendido.",
	detainedVehicle = "Veículo detido.",
	noPermission = "Você não tem permissao",
	idUnavailable = function(id) return "ID "..id.." não está disponível" end,
	borrowedKey = function(vehicle,id) return "Chave do veículo <b>"..vehicle.."</b> emprestada para o ID <b>"..id.."</b>" end,
	alreadyHasKey = function(id) return "ID "..id.." já possui a chave desse veículo" end,
	removedKey = function(vehicle,id) return "Chave do veículo <b>"..vehicle.."</b> removida do ID <b>"..id.."</b>" end,
	idHasNoKey = function(id) return "ID "..id.." não possui a chave desse veículo" end,
	borrowedKeys = "Chaves emprestadas:",
	keyCommand = "chave",
	keyTutorial = "Utilize /chave <b>(add/remove/list) (veículo) (id)</b>",
	hasNoVehicle = function(vehicle) return "Você não possui o veículo <b>"..vehicle.."</b>" end,
	anchorCommand = "ancorar",
	disabled = "Desativado",
	installed = "Instalado",
	uninstalled = "Desinstalado",
	level = "Level",
	spawningVehicle = "Já existe um veículo sendo retirado."
}

config.en_US = {
	vehicleOutOfGarage = "You already have a vehicle of this model outside the garage.",
	allSlotsOccupied = "All slots are currently occupied.",
	vehicleUnavailable = "Missing vehicle in town!",
	seizedVehicle = "Seized vehicle.",
	detainedVehicle = "Detained vehicle.",
	noPermission = "You do not have permission",
	idUnavailable = function(id) return "ID "..id.." is not available" end,
	borrowedKey = function(vehicle,id) return "Vehicle key <b>"..vehicle.."</b> borrowed for ID <b>"..id.."</b>" end,
	alreadyHasKey = function(id) return "ID "..id.." already has the key to that vehicle" end,
	removedKey = function(vehicle,id) return "Vehicle key <b>"..vehicle.."</b> removed for ID <b>"..id.."</b>" end,
	idHasNoKey = function(id) return "ID "..id.." does not have a vehicle key" end,
	borrowedKeys = "Borrowed keys:",
	keyCommand = "key",
	keyTutorial = "Use /key <b> (add/remove/list) (vehicle) (id) </b>",
	hasNoVehicle = function(vehicle) return "You do not own the vehicle <b> "..vehicle .." </b>" end,
	anchorCommand = "anchor",
	disabled = "Disabled",
	installed = "Installed",
	uninstalled = "Uninstalled",
	level = "Level",
	spawningVehicle = "Spawning vehicle."
}

config.lang = config.pt_BR






config.garageThread = function()
	Citizen.CreateThread(function()
		while true do
			local idle = 500
			if not nui and length(nearestGarages) > 0 then
				local playercoords = GetEntityCoords(PlayerPedId())
				for i in pairs(nearestGarages) do
					if nearestGarages[i] then
						idle = 5
						local coords = nearestGarages[i].coords
						local marker = nearestGarages[i].marker 
						config.drawMarker(coords,marker)
						local distance = #(playercoords - coords)
						if distance < 2 and IsControlJustPressed(0,38) then
							if nearestGarages[i].type == "home" then
								if func.hasHome(nearestGarages[i].home) then
									homeGarage = nearestGarages[i].home
									toggleNui(nearestGarages[i])
								end
							elseif func.hasPermission(nearestGarages[i].perm) then
								homeGarage = false
								toggleNui(nearestGarages[i], nearestGarages[i].type == "service")
							end
						end
					end
				end
			end
			Citizen.Wait(idle)
		end
	end)
end

config.nearestGaragesThread = function()
	Citizen.CreateThread(function()
		while true do
			if not nui then
				local playercoords = GetEntityCoords(PlayerPedId())
				for i in pairs(config.garages) do 
					local distance = #(playercoords - config.garages[i].coords)
					if distance < 10 then
						nearestGarages[i] = config.garages[i]
					elseif nearestGarages[i] then
						nearestGarages[i] = nil
					end
				end
				for i in pairs(config.homeGarages) do 
					local distance = #(playercoords - config.homeGarages[i].coords)
					if distance < 10 then
						nearestGarages["home-"..i] = config.homeGarages[i]
					elseif nearestGarages["home-"..i] then
						nearestGarages["home-"..i] = nil
					end
				end
			end
			Citizen.Wait(500)
		end
	end)
end


config.customState = function(user_id, vehicle)
	local res = { liberacao = "Em dia", status = "Liberado", classLiberacao = "", classStatus = "", popup = false }
	if vehicle.arrest > 0 then
		if parseInt(vehicle.time) == 0 then
			local price = vRP.format( vehicle.price * (config.seguradora / 100) )
			res.liberacao = "$ "..price
			res.status = "Apreendido"
			res.classStatus = "seguradora"
			res.popup = "veículo apreendido, deseja liberar pagando <b>$ "..price.."</b> ?"
		else
			local price = vRP.format( vehicle.price * (config.detido / 100) )
			res.liberacao = "$ "..price
			res.status = "Detido"
			res.classStatus = "detido"
			res.popup = "veículo detido, deseja liberar pagando <b>$ "..price.."</b> ?"
		end
		res.classLiberacao = "detido"
	elseif vehicle.desmanche and vehicle.desmanche > 0 then
			local price = vRP.format( vehicle.price * (3 / 100) )
			res.liberacao = "$ "..price
			res.status = "Desmanchado"
			res.classStatus = "seguradora"
			res.popup = "veículo desmanchado, deseja liberar pagando <b>$ "..price.."</b> ?"
			res.classLiberacao = "detido"
	--end
	elseif parseInt(vehicle.ipva + 24 * 15 * 60 * 60) <= parseInt(os.time()) then
		local tipo = config.getVehicleType(vehicle.vehicle)
		if not tipo or tipo ~= "exclusive" then
			local price = vRP.format( vehicle.price * (config.ipva / 100) )
			res.liberacao = "$ "..price
			res.status = "IPVA Atrasado"
			res.classStatus = "seguradora"
			res.classLiberacao = "detido"
			res.popup = "veículo com ipva atrasado, deseja liberar pagando <b>$ "..price.."</b> ?"
		end
	elseif vehicle.tax and vehicle.tax > 0 then
		local price = vRP.format(vehicle.tax)
		res.liberacao = "$ "..price
		res.classLiberacao = "seguradora"
		res.popup = "deseja retirar o veículo "..vehicle.name.." por <b>$ "..price.."</b> ?"
	end
	return res
end



config.checkVehicleGarage = function(source,user_id,vehicle, garage)
	if garage and garage.tipo then
		local tipo = config.getVehicleType(vehicle)
		if tipo and tipo ~= garage.tipo then
			TriggerClientEvent("Notify", source, "negado", "Veículo não pode ser retirado nessa garagem.")
			return false
		end
	end
	return true

end


config.customMYSQL = true
vRP._prepare("vRP/create_ipva", "ALTER TABLE vrp_vehicles ADD IF NOT EXISTS ipva varchar(255) DEFAULT '1630912803'")
vRP._prepare("vRP/getVehicles", "SELECT * FROM vrp_vehicles WHERE user_id = @user_id AND work = 'false'")
vRP._prepare("vRP/getVehicle", "SELECT * FROM vrp_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND work = 'false'")
vRP._prepare("vRP/setDetido", "UPDATE vrp_vehicles SET arrest = @detido, time = @time, ipva = @ipva, desmanche = @desmanche WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/setIpva", "UPDATE vrp_vehicles SET ipva = @ipva WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/setVehicleData", "UPDATE vrp_vehicles SET engine = @engine, body = @body, fuel = @fuel, estado = @estado WHERE user_id = @user_id AND vehicle = @vehicle")