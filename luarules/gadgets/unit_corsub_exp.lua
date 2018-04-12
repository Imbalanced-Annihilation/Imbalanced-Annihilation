function gadget:GetInfo()
	return {
		name		= "Corsub Exp",
		desc		= "Sets corsub exp effect",
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

local CORSUB = UnitDefNames["corsub"].id
local UPGRADED_TORPEDO = WeaponDefNames["corsub_upgraded_torpedo"].id
local UpgradedTorpedoLevel = 5

local updateList = {}

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if unitDefID == CORSUB then
		Spring.SetUnitWeaponState(unitID, 2, "range", 0)
	end
end

function gadget:GameFrame(n)
	for unitID in pairs(updateList) do
		local level = math.floor(Spring.GetUnitExperience(unitID))
        if level >= ZipperEmgLevel and Spring.GetUnitWeaponState(unitID, 2, "range") == 0 then
            SetUnitWeaponState(unitID, 2, "range", WeaponDefs[UPGRADED_TORPEDO].range)
			SetUnitWeaponState(unitID, 1, "range", 0)
        end
    end
	updateList = {}
end

function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
	if attackerDefID == CORSUB then
		updateList[attackerID] = true
	end
end

function gadget:UnitDestroyed(unitID)
	updateList[unitID] = nil
end