return {
	armsb = {
		acceleration = 0.1,
		brakerate = 1.5,
		buildcostenergy = 7000,
		buildcostmetal = 240,
		buildpic = "ARMSB.PNG",
		buildtime = 7000,
		canfly = true,
		canmove = true,
		cansubmerge = true,
		category = "ALL NOTLAND MOBILE WEAPON NOTSUB ANTIFLAME ANTIEMG ANTILASER VTOL NOTSHIP NOTHOVER",
		collide = true,
		cruisealt = 210,
		description = "Seaplane Bomber",
		energymake = 1.1,
		energyuse = 1.1,
		explodeas = "mediumexplosiongeneric",
		footprintx = 3,
		footprintz = 3,
		icontype = "air",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 750,
		maxslope = 10,
		maxvelocity = 8,
		maxwaterdepth = 255,
		name = "Rondine",
		noautofire = true,
		nochasecategory = "VTOL",
		objectname = "ARMSB",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd",
		sightdistance = 455,
		turnrate = 1200,
		customparams = {
			tooltipWeapon = "Air Bombs",
			weaponDamageRate = "8",
			specialTooltip = "Water-Bouncing Weapon",
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg2",
				"deathceg3",
				"deathceg4",
			},
		},
		sounds = {
			build = "nanlath1",
			canceldestruct = "cancel2",
			repair = "repair1",
			underattack = "warning1",
			working = "reclaim1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "vtolcrmv",
			},
			select = {
				[1] = "seapsel1",
			},
		},
		weapondefs = {
			arm_seabomb = {
				areaofeffect = 100,
				avoidfeature = false,
				bounceexplosiongenerator = "custom:genericshellexplosion-small",
				bouncerebound = 0.15,
				bounceslip = 0.75,
				burst = 3,
				burstrate = 0.15,
				collidefriendly = false,
				commandfire = false,
				craterareaofeffect = 100,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.5,
				explosiongenerator = "custom:genericshellexplosion-small-bomb",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				intensity = 0.01,
				mygravity = 0.4,
				name = "ArmSeaBombs",
				noselfdamage = true,
				numbounce = 3,
				projectiles = 8,
				range = 1000,
				reloadtime = 6,
				rgbcolor = "1 1 0.47",
				size = 2,
				stages = 50,
				soundhitdry = "flakhit",
				soundhitwet = "splsmed",
				soundhitwetvolume = 0.5,
				soundstart = "comfire2", --/exmine1
				--soundTrigger = 1,
				sprayangle = 6000,
				waterbounce = true,
				weapontype = "AircraftBomb",
				damage = {
					bombers = 5,
					default = 20,
					ship = 40,
					subs = 40,
				},
		                customparams = {
		                    expl_light_color = "1 0.5 0.05",
		                },
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "ARM_SEABOMB",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
