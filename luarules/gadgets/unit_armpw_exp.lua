function gadget:GetInfo()
	return {
		name		= "Armpw Exp",
		desc		= "Sets armpw exp effect",
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

local ARMPW = UnitDefNames["armpw"].id
local ZIPPER_EMG = WeaponDefNames["armpw_zipper_emg"].id
local ZipperEmgLevel = 4

local updateList = {}

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if unitDefID == ARMPW then
		Spring.SetUnitWeaponState(unitID, 2, "range", 0)
	end
end

function gadget:GameFrame(n)
	for unitID in pairs(updateList) do
		local level = math.floor(Spring.GetUnitExperience(unitID))
        if level >= ZipperEmgLevel and Spring.GetUnitWeaponState(unitID, 2, "range") == 0 then
            SetUnitWeaponState(unitID, 2, "range", WeaponDefs[ZIPPER_EMG].range)
			SetUnitWeaponState(unitID, 1, "range", 0)
        end
    end
	updateList = {}
end

function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
	if attackerDefID == ARMPW then
		updateList[attackerID] = true
	end
end

function gadget:UnitDestroyed(unitID)
	updateList[unitID] = nil
end