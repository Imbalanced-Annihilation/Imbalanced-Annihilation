return {
	armdf = {
		acceleration = 0,
		brakerate = 0,
		buildangle = 4096,
		buildcostenergy = 100,
		buildcostmetal = 370,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 6,
		buildinggrounddecalsizey = 6,
		buildinggrounddecaltype = "armdf_aoplane.dds",
		buildpic = "ARMFUS.DDS",
		buildtime = 7500,
		canrepeat = false,
		category = "ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 0 -2",
		collisionvolumescales = "91 57 59",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		decoyfor = "armfus",
		description = "Produces Energy / Storage",
		explodeas = "mediumBuildingexplosiongeneric",
		footprintx = 5,
		footprintz = 4,
		hidedamage = true,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 4650,
		maxslope = 10,
		maxwaterdepth = 0,
		name = "Fusion Reactor",
		objectname = "ARMFUS",
		seismicsignature = 0,
		selfdestructas = "mediumBuildingExplosionGenericSelfd",
		sightdistance = 210,
		usebuildinggrounddecal = true,
		yardmap = "ooooooo ooooooo ooooooo ooooooo",
		customparams = {
			tooltipDecoy = true,
			techlevel = 2,
			removewait = true,
			removestop = true,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.420112609863 0.0956184448242 -0.353080749512",
				collisionvolumescales = "98.7820892334 38.6634368896 65.8547515869",
				collisionvolumetype = "Box",
				damage = 2790,
				description = "Fusion Reactor Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 5,
				footprintz = 4,
				height = 40,
				hitdensity = 100,
				metal = 222,
				object = "ARMFUS_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 1395,
				description = "Fusion Reactor Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 4,
				footprintz = 4,
				height = 4,
				hitdensity = 100,
				metal = 89,
				object = "4X4A",
                collisionvolumescales = "85.0 14.0 6.0",
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
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "fusion1",
			},
		},
	},
}
