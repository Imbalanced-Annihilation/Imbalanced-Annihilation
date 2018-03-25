return {
	armkbom = {
		acceleration = 0.12,
		brakerate = 0.564,
		buildcostenergy = 1450,
		buildcostmetal = 110,
		buildpic = "ARMKBOM.PNG",
		buildtime = 1987,
		canmove = true,
		category = "KBOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 0 2",
		collisionvolumescales = "26.637012481689 28.637012481689 17.637012481689",
		collisionvolumetype = "box",
		corpse = "DEAD",
		description = "Stealthy Bomber Kbot (Unobstructed Vision)",
		energymake = 0.6,
		energyuse = 0.6,
		explodeas = "smallExplosionGeneric",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 470,
		maxslope = 14,
		maxvelocity = 1.7,
		maxwaterdepth = 12,
		movementclass = "KBOT2",
		name = "Meerkat",
		nochasecategory = "VTOL",
		objectname = "ARMKBOM",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd",
		sightdistance = 400,
		losEmitHeight = 9999,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.1484,
		turnrate = 1106,
		upright = true,
		customparams = {
			description_long = "",  
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.570877075195 -3.63811154541 -0.184501647949",
				collisionvolumescales = "29.8971862793 8.38395690918 32.6823883057",
				collisionvolumetype = "Box",
				damage = 490,
				description = "Meerkat Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 40,
				hitdensity = 100,
				metal = 63,
				object = "ARMKBOM_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 295,
				description = "Meerkat Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 25,
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
 				"deathceg3",
 				"deathceg2",
 			}, 
			explosiongenerators = {
				[1] = "custom:rocketflare",
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
				[1] = "kbarmmov",
			},
			select = {
				[1] = "kbarmsel",
			},
		},
		weapondefs = {
			arm_kbom = {
				areaofeffect = 74,
				avoidfeature = false,
				craterareaofeffect = 105,
				craterboost = 0,
				cratermult = 0,
				--edgeEffectiveness = 0.4,
				explosiongenerator = "custom:genericshellexplosion-medium",
				gravityaffected = "true",
				hightrajectory = 1,
				myGravity = 0.47,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "PlasmaBomb",
				noselfdamage = true,
				range = 325,
				reloadtime = 1.5,
				rgbcolor = "1 1 0.47",
				soundhit = "flakhit",
				soundhitwet = "splsmed",
				soundhitwetvolume = 0.5,
				soundstart = "flakfire",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 340,
				size = 1.7,
				stages = 50,
				damage = {
					bombers = 13,
					default = 140,
					fighters = 13,
					subs = 5,
					vtol = 13,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "ARM_KBOM",
				maindir = "0 0 1",
				maxangledif = 180,
				onlytargetcategory = "SURFACE",
			},
		},
	},
}