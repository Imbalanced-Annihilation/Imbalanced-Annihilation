function gadget:GetInfo()
	return {
		name		= "Armwar Nano",
		desc		= "Applies different repair speed to other units than armwar",
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

local ARMWAR = UnitDefNames["armwar"].id
local ArmWarDef = UnitDefs[ARMWAR]
local RepairSpeedModifier = -20

local warriors = {}

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if unitDefID == ARMWAR then
		warriors[unitID] = true
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	warriors[unitID] = nil
end

function gadget:GameFrame(n)
	for unitID in pairs(warriors) do
		local type = Spring.Utilities.GetUnitNanoTarget(unitID)
		if type then
			if type == ARMWAR then
				Spring.SetUnitBuildSpeed(unitID, ArmWarDef.buildSpeed,
					ArmWarDef.repairSpeed)
			else
				Spring.SetUnitBuildSpeed(unitID, ArmWarDef.buildSpeed,
					ArmWarDef.repairSpeed + RepairSpeedModifier)
			end
		end
	end
end
