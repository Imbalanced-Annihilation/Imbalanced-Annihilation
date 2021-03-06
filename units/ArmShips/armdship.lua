return {
	armdship = {
		activatewhenbuilt = true,
		airsightdistance = 500,
		autoheal = 1.5,
		blocking = true,
		buildcostenergy = 600,
		buildcostmetal = 80,
		buildpic = "ARMDSHIP.DDS",
		buildtime = 1690,
		canmove = true,
		category = "ALL NOTLAND MOBILE WEAPON NOTSUB SHIP NOTAIR NOTHOVER LIGHTBOAT SURFACE",
		collisionvolumeoffsets = "0 -4 1",
		collisionvolumescales = "26 26 68",
		collisionvolumetype = "CylZ",
		corpse = "DEAD",
		description = "Light Torpedo Boat",
		energymake = 0.2,
		energyuse = 0.2,
		explodeas = "mediumExplosionGeneric",
		floater = true,
		footprintx = 3,
		footprintz = 3,
		icontype = "sea",
		idleautoheal = 2,
		idletime = 900,
		maxdamage = 245,
		minwaterdepth = 6,
		movementclass = "BOAT43X3",
		name = "Hunter",
		nochasecategory = "VTOL UNDERWATER",
		objectname = "ARMDSHIP",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd",
		sightdistance = 500,
		sonardistance = 320,
		waterline = 2,
		-- move
		acceleration = 3.75/60,
		brakerate = 3.75/15,
		maxvelocity = 3.75,
		turninplace = true,
		turninplaceanglelimit = 110,
		turninplacespeedlimit = 0.64*3.75,
		turnrate = 430,
		--end move
		customparams = {
			
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0.255500793457 0.0 -1.26264953613",
				collisionvolumescales = "20.0704803467 16.0 67.0992736816",
				collisionvolumetype = "Box",
				damage = 250,
				description = "Hunter Wreckage",
				energy = 0.8*0,
				featuredead = "HEAP",
				footprintx = 1,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 0.8*55,
				object = "ARMDSHIP_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 516,
				description = "Hunter Heap",
				energy = 0.8*0,
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 0.8*27,
				object = "3X3A",
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
				[1] = "sharmmov",
			},
			select = {
				[1] = "sharmsel",
			},
		},
		weapondefs = {
			depthcharge = {
				areaofeffect = 12,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.8,
				explosiongenerator = "custom:FLASH4",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "smalltorpedo",
				name = "CruiserDepthCharge",
				noselfdamage = true,
				range = 240,
				reloadtime = 1.6,
				soundhit = "xplodep2",
				soundstart = "torpedo1",
				startvelocity = 110,
				tolerance = 32767,
				tracks = true,
				turnrate = 1.5*9800,
				turret = true,
				waterweapon = true,
				weaponacceleration = 15,
				weapontimer = 10,
				flighttime = 0.9,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 200,
				damage = {
					default = 32,
					lboats = 32,
					hvyboats = 24,
					subs = 110,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "LIGHTAIRSCOUT SHIP",
				def = "DEPTHCHARGE",
				onlytargetcategory = "NOTHOVER",
			},
		},
	},
}
