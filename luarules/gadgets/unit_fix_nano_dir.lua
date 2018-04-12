function gadget:GetInfo()
	return {
		name		= "Fix Nano Dir",
		desc		= "Locks nanolathes towards the target (for COB scripts)",
			--Construction unit must have COB script with TurnNano(heading) method
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

local constructors = {}

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if Spring.GetCOBScriptID(unitID, "TurnNano") then
		constructors[unitID] = true
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	constructors[unitID] = nil
end

local function AngleBetween(unit1, unit2)
	local x1,y1,z1 = Spring.GetUnitPosition(unit1)
	local x2,y2,z2 = Spring.GetUnitPosition(unit2)
	local angle = math.atan2(x2-x1, z2-z1) * 180 / math.pi
	return angle
end

function gadget:GameFrame(n)
	for unitID in pairs(constructors) do
		local _,target = Spring.Utilities.GetUnitNanoTarget(unitID)
		if target then
			local margin = AngleBetween(unitID, target) * 32000 / 180
			local face = Spring.GetUnitHeading(unitID)
			local heading = margin - face
			Spring.CallCOBScript(unitID, "TurnNano", 0, heading)
		end
	end
end
