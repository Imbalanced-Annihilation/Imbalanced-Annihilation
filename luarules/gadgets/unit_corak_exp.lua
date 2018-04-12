function gadget:GetInfo()
	return {
		name		= "Corak Exp",
		desc		= "Sets corak exp effect",
		author		= "Krogoth",
		date		= "2018",
		license		= "WTFPL",
		layer		= 0,
		enabled		= true
	}
end

if not gadgetHandler:IsSyncedCode() then
    return false
end

local CORAK = UnitDefNames["corak"].id
local HEAVY_LASER = WeaponDefNames["corak_heavy_laser"].id
local HeavyLaserLevel = 8

local updateList = {}

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if unitDefID == CORAK then
		Spring.SetUnitWeaponState(unitID, 2, "range", 0)
	end
end

function gadget:GameFrame(n)
	for unitID in pairs(updateList) do
		local level = math.floor(Spring.GetUnitExperience(unitID))
        if level >= HeavyLaserLevel and Spring.GetUnitWeaponState(unitID, 2, "range") == 0 then
            SetUnitWeaponState(unitID, 2, "range", WeaponDefs[HEAVY_LASER].range)
			SetUnitWeaponState(unitID, 1, "range", 0)
        end
    end
	updateList = {}
end

function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
	if attackerDefID == CORAK then
		updateList[attackerID] = true
	end
end

function gadget:UnitDestroyed(unitID)
	updateList[unitID] = nil
end