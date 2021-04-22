local weapon_list = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local playerReady = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERREADY
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.playerReady()
	playerReady = true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADREADY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	NetworkSetFriendlyFireOption(true)
	SetCanAttackFriendly(PlayerPedId(),true,true)

	while true do
		if playerReady then
			local coords = GetEntityCoords(PlayerPedId())
			vRPserver._updatePositions(coords.x,coords.y,coords.z)
		end

		Citizen.Wait(10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADREADY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if playerReady then
			vRPserver._updateHealth(GetEntityHealth(PlayerPedId()))
			vRPserver._updateArmour(GetPedArmour(PlayerPedId()))
			vRPserver._updateWeapons(tvRP.getWeapons())
		end

		Citizen.Wait(30000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEAPONTYPES
-----------------------------------------------------------------------------------------------------------------------------------------
local weapon_types = {
	"GADGET_PARACHUTE",
	"WEAPON_KNIFE",
	"WEAPON_KNUCKLE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_BOTTLE",
	"WEAPON_DAGGER",
	"WEAPON_HATCHET",
	"WEAPON_MACHETE",
	"WEAPON_FLASHLIGHT",
	"WEAPON_SWITCHBLADE",
	"WEAPON_POOLCUE",
	"WEAPON_PIPEWRENCH",
	"WEAPON_STONE_HATCHET",
	"WEAPON_WRENCH",
	"WEAPON_BATTLEAXE",
	"WEAPON_AUTOSHOTGUN",
	

	"WEAPON_GRENADE",
	"WEAPON_STICKYBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_BZGAS",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_MOLOTOV",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_PETROLCAN",
	"WEAPON_SNOWBALL",
	"WEAPON_FLARE",
	"WEAPON_BALL",
	

	"WEAPON_PISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_REVOLVER",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_DOUBLEACTION",
	"WEAPON_PISTOL50",
	"WEAPON_SNSPISTOL",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_STUNGUN",
	"WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_RAYPISTOL",
	

	"WEAPON_MICROSMG",
	"WEAPON_MINISMG",
	"WEAPON_SMG",
	"WEAPON_SMG_MK2",
	"WEAPON_ASSAULTSMG",
	"WEAPON_COMBATPDW",
	"WEAPON_GUSENBERG",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_RAYCARBINE",
	

	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_COMPACTRIFLE",
	

	"WEAPON_PUMPSHOTGUN",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_SWEEPERSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_MUSKET",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	

	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	

	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_MINIGUN",
	"WEAPON_FIREWORK",
	"WEAPON_RAILGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_RAYMINIGUN",
	"WEAPON_PIPEBOMB"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.updateWeapons()
	vRPserver._updateWeapons(tvRP.getWeapons())
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.getWeapons()
	local ammoList = {}
	local myWeapons = {}
	local ped = PlayerPedId()

	for k,v in pairs(weapon_types) do
		local hashWeapon = GetHashKey(v)
		if HasPedGotWeapon(ped,hashWeapon) then
			local weapon = {}
			myWeapons[v] = weapon
			local typeAmmo = GetPedAmmoTypeFromWeapon(ped,hashWeapon)
			if ammoList[typeAmmo] == nil then
				ammoList[typeAmmo] = true
				weapon["ammo"] = GetAmmoInPedWeapon(ped,hashWeapon)
			else
				weapon["ammo"] = 0
			end
		end
	end
	myWeapons = tvRP.legalWeaponsChecker(myWeapons)
	return myWeapons
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPLACEWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.replaceWeapons()
	local old_weapons = tvRP.getWeapons()
	RemoveAllPedWeapons(PlayerPedId(),true)
	return old_weapons
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.clearWeapons()
	RemoveAllPedWeapons(PlayerPedId(),true)
	weapon_list = {}
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.giveWeapons(weapons,clear_before)
	local ped = PlayerPedId()
	if clear_before then
		RemoveAllPedWeapons(ped,true)
		weapon_list = {}		  
	end

	for k,v in pairs(weapons) do
		GiveWeaponToPed(ped,GetHashKey(k),v.ammo or 0,false,true)
		weapon_list[string.upper(k)] = v						   
	end
end
function tvRP.getWeaponsLegal()									
	return weapon_list
end
function tvRP.legalWeaponsChecker(weapon)
	local source = source
	local weapon = weapon
	local weapons_legal = tvRP.getWeaponsLegal()
	local ilegal = false
	local weapons_ilegal = {}
	for v, b in pairs(weapon) do
	  if not weapon_list[string.upper(v)] then
		ilegal = true 
		table.insert(weapons_ilegal, {name=string.upper(v),ammo=b.ammo}) 
	  end
	end
	if ilegal then
		tvRP.giveWeapons(weapons_legal, true)
		weapon = weapons_legal
		TriggerServerEvent("LOG:ARMAS2235", weapons_ilegal)
	end
	return weapon
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETHEALTH
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.getHealth()
	return GetEntityHealth(PlayerPedId())
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETHEALTH
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.setHealth(health)
	SetEntityHealth(PlayerPedId(),parseInt(health))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEHEALTH
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.updateHealth(number)
	local ped = PlayerPedId()
	local health = GetEntityHealth(ped)
	if health > 101 then
		SetEntityHealth(ped,parseInt(health+number))
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNHEALTH
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.downHealth(number)
	local ped = PlayerPedId()
	local health = GetEntityHealth(ped)

	SetEntityHealth(ped,parseInt(health-number))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETARMOUR
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.getArmour()
	return GetPedArmour(PlayerPedId())
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETARMOUR
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.setArmour(amount)
	local ped = PlayerPedId()
	local armour = GetPedArmour(ped)
	--SetPedArmour(ped,parseInt(armour+amount))
	TriggerEvent("newton",amount)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETPOSITIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.getPositions()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	return vRPserver.mathLegth(coords.x),vRPserver.mathLegth(coords.y),vRPserver.mathLegth(coords.z),vRPserver.mathLegth(GetEntityHeading(ped))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- APPLYSKIN
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.applySkin(model)
	local mHash = model

	RequestModel(mHash)
	while not HasModelLoaded(mHash) do
		RequestModel(mHash)
		Citizen.Wait(10)
	end

	if HasModelLoaded(mHash) then
		SetPlayerModel(PlayerId(),mHash)
		SetModelAsNoLongerNeeded(mHash)
	end

	SetPedComponentVariation(PlayerPedId(),1,0,0,2)
end