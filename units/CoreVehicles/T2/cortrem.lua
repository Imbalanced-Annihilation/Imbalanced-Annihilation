return {
	cortrem = {
		acceleration = 0.0528,
		brakerate = 0.33,
		buildcostenergy = 48000,
		buildcostmetal = 1800,
		buildpic = "CORTREM.DDS",
		buildtime = 31100,
		canmove = true,
		category = "ALL WEAPON NOTSUB NOTAIR NOTHOVER SURFACE TANK",
		collisionvolumeoffsets = "0 -5 3",
		collisionvolumescales = "37 61 51",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		description = "Heavy Artillery Vehicle",
		energymake = 2.1,
		energyuse = 2.1,
		explodeas = "hugeexplosiongeneric",
		footprintx = 4,
		footprintz = 4,
		hightrajectory = 1,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
        mass = 5001,
		maxdamage = 2700,
		maxslope = 14,
		maxvelocity = 1.45,
		maxreversevelocity = 1.45*0.60,
		maxwaterdepth = 15,
		movementclass = "HTANK4",
		name = "Tremor",
		nochasecategory = "VTOL",
		objectname = "CORTREM",
		seismicsignature = 0,
		selfdestructas = "hugeExplosionGenericSelfd",
		sightdistance = 351,
		trackoffset = -8,
		trackstrength = 8,
		tracktype = "StdTank",
		trackwidth = 28,
		turninplace = true,
		turninplaceanglelimit = 110,
		turninplacespeedlimit = 0.95832,
		turnrate = 169.39999,
		customparams = {
			tooltipWeapon = "Rapid Plasma",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "1.25984954834 -1.01012474365 0.475593566895",
				collisionvolumescales = "55.5426483154 42.2261505127 61.5749359131",
				collisionvolumetype = "Box",
				damage = 2000,
				description = "Tremor Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 8,
				hitdensity = 100,
				metal = 1006,
				object = "CORTREM_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 1500,
				description = "Tremor Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 2,
				hitdensity = 100,
				metal = 474,
				object = "2X2B",
                collisionvolumescales = "35.0 4.0 6.0",
                collisionvolumetype = "cylY",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg2",
				"deathceg3",
				"deathceg4",
			},
			explosiongenerators = {
				[1] = "custom:barrelshot-medium",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
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
				[1] = "tcormove",
			},
			select = {
				[1] = "tcorsel",
			},
		},
		weapondefs = {
			tremor = {
				accuracy = 1190,
				areaofeffect = 160,
				avoidfeature = false,
				craterareaofeffect = 160,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:genericshellexplosion-medium",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "RapidArtillery",
				noselfdamage = true,
				proximitypriority = -3,
				range = 1275,
				reloadtime = 0.4,
				soundhit = "xplomed4",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.5,
				soundstart = "cannhvy2",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 414.87949,
				damage = {
					bombers = 19,
					default = 295,
					fighters = 19,
					subs = 5,
					vtol = 19,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "TREMOR",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
