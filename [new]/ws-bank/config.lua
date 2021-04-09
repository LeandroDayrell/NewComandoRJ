config = {}

-- Locais para acessar o banco
config.coords_bank = {
    [1] = {coordenada = vec3(150.26,-1039.99,29.37)},
    [2] = {coordenada = vec3(246.80,222.75,106.28)},
    [3] = {coordenada = vec3(-350.81,-49.42,49.04)},
    [4] = {coordenada = vec3(314.38,-278.72,54.17)},
    [7] = {coordenada = vec3(1174.90,2706.57,38.09)},
    [8] = {coordenada = vec3(237.42,217.71,106.29)},
    [9] = {coordenada = vec3(-2962.58,482.83,15.71)},
    [10] = {coordenada = vec3(-112.91,6469.72,31.63)},

     ----caixinhas
     [11] = {coordenada = vec3(-458.39,-326.13,34.51)},
     [12] = {coordenada = vec3(-1074.03,-827.76,19.04)},
     
     ----ATM
     [13] = {coordenada = vec3(145.97, 1035.17,29.35)},
     [14] = {coordenada = vec3(147.63,-1035.69,29.35)},
     [15] = {coordenada = vec3(-586.48,-143.28,47.21)},
     [16] = {coordenada = vec3(-588.52,-141.19,47.21)},
     [17] = {coordenada = vec3(-587.47,-142.29,47.21)},
     [18] = {coordenada = vec3(-577.08,-194.81,38.22)},
     [19] = {coordenada = vec3(-527.75,-166.08,38.24)},
     [20] = {coordenada = vec3(-537.25,-171.61,38.22)},
     [21] = {coordenada = vec3(4476.09,-4469.01,4.36)},
     [22] = {coordenada = vec3(4475.43,-4469.73,4.36)},
     [23] = {coordenada = vec3(-386.733,6045.953,31.501)},
     [24] = {coordenada = vec3(-283.03,6226.09,31.5)}, 
     [25] = {coordenada = vec3(-132.99,6366.5,31.48)},
     [26] = {coordenada = vec3(-97.3,6455.44,31.47)},
     [27] = {coordenada = vec3(-95.53,6457.11,31.47)}, 
     [28] = {coordenada = vec3(155.91,6642.9,31.61)},
     [29] = {coordenada = vec3(174.14,6637.92,31.58)},
     [30] = {coordenada = vec3(1701.21,6426.56,32.77)},
     [31] = {coordenada = vec3(1735.27,6410.52,35.04)},
     [32] = {coordenada = vec3(1703.03,4933.59,42.07)},
     [33] = {coordenada = vec3(1968.09,3743.54,32.35)},
     [34] = {coordenada = vec3(1822.67,3683.1,34.28)},
     [35] = {coordenada = vec3(540.29,2671.14,42.16)},
     [36] = {coordenada = vec3(2564.5,2584.79,38.09)},
     [37] = {coordenada = vec3(2558.76,351.01,108.63)},
     [38] = {coordenada = vec3(2558.5,389.49,108.63)},
     [39] = {coordenada = vec3(1077.76,-776.54,58.25)}, 
     [40] = {coordenada = vec3(1166.96,-456.13,66.81)},
     [41] = {coordenada = vec3(1153.73,-326.8,69.21)},
     [42] = {coordenada = vec3(380.77,323.39,103.57)},
     [43] = {coordenada = vec3(285.51,143.42,104.18)}, 
     [44] = {coordenada = vec3(158.65,234.22,106.63)},
     [45] = {coordenada = vec3(-165.1,232.72,94.93)},
     [46] = {coordenada = vec3(-165.16,234.77,94.93)},
     [47] = {coordenada = vec3(-1827.26,784.89,138.31)},
     [48] = {coordenada = vec3(-1409.74,-100.47,52.39)}, 
     [49] = {coordenada = vec3(-1410.35,-98.75,52.43)},
     [50] = {coordenada = vec3(-1204.97,-326.33,37.84)},
     [51] = {coordenada = vec3(-1205.75,-324.82,37.86)},
     [52] = {coordenada = vec3(-1215.64,-332.231,37.881)},
     [53] = {coordenada = vec3(-2072.35,-317.24,13.32)}, 
     [54] = {coordenada = vec3(-2975.07,380.14,15.0)},
     [55] = {coordenada = vec3(-2956.82,487.68,15.47)},
     [56] = {coordenada = vec3(-2958.98,487.74,15.47)},
     [57] = {coordenada = vec3(-3043.98,594.57,7.74)},
     [58] = {coordenada = vec3(-3144.39,1127.58,20.86)},
     [59] = {coordenada = vec3(-3241.17,997.59,12.56)},
     [60] = {coordenada = vec3(-3240.57,1008.61,12.84)},
     [61] = {coordenada = vec3(-1305.36,-706.43,25.33)},
     [62] = {coordenada = vec3(-537.81,-854.51,29.3)},
     [63] = {coordenada = vec3(-712.95,-818.91,23.73)}, 
     [64] = {coordenada = vec3(-710.09,-818.91,23.73)},
     [65] = {coordenada = vec3(-717.71,-915.73,19.22)},
     [66] = {coordenada = vec3(-526.61,-1222.98,18.46)}, 
     [67] = {coordenada = vec3(-256.24,-716.02,33.53)},
     [68] = {coordenada = vec3(-203.8,-861.4,30.27)},
     [69] = {coordenada = vec3(111.22,-775.22,31.44)},
     [70] = {coordenada = vec3(114.39,-776.35,31.42)},
     [71] = {coordenada = vec3(112.62,-819.41,31.34)},
     [72] = {coordenada = vec3(119.05,-883.69,31.13)}, 
     [73] = {coordenada = vec3(-846.25,-341.33,38.69)},
     [74] = {coordenada = vec3(-846.84,-340.21,38.69)},
     [75] = {coordenada = vec3(-1204.98,-326.33,37.84)},
     [76] = {coordenada = vec3(-56.96,-1752.07,29.43)},
     [77] = {coordenada = vec3(-262.03,-2012.33,30.15)},
     [78] = {coordenada = vec3(-273.11,-2024.54,30.15)},
     [79] = {coordenada = vec3(24.44,-945.97,29.36)},
     [80] = {coordenada = vec3(-254.39,-692.46,33.61)}, 
     [81] = {coordenada = vec3(-1570.197,-546.651,34.955)},
     [82] = {coordenada = vec3(-1571.03,-547.37,34.96)},
     [83] = {coordenada = vec3(-1415.94,-212.02,46.51)},
     [84] = {coordenada = vec3(-1430.112,-211.014,46.500)},
     [85] = {coordenada = vec3(33.17,-1348.23,29.5)},
     [86] = {coordenada = vec3(288.76,-1282.29,29.65)},
     [87] = {coordenada = vec3(289.11,-1256.81,29.45)},
     [88] = {coordenada = vec3(296.48,-894.14,29.24)},
     [89] = {coordenada = vec3(295.74,-896.08,29.22)},
     [90] = {coordenada = vec3(1686.753,4815.809,42.008)},
     [91] = {coordenada = vec3(-303.28,-829.72,32.42)},
     [92] = {coordenada = vec3(5.27,-919.85,29.56)},
     [93] = {coordenada = vec3(-1074.01,-827.69,19.04)},
     [94] = {coordenada = vec3(-1110.92,-836.26,19.01)},
     [95] = {coordenada = vec3(-1074.39,-827.47,27.04)},
     [96] = {coordenada = vec3(-660.68,-854.05,24.49)},
     [97] = {coordenada = vec3(-1315.75,-834.68,16.97)}, 
     [98] = {coordenada = vec3(-1314.78,-835.99,16.97)},
     [99] = {coordenada = vec3(1138.23,-468.94,66.74)}, 
     [100] = {coordenada = vec3(-821.7,-1081.93,11.14)},
     [101] = {coordenada = vec3(236.6,219.66,106.29)},
     [102] = {coordenada = vec3(237.02,218.76,106.29)},
     [103] = {coordenada = vec3(237.48,217.83,106.29)},
     [104] = {coordenada = vec3(237.89,216.93,106.29)},
     [105] = {coordenada = vec3(238.32,215.98,106.29)},
     [106] = {coordenada = vec3(265.82,213.89,106.29)},
     [107] = {coordenada = vec3(265.51,212.96,106.29)},
     [108] = {coordenada = vec3(265.17,212.0,106.29)},
     [109] = {coordenada = vec3(264.81,211.06,106.29)},
     [110] = {coordenada = vec3(264.46,210.08,106.29)},
     [111] = {coordenada = vec3(24.45,-946.01,29.36)},
     [112] = {coordenada = vec3(-258.77,-723.38,33.47)},
     [113] = {coordenada = vec3(-611.87,-704.81,31.24)},
     [114] = {coordenada = vec3(-614.58,-704.84,31.24)},
     [115] = {coordenada = vec3(-866.65,-187.74,37.85)},
     [116] = {coordenada = vec3(-867.61,-186.1,37.85)},
     [117] = {coordenada = vec3(-567.89,-234.35,34.25)},
     [118] = {coordenada = vec3(-301.68,-830.05,32.42)},
     [119] = {coordenada = vec3(2683.1,3286.65,55.25)},
     [120] = {coordenada = vec3(437.13,-628.34,28.71)},
     [121] = {coordenada = vec3(230.92,367.57,106.12)},
     [122] = {coordenada = vec3(356.97,173.55,103.08)},
     [123] = {coordenada = vec3(-45.18,-1665.89,29.5)},
     [124] = {coordenada = vec3(315.14,-593.7,43.29)},
     [125] = {coordenada = vec3(130.13,-1292.68,29.27)},
     [126] = {coordenada = vec3(129.68,-1291.9,29.27)},
     [127] = {coordenada = vec3(129.27,-1291.19,29.27)},
     [128] = {coordenada = vec3(1171.56,2702.54,38.18)},
     [129] = {coordenada = vec3(1172.53,2702.6,38.18)},
     [130] = {coordenada = vec3(942.73,44.57,80.3)},
     [131] = {coordenada = vec3(934.55,31.57,80.3)},
}

--Configurar horario de abertura e fechamento do banco
config.aberto_24h = true
config.horario_abrir = 7
config.horario_fechar = 17

--Configurar a porcentagem de rendimento
config.rendimento = 0.0001
config.time_rendimento = 45000 --Segundos!!

--Configurar link da logo do banco
config.logo = "https://cdn.discordapp.com/attachments/635554709821718570/818212609035206737/logo.png"

return config