Config = {}

-- Police Settings:
Config.PermCops = "police.heist"	-- Cops permission
Config.MinCops = 4					-- Amount of cops required to start heist

-- Reward Settings:
Config.MinReward = 20000						-- set minimum reward amount
Config.MaxReward = 60000						-- set maximum reward amount
Config.RewardInDirtyMoney = true			-- reward as dirty money (true) or as normal cash (false)
Config.EnableItemReward = false 				-- requires to add your desired items into your items table in database
Config.ItemName1 = "PutItemNameHere"				-- exact name of your item1
Config.ItemMinAmount1 = 50					-- set minimum reward amount of item1
Config.ItemMaxAmount1 = 300					-- set maximum reward amount of item1
Config.EnableRareItemReward = false			-- add another item as reward but this has only 25% chance 
Config.ItemName2 = "PutItemNameHere"				-- exact name of your item2
Config.ItemMinAmount2 = 1					-- set minimum reward amount of item2
Config.ItemMaxAmount2 = 3					-- set maximum reward amount of item2
Config.RandomChance = 2						-- Set chance, 1/2 is default, which is 50% chance. If u e.g. change value to 4, then 1/4 equals 25% chance.

-- Mission Blip Settings:
Config.EnableMapBlip = true							-- set between true/false
Config.BlipNameOnMap = "Robo Camion Blindado"		-- set name of the blip
Config.BlipSprite = 67								-- set blip sprite, lists of sprite ids are here: https://docs.fivem.net/game-references/blips/
Config.BlipDisplay = 4								-- set blip display behaviour, find list of types here: https://runtime.fivem.net/doc/natives/#_0x9029B2F3DA924928
Config.BlipScale = 0.7								-- set blip scale/size on your map
Config.BlipColour = 5								-- set blip color, list of colors available in the bottom of this link: https://docs.fivem.net/game-references/blips/

-- Armored Truck Blip Settings:
Config.BlipNameForTruck = "Camión blindado"			-- set name of the blip
Config.BlipSpriteTruck = 1							-- set blip sprite, lists of sprite ids are here: https://docs.fivem.net/game-references/blips/
Config.BlipColourTruck = 5							-- set blip color, list of colors available in the bottom of this link: https://docs.fivem.net/game-references/blips/
Config.BlipScaleTruck = 0.9							-- set blip scale/size on your ma

Config.items = { -- Items
    laptop = "laptop_h",
    C4 = "C4",
	dirty_money = "dirty_money"
}

-- Mission Start Location:
Config.MissionSpot = {
	{ ["x"] = 1275.55, ["y"] = -1710.4, ["z"] = 54.77, ["h"] = 0 },
}

-- Mission Marker Settings:
Config.MissionMarker = 27 												-- marker type
Config.MissionMarkerColor = { r = 240, g = 52, b = 52, a = 100 } 		-- rgba color of the marker
Config.MissionMarkerScale = { x = 1.25, y = 1.25, z = 1.25 }  			-- the scale for the marker on the x, y and z axis
Config.Draw3DText = "Presiona ~g~[E]~s~ para ~y~Empezar la Misión~s~"					-- set your desired text here

-- Control Keys
Config.KeyToStartMission = 38	-- default: [E] // set key to start the mission
Config.KeyToOpenTruckDoor = 47
Config.KeyToRobFromTruck = 38										

-- VRP.ShowNotifications:
Config.NoMissionsAvailable = "La ~y~mision~s~ no están disponibles actualmente, ¡inténtalo de nuevo más tarde!"
Config.HackingFailed = "~s~Has ~r~fallado"
Config.TruckMarkedOnMap = "~y~Camion blindado~s~ está marcado en su gps"
Config.KillTheGuards = "~r~dejar ir~s~ los guardias abajor"
Config.MissionCompleted = "~g~La misión fue un éxito"
Config.BeginToRobTruck = "Ir al ~y~Camión blindado~s~ y comenzar a robar"
Config.GuardsNotKilledYet = "Saca al ~b~conductor~s~ y / o el ~b~pasajero~s~ de la ~y~Camión blindado~s~"
Config.TruckIsNotStopped = "Para el ~y~Camión blindado~s~ antes de ~r~robar~s~!"
Config.NotEnoughMoney = "Necesitas ~g~$"..Config.MissionCost.."~s~ en tu ~b~cuenta bancaria~s~ conseguir un ~y~misión~s~"
Config.NotEnoughPolice = "Que hacer ~y~misiones~s~ debe haber al menos: ~b~"..Config.RequiredPoliceOnline.. " policías~s~ en línea!"
Config.CooldownMessage = "Puedes hacer otra ~y~mision~s~ en: ~b~%s minutos~s~"
Config.RewardMessage = "Recibiste ~g~$%s ~s~ from the ~y~Camión blindado~s~"
Config.Item1Message = "Recibiste ~b~%sx~s~ el Relojes de oro del  ~y~Camión blindado~s~"
Config.Item2Message = "Recibiste ~b~%sx~s~ el Lingotes de oro del ~y~Camión blindado~s~"
Config.DispatchMessage = "^3 Estan robando ^0 en un camión blindado en^5%s^0"

-- VRP.ShowHelpNotifications:
Config.OpenTruckDoor = "Presiona ~INPUT_DETONATE~ ABRIR LA PUERTA"
Config.RobFromTruck = "Presiona ~INPUT_PICKUP~ EN TRABAJO"

-- ProgressBars text
Config.Progress1 = "BUSQUEDA DE INFORMACION"
Config.Progress2 = "INSTALA EXPLOSIVO"
Config.Progress3 = "Todavía hay una explosión"
Config.Progress4 = "Secuestro"

-- ProgressBar Timers, in seconds:
Config.RetrieveMissionTimer = 7.5	-- time from pressed E to receving location on the truck
Config.DetonateTimer = 20			-- time until bomb is detonated
Config.RobTruckTimer = 10			-- time spent to rob the truck

-- Guards Weapons:
Config.DriverWeapon = "WEAPON_PUMPSHOTGUN"		-- weapon for driver
Config.PassengerWeapon = "WEAPON_SMG" 			-- weapon for passenger

-- Armored Truck Spawn Locations
Config.ArmoredTruck = 
{
	{ 
		Location = vector3(-1327.479736328,-86.045326232910,49.31), 
		InUse = false
	},
	{ 
		Location = vector3(-2075.888183593,-233.73908996580,21.10), 
		InUse = false
	},
	{ 
		Location = vector3(-972.1781616210,-1530.9045410150,4.890),
		InUse = false
	},
	{ 
		Location = vector3(798.184265136720,-1799.8173828125,29.33), 
		InUse = false
	},
	{ 
		Location = vector3(1247.0718994141,-344.65634155273,69.08), 
		InUse = false
	}
}

