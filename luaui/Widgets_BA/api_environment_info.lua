function widget:GetInfo()
	return {
		name      = "Environment Info API",
		desc      = "Provides info about units, features, ground",
		author    = "Krogoth",
		date      = "2018",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled   = true,
	}
end

function widget:Initialize()
	WG.GetUnitDefStatsForTooltip = GetUnitDefStatsForTooltip
	WG.GetUnitsInfo = GetUnitsInfo
	WG.GetPointedObjectInfo = GetPointedObjectInfo
	WG.GetUnitSelectionInfo = GetUnitSelectionInfo
	WG.GetGroundInfo = GetGroundInfo
	widgetHandler:RemoveWidget(self)
end

local NameColor = "\255\255\255\000"
local DefColor = "\255\255\255\255"
local EnergyColor = "\255\255\255\000"
local MetalColor = "\255\037\073\117"
local BuildTimeColor = "\255\131\000\000"
local ProductionColor = "\255\000\100\000"
local UpkeepColor = "\255\037\073\117"
local ValueColor = "\255\000\100\000"
local SpecialColor = "\255\000\000\000"

local LightProductionColor = "\255\000\255\000"
local LightUpkeepColor = "\255\255\000\000"
local LightValueColor = "\255\000\255\000"

function GetUnitDefStatsForTooltip(udef)
	--name:
	local text = NameColor..udef.humanName
	--short description:
	if udef.tooltip then
		text = text.." - "..DefColor..udef.tooltip
	end
	--stats:
	local params = udef.customParams
	if params then
		--cost:
		local e = EnergyColor.."E: "..DefColor..math.floor(udef.energyCost)
		local m = MetalColor.."M: "..DefColor..math.floor(udef.metalCost)
		local bt = BuildTimeColor.."BT: "..DefColor..math.floor(udef.buildTime)
		text = text..'\n'..m..DefColor..", "..e..DefColor..", "..bt
		--energy production:
		if params.tooltipenergy then
			local energy = udef.energyMake - udef.energyUpkeep
			text = text..'\n'..ValueColor.."Produces "..energy.." Energy"
		elseif params.tooltipenergyandstorage then
			local energy = udef.energyMake - udef.energyUpkeep
			text = text..'\n'..ValueColor.."Produces "..energy.." Energy"
			text = text..DefColor.." ("..udef.energyStorage.." Storage)"
		end
		--wind energy production:
		if params.tooltipwind then
			local wind = (Game.windMin + Game.windMax) * 0.5
			text = text..'\n'..ValueColor.."Produces average "..wind.." Energy"
		end
		--tidal energy production:
		if params.tooltiptidal then
			text = text..'\n'..ValueColor.."Produces "..Game.tidal.." Energy"
		end
		--metal production:
		if params.tooltipmetal then
			local metal = udef.extractsMetal * 1000
			text = text..'\n'..ProductionColor.."Produces "..metal.."x Metal"
		end
		--energy use:
		if params.tooltipupkeep then
			local upkeep = udef.energyUpkeep - udef.energyMake
			text = text..'\n'..UpkeepColor.."Uses "..upkeep.." Energy"
		end
		--health:
		text = text..'\n'..DefColor.."Health: "..ValueColor..udef.health
		--velocity:
		if udef.speed ~= 0 then
			text = text..", "..DefColor.."Velocity: "..ValueColor..udef.speed
		end
		--sight:
		if params.tooltipsight then
			text = text..'\n'..DefColor.."Sight Range: "..ValueColor..udef.losRadius
			if udef.losHeight > 5000 then
				text = text..DefColor.." (Unobstructed)"
			end
		end
		--radar:
		if params.tooltipradar then
			text = text..'\n'..DefColor.."Radar Range: "..ValueColor..udef.radarRadius
		end
		--sonar:
		if params.tooltipsonar then
			text = text..'\n'..DefColor.."Sonar Radius: "..ValueColor..udef.sonarRadius
		end
		--jammer:
		if udef.jammerRadius ~= 0 and not params.hidejammertooltip then
			text = text..'\n'..DefColor.."Jammer Radius: "..ValueColor..udef.jammerRadius
		end
		--worker time:
		if not params.hideworkertooltip then
			if udef.canAssist == true then
				text = text..'\n'..DefColor.."Build Speed: "..ValueColor..udef.buildSpeed
			end
			if udef.canResurrect == true then
				text = text..'\n'..DefColor.."Resurrection Speed: "..ValueColor..udef.resurrectSpeed
			end
		end
		--weapon (single):
		local singleWeapon
		local singleWeaponIndex
		local singleWeaponMainCategory
		if params.tooltipweapon then
			singleWeapon = params.tooltipweapon
			singleWeaponIndex = 1
			singleWeaponMainCategory = params.weaponmaincategory
		elseif params.tooltipweapon2 then
			singleWeapon = params.tooltipweapon2
			singleWeaponIndex = 2
			singleWeaponMainCategory = params.weapon2maincategory
		elseif params.tooltipweapon3 then
			singleWeapon = params.tooltipweapon3
			singleWeaponIndex = 3
			singleWeaponMainCategory = params.weapon3maincategory
		end
		if singleWeapon then
			text = text..'\n'..DefColor.."Weapon: "..NameColor..singleWeapon
			local weapondef = WeaponDefs[udef.weapons[singleWeaponIndex].weaponDef]
			if weapondef then
				text = text..DefColor.." ("..ValueColor..weapondef.range..DefColor.." Range"
				local mainCategoryId = 0
				if singleWeaponMainCategory then
					mainCategoryId = Game.armorTypes[singleWeaponMainCategory]
				end
				local damageRate = 1
				if params.weapondamagerate then
					damageRate = tonumber(params.weapondamagerate)
				end
				local damage = weapondef.damages[mainCategoryId] * damageRate
				local dps = math.floor(damage * weapondef.salvoSize / weapondef.reload)
				text = text..", "..ValueColor..dps..DefColor.." DPS)"
			end
		end
		--special:
		if params.specialtooltip then
			text = text..'\n'..SpecialColor..params.specialtooltip
		if params.specialtooltip2 then
			text = text..'\n'..SpecialColor..params.specialtooltip2
		if params.specialtooltip3 then
			text = text..'\n'..SpecialColor..params.specialtooltip3
		if params.specialtooltip4 then
			text = text..'\n'..SpecialColor..params.specialtooltip4
		if params.specialtooltip5 then
			text = text..'\n'..SpecialColor..params.specialtooltip5
		if params.specialtooltip6 then
			text = text..'\n'..SpecialColor..params.specialtooltip6
		if params.specialtooltip7 then
			text = text..'\n'..SpecialColor..params.specialtooltip7
		if params.specialtooltip8 then
			text = text..'\n'..SpecialColor..params.specialtooltip8
		if params.specialtooltip9 then
			text = text..'\n'..SpecialColor..params.specialtooltip9
		if params.specialtooltip10 then
			text = text..'\n'..SpecialColor..params.specialtooltip10
		end
		end
		end
		end
		end
		end
		end
		end
		end
		end
	end
	return text
