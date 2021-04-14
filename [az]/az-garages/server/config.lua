vAZ.config = {}

vAZ.config.fines = true
vAZ.config.fare = true
vAZ.config.stolen = 0.01
vAZ.config.seized = 0.02
vAZ.config.ipva = 0.02

vAZ.config.garages = {}
vAZ.config.garages.service = {
     [1] = {
        permission = 'Police',
        vehicles = {
            "corollarj",
            "r1250rj",
            "xtz",
            "focusrj",
            "urusrj",
            "frontierrj",
            "hiluxpolicia",
            "jeepprf",
            "bmwm8prf",
            "amarokprf",
            "q8pc",
            "pranger",
            "pbus",
            "policet",
            "amarokrj"
        }
    },
    [2] = {
        permission = 'Police',
        vehicles = {
            "predator"
        }
    },
    [3] = {
        permission = 'Police',
        vehicles = {
            "polmav",
            "swift"
        }
    },
    [4] = {
        permission = 'Paramedic',
        vehicles = {
            "mercambulancia",
		    "fordambulancia",
		    "wheelchair",
		    "hiluxpolicia",
		    "ambulance",
		    "jeepsamu"
        }
    },
    [5] = {
        permission = 'Jornal',
        vehicles = {
            "rumpo"
        }
    },
    [6] = {
        permission = 'Paramedic',
        vehicles = {
            "samumav"
        }
    },
    [7] = {  
        permission = 'LosSantos',
        vehicles = {
            "flatbed",
            "slamtruck"
        }
    },
    [8] = {
        vehicles = {
            "bus"
        }
    },
    [9] = {
        vehicles = {
            "stockade"
        }
    },
    [10] = {
        permission = 'TheLost',
        vehicles = {
            "deathbike",
            "hexer",
            "sanctus",
            "gargoyle"
        }
    },
    [11] = {
        permission = 'Jornal',
        vehicles = {
            "frogger"
        }
    },
    [12] = {
        permission = 'Lowrider',
        vehicles = {
            "buccanner2",
            "faction2",
            "faction3",
            "moonbeam2",
            "sabregt2",
            "voodoo",
		    "chino2"
        }
    },
   
    [13] = {
        vehicles = {
            "mule3"
        }
    },
    [14] = {
        vehicles = {
            "trash"
        }
    },
    [15] = {
        vehicles = {
            "phantom",
		    "packer"
        }
    },
    [16] = {
        vehicles = {
            "dinghy"
        }
    },
    [17] = {
        vehicles = {
            "dinghy"
        }
    },
    [18] = {
        vehicles = {
            "dinghy"
        }
    },
    [19] = {
        vehicles = {
            "dinghy"
        }
    },
    [20] = {
        vehicles = {
            "taco"
        }
    },
	[21] = {
        vehicles = {
            "seashark3"
        }
    },
	[22] = {
        vehicles = {
            "avisa"
        }
    },
    [23] = {
        price = 100,
        vehicles = {
            'tractor2',
            'rebel'
        }
    },
	[24] = {
        vehicles = {
            "flatbed"
        }
    },
    [25] = {
        vehicles = {
            "flatbed"
        }
    },
    [26] = {
        vehicles = {
            "taxi"
        }
    },
    [27] = {
        vehicles = {
            "boxville4"
        }
    },
    [28] = {
        permission = 'Mafia',
        vehicles = {
            "ztype",
            "btype3"
        }
    },
    [29] = {
        vehicles = {
            "gburrito2"
        }
    },
    [30] = {
        vehicles = {
            "ratloader"
        }
    }
}

vAZ.config.garages.rental = {
    [1] = {
        price = 100,
        vehicles = {
            'scorcher',
            'tribike',
            'tribike2',
            'tribike3',
            'fixter',
            'cruiser',
            'bmx'
        }
    },
    [2] = {
        price = 100,
        vehicles = {
            'scorcher',
            'tribike',
            'tribike2',
            'tribike3',
            'fixter',
            'cruiser',
            'bmx'
        }
    },
    [3] = {
        price = 100,
        vehicles = {
            'scorcher',
            'tribike',
            'tribike2',
            'tribike3',
            'fixter',
            'cruiser',
            'bmx'
        }
    }
}

vAZ.config.garages.private = {}

vAZ.config.garages.personal = {
    price = 100,
    max = 5
}

vAZ.config.garages.home = {
    price = 100,
    max = 5
}

vAZ.getServerGarage = function(type, id)
    if vAZ.config.garages[type] then
        if type == 'home' then
            return vAZ.config.garages.home
        elseif type == 'personal' then
            return vAZ.config.garages.personal
        elseif vAZ.config.garages[type][id] then
            return vAZ.config.garages[type][id]
        end
    end
    return nil
end