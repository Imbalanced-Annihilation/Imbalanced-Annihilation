return {
	armguard = {
		acceleration = 0,
		brakerate = 0,
		buildangle = 8192,
		buildcostenergy = 12000,
		buildcostmetal = 1250,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 5,
		buildinggrounddecalsizey = 5,
		buildinggrounddecaltype = "armguard_aoplane.dds",
		buildpic = "ARMGUARD.PNG",
		buildtime = 21377,
		canrepeat = false,
		category = "ALL NOTLAND WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 0 -7",
		collisionvolumescales = "73 33 73",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		description = "Plasma Battery",
		explodeas = "mediumBuildingExplosionGeneric",
		footprintx = 4,
		footprintz = 4,
		hightrajectory = 2,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 2760,
		maxslope = 10,
		maxwaterdepth = 0,
		name = "Guardian",
		nochasecategory = "MOBILE",
		objectname = "ARMGUARD",
		seismicsignature = 0,
		selfdestructas = "mediumBuildingExplosionGenericSelfd",
		sightdistance = 455,
		usebuildinggrounddecal = true,
		yardmap = "ooooooooo",
		customparams = {
			tooltipWeapon = "Plasma",
			removewait = true,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "-1.17901611328 -3.4173887085 2.49339294434",
				collisionvolumescales = "56.5218811035 34.070022583 54.9867858887",
				collisionvolumetype = "Box",
				damage = 1656,
				description = "Guardian Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 40,
				hitdensity = 100,
				metal = 890,
				object = "ARMGUARD_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 828,
				description = "Guardian Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 357,
				object = "3X3D",
                collisionvolumescales = "55.0 4.0 6.0",
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
			cloak = "kloak1",
			uncloak = "kloak1un",
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
				[1] = "twrturn3",
			},
			select = {
				[1] = "twrturn3",
			},
		},
		weapondefs = {
			plasma = {
				explosiongenerator = "custom:genericshellexplosion-medium",
				accuracy = 75,
				areaofeffect = 128,
				avoidfeature = false,
				craterareaofeffect = 128,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.25,
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.5,
				name = "PlasmaCannon",
				noselfdamage = true,
				range = 1320,
				reloadtime = 2.925,
				soundhit = "xplomed2",
				soundhitwet = "splsmed",
				soundhitwetvolume = 0.5,
				soundstart = "cannhvy5",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 450,
				damage = {
					bombers = 90,
					commanders = 550,
					default = 250,
					fighters = 90,
					subs = 90,
					ships = 550,
					vtol = 90,
				},
			},
			plasma_high = {
				accuracy = 75,
				areaofeffect = 192,
				avoidfeature = false,
				craterareaofeffect = 192,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.5,
				explosiongenerator = "custom:genericshellexplosion-medium",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 1.4,
				name = "PlasmaCannon",
				noselfdamage = true,
				proximitypriority = -2,
				range = 1320,
				reloadtime = 7,
				soundhit = "xplomed2",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.5,
				soundstart = "cannhvy5",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 440,
				damage = {
					bombers = 90,
					commanders = 950,
					default = 550,
					subs = 90,
					fighters = 90,
					ships = 1100,
					vtol = 90,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "PLASMA",
				maindir = "0 1 0",
				maxangledif = 230,
				onlytargetcategory = "SURFACE",
			},
			[2] = {
				def = "PLASMA_HIGH",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