end

local function unitCost(udef)
	return udef.metalCost + udef.energyCost*0.9
end

local function colorToChar(r,g,b)
	local min,max,floor = math.min,math.max,math.floor
	return string.char(255, min(max(floor(r*255),1),255), min(max(floor(g*255),1),255), min(max(floor(b*255),1),255))
end

function GetUnitsInfo(count, units, intro)
	--X/X Health, X Range
	--X Experience, X Cost
	--M: +-X, E: +-X

	local text
	if count ~= 0 then
		local teamID = Spring.GetUnitTeam(units[1])
		local _,playerID = Spring.GetTeamInfo(teamID)
		local playerName = Spring.GetPlayerInfo(playerID)
		local r,g,b = Spring.GetTeamColor(teamID)
		local teamColor = colorToChar(r,g,b)

		if count == 1 then
			local udef = UnitDefs[Spring.GetUnitDefID(units[1])]
			text = DefColor..intro..NameColor..udef.humanName..DefColor.." - "..teamColor..playerName
		else
			text = DefColor..intro..NameColor..count..DefColor.." - "..teamColor..playerName
		end

		local health,maxHealth,range,experience,cost,energyProduction,metalProduction = 0,0,0,0,0,0,0
		for i,unitID in pairs(units) do
			--health:
			local thisHealth,thisMaxHealth = Spring.GetUnitHealth(unitID)
			health = health + thisHealth
			maxHealth = maxHealth + thisMaxHealth
			--range:
			local thisRange = Spring.GetUnitMaxRange(unitID)
			if thisRange and thisRange > range then range = thisRange end
			--experience:
			experience = experience + (Spring.GetUnitExperience(unitID) or 0)
			--cost:
			cost = cost + unitCost(UnitDefs[Spring.GetUnitDefID(unitID)])
			--production:
			local thisMetalMake,thisMetalUse,thisEnergyMake,thisEnergyUse = Spring.GetUnitResources(unitID)
			energyProduction = energyProduction + (thisEnergyMake or 0)-(thisEnergyUse or 0)
			metalProduction = metalProduction + (thisMetalMake or 0)-(thisMetalUse or 0)
		end
		
		text = text..'\n'..LightValueColor..math.floor(health)..DefColor..'/'..math.floor(maxHealth).." Health, "..math.floor(range)..DefColor.." Range"
		text = text..'\n'..LightValueColor..(math.floor(experience*100)/100)..DefColor.." Experience, "..math.floor(cost)..DefColor.." Cost "
		local metalText,energyText
		if metalProduction == 0 then
			metalText = DefColor.."+0"
		elseif metalProduction > 0 then
			metalText = LightProductionColor..'+'..(math.floor(metalProduction*10)/10)
		else
			metalText = LightUpkeepColor..'-'..(-math.floor(metalProduction*10)/10)
		end
		if energyProduction == 0 then
			energyText = DefColor.."+0"
		elseif energyProduction > 0 then
			energyText = LightProductionColor..'+'..math.floor(energyProduction)
		else
			energyText = LightUpkeepColor..'-'..(-math.floor(energyProduction))
		end
		text = text..'\n'..MetalColor.."M: "..metalText..DefColor..", "..EnergyColor.."E: "..energyText
	end
	return text
end

function GetPointedObjectInfo()
	local mouseX,mouseY = Spring.GetMouseState()
	local type,id = Spring.TraceScreenRay(mouseX, mouseY)
	if type == "unit" then
		return GetUnitsInfo(1, {id}, "")
	elseif type == "feature" then
		return GetGroundInfo()
	else
		return nil
	end
end

function GetUnitSelectionInfo()
	return GetUnitsInfo(Spring.GetSelectedUnitsCount(), Spring.GetSelectedUnits(), "Selected: ")
end

function GetGroundInfo()
	return Spring.GetCurrentTooltip()
end