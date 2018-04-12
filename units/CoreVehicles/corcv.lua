return {
	corcv = {
		acceleration = 0.1144,
		brakerate = 1.0692,
		buildcostenergy = 2100,
		buildcostmetal = 140,
		builddistance = 130,
		builder = true,
		shownanospray = false,
		buildpic = "CORCV.PNG",
		buildtime = 4160,
		canmove = true,
		category = "ALL TANK MOBILE NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "35 22 49",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		description = "Tech Level 1",
		energymake = 10,
		energystorage = 50,
		energyuse = 10,
		explodeas = "mediumexplosiongeneric-builder",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		maxdamage = 1290,
		maxslope = 16,
		maxvelocity = 1.82,
		maxwaterdepth = 19,
		metalmake = 0.1,
		metalstorage = 50,
		movementclass = "TANK3",
		name = "Construction Vehicle",
		objectname = "CORCV",
		radardistance = 50,
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd-builder",
		sightdistance = 260,
		terraformspeed = 450,
		trackoffset = 3,
		trackstrength = 6,
		tracktype = "StdTank",
		trackwidth = 32,
		turninplace = true,
		turninplaceanglelimit = 60,
		turninplacespeedlimit = 1.1979,
		turnrate = 421,
		workertime = 90,
		buildoptions = {
			"corsolar",
			"corwin",
			"cormex",
			"corestor",
			"cormstor",

			"corrad",
			"cormakr",
			"corlab",
			"corvp",
			"corap",

			"coradvsol",
			"corgeo",
			"coravp",
			"corsy",
			"corhp",

			"coreyes",
			"corllt",
			"cordrag",
			"corrl",
			"cordl",

			"corjamt",
			"corexp",
			"cormaw",
			"corplas",
			"cormadsam",

			"cornanotc",
			"corhlt",
			"corpun",
			"corerad",
			"corjuno",
		},
		customparams = {
			area_mex_def = "cormex",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.31364440918 1.09863281317e-06 0.657264709473",
				collisionvolumescales = "32.9147644043 17.5585021973 49.4168548584",
				collisionvolumetype = "Box",
				damage = 874,
				description = "Construction Vehicle Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				hitdensity = 100,
				metal = 87,
				object = "CORCV_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 487,
				description = "Construction Vehicle Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 35,
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
