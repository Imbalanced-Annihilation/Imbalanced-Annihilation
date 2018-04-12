return {
	corfhp = {
		acceleration = 0,
		brakerate = 0,
		buildcostenergy = 5500,
		buildcostmetal = 1150,
		builder = true,
		shownanospray = false,
		buildpic = "CORFHP.DDS",
		buildtime = 17817,
		canmove = true,
		category = "ALL PLANT NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumescales = "120 32 106",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		description = "Builds Hovercraft",
		energystorage = 200,
		explodeas = "largeBuildingexplosiongeneric",
		footprintx = 8,
		footprintz = 7,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 3356,
		metalstorage = 200,
		minwaterdepth = 30,
		name = "Floating Hovercraft Platform",
		objectname = "CORFHP",
		radardistance = 50,
		seismicsignature = 0,
		selfdestructas = "largeBuildingExplosionGenericSelfd",
		sightdistance = 312,
		terraformspeed = 1000,
		waterline = 4,
		workertime = 200,
		yardmap = "wCCCCCCwwCCCCCCwwCCCCCCwwCCCCCCwwCCCCCCwwCCCCCCwwCCCCCCw",
		buildoptions = {
			"corch",
			"corsh",
			"corsnap",
			"corah",
			"cormh",

			"corthovr",
			"corhal",
		},
		customparams = {
			
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "120 26 108",
				collisionvolumetype = "Box",
				damage = 2014,
				description = "Floating Hovercraft Platform Wreckage",
				energy = 0,
				footprintx = 8,
				footprintz = 7,
				height = 20,
				hitdensity = 100,
				metal = 715,
				object = "CORFHP_DEAD",
				reclaimable = true,
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
		},
		sounds = {
			build = "hoverok2",
			canceldestruct = "cancel2",
			underattack = "warning1",
			unitcomplete = "untdone",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "hoversl2",
			},
		},
	},
}
