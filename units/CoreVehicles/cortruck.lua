return {
	cortruck = {
		acceleration = 0.04,
		brakerate = 0.8,
		buildcostenergy = 3700,
		buildcostmetal = 450,
		buildpic = "CORTRUCK.PNG",
		buildtime = 4198,
		canmove = true,
		category = "ALL TANK MOBILE NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "47 37 75",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		description = "Amphibious Transport Truck (1100 Transport Mass, 1100 Radar Range)",
		explodeas = "hugeexplosiongeneric",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		maxdamage = 1430,
		maxslope = 16,
		maxvelocity = 3.1,
		maxwaterdepth = 19,
		movementclass = "ATANK3",
		name = "Intruder",
		objectname = "CORTRUCK",
		radarDistance = 1100,
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd-builder",
		sightdistance = 340,
		trackoffset = 3,
		trackstrength = 6,
		tracktype = "StdTank",
		trackwidth = 32,
		transportSize = 2,
		transportCapacity = 14,
		transportMass = 1100,
		transportUnloadMethod = 0,
		loadingRadius = 75,
		holdSteady = true,
		unloadSpread = 1,
		cantBeTransported = true,
		turninplace = true,
		turninplaceanglelimit = 60,
		turninplacespeedlimit = 1.1979,
		turnrate = 258,
		customparams = {
			description_long = "",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.31364440918 1.09863281317e-06 0.657264709473",
				collisionvolumescales = "32.9147644043 17.5585021973 49.4168548584",
				collisionvolumetype = "Box",
				damage = 874,
				description = "Truck Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				hitdensity = 100,
				metal = 347,
				object = "CORCV_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 487,
				description = "Truck Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 235,
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
				"deathceg2-builder",
				"deathceg3-builder",
				"deathceg4-builder",
			},
		},
		sounds = {
			build = "nanlath2",
			canceldestruct = "cancel2",
			capture = "capture1",
			repair = "repair2",
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
				[1] = "vcormove",
			},
			select = {
				[1] = "vcorsel",
			},
		},
	},
}
