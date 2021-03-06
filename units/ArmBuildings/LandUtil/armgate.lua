return {
	armgate = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 2048,
		buildcostenergy = 70000,
		buildcostmetal = 3000,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 6,
		buildinggrounddecalsizey = 6,
		buildinggrounddecaltype = "armgate_aoplane.dds",
		buildpic = "ARMGATE.DDS",
		buildtime = 55000000,
		category = "ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 0 1",
		collisionvolumescales = "57 37 57",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		description = "Teleportation Device",
		energystorage = 1500,
		explodeas = "energystorage",
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 7000,
		maxslope = 10,
		maxwaterdepth = 0,
		name = "Gates",
		objectname = "ARMGATE",
		onoffable = false,
		script = "ARMGATE.LUA",
		seismicsignature = 0,
		selfdestructas = "energystorageSelfd",
		sightdistance = 273,
		transportCapacity = 100,
		transportSize = 4,
		transportUnloadMethod = 0,
		loadingRadius = 170,
		unloadSpread = 4,
		usebuildinggrounddecal = true,
		yardmap = "oooooooooooooooo",
		customParams = {
			specialTooltip = "Maximum 2 Gates per team",
			specialTooltip2 = "Commanders have 1000x Build Speed towards it",
			teleportationGates = true,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0 -2.91625976558e-05 -0.414924621582",
				collisionvolumescales = "57.2399902344 32.5033416748 63.3298492432",
				collisionvolumetype = "Box",
				damage = 1900,
				description = "Keeper Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 2000,
				object = "ARMGATE_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 900,
				description = "Keeper Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 800,
				object = "2X2D",
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
				[1] = "drone1",
			},
			select = {
				[1] = "drone1",
			},
		},
	},
}
