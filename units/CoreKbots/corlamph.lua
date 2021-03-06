return {
	corlamph = {
		acceleration = 0.384,
		brakerate = 0.75,
		buildcostenergy = 1700,
		buildcostmetal = 75,
		buildpic = "CORLAMPH.PNG",
		buildtime = 2327,
		canmove = true,
		category = "KBOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE CANBEUW",
		collisionvolumeoffsets = "0 -2 -3",
		collisionvolumescales = "24 28 24",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		description = "Light Amphibious Kbot",
		energymake = 0.3,
		energyuse = 0.3,
		explodeas = "smallexplosiongeneric",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 240,
		maxslope = 17,
		maxvelocity = 2.7,
		maxwaterdepth = 25,
		movementclass = "AKBOT2",
		name = "Lamprey",
		nochasecategory = "VTOL",
		objectname = "CORLAMPH",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd",
		sightdistance = 400,
		turninplace = true,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.848,
		turnrate = 810,
		upright = true,
		customparams = {
			tooltipWeapon = "Laser",
			weaponDamageRate = "2",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0.114540100098 -2.64214854004 2.11838531494",
				collisionvolumescales = "32.2373809814 13.5927429199 29.8415679932",
				collisionvolumetype = "Box",
				damage = 156,
				description = "A.K. Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 22,
				object = "CORAK_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 83,
				description = "A.K. Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 9,
				object = "2X2C",
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
				[1] = "servtny1",
			},
			select = {
				[1] = "servtny1",
			},
		},
		weapondefs = {
			lamph_laser = {
				areaofeffect = 8,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				duration = 0.017,
				energypershot = 0,
				explosiongenerator = "custom:genericshellexplosion-small",
				firestarter = 50,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 4,
				name = "Laser",
				noselfdamage = true,
				range = 230,
				reloadtime = 0.4,
				rgbcolor = "1 0 0",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				soundstart = "lasrfir1",
				--soundtrigger = 1,
				targetmoveerror = 0.15,
				thickness = 1.7,
				coreThickness = 0.1,
				tolerance = 10000,
				turret = true,
				weapontype = "LaserCannon",
				weaponvelocity = 1000,
				damage = {
					bombers = 4,
					default = 17,
					fighters = 4,
					subs = 1,
					vtol = 4,
				},
			},
			lamph_laser2 = {
				areaofeffect = 8,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				duration = 0.017,
				energypershot = 0,
				explosiongenerator = "custom:genericshellexplosion-small",
				firestarter = 50,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 4,
				name = "Laser",
				noselfdamage = true,
				range = 230,
				reloadtime = 0.4,
				rgbcolor = "1 0 0",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				--soundtrigger = 1,
				targetmoveerror = 0.15,
				thickness = 2.3,
				coreThickness = 0.1,
				tolerance = 10000,
				turret = true,
				weapontype = "LaserCannon",
				weaponvelocity = 1000,
				damage = {
					bombers = 4,
					default = 17,
					fighters = 4,
					subs = 1,
					vtol = 4,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "LAMPH_LASER",
				onlytargetcategory = "NOTSUB",
			},
			[2] = {
				badtargetcategory = "VTOL",
				def = "LAMPH_LASER2",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
