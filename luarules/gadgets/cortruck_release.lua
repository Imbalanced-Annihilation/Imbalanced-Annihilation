function gadget:GetInfo()
	return {
		name = "Cortruck Release When Destroyed",
		desc = "Unloads last unit from cortruck when destroyed",
		author = "Krogoth",
		date = "2018",
		license = "WTFPL",
		layer = 0,
		enabled = true,
	}
end

if not gadgetHandler:IsSyncedCode() then
    return false
end

local CORTRUCK = UnitDefNames["cortruck"].id
local DestructionFrames = 5

local lastPassengers = {}
local passengerCounts = {}
local destructionCounters = {}
local protectedByTruck = {}

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	--truck:
	if unitDefID == CORTRUCK then
		passengerCounts[unitID] = 0
	--potential passenger:
	else
		protectedByTruck[unitID] = false
	end
end

function gadget:UnitLoaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
	local transportDefID = Spring.GetUnitDefID(transportID)
	if transportDefID == CORTRUCK then
		lastPassengers[transportID] = unitID
		passengerCounts[transportID] = passengerCounts[transportID] + 1
		protectedByTruck[unitID] = true
		Spring.SetUnitNoSelect(unitID, true)
	end
end

function gadget:UnitUnloaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
	local transportDefID = Spring.GetUnitDefID(transportID)
	if transportDefID == CORTRUCK then
		passengerCounts[transportID] = passengerCounts[transportID] - 1
		if passengerCounts[transportID] == 0 then
			lastPassengers[transportID] = nil
		end
		protectedByTruck[unitID] = false
		Spring.SetUnitNoSelect(unitID, false)
	end
end

function gadget:GameFrame(n)
	for unitID in pairs(destructionCounters) do
		destructionCounters[unitID] = destructionCounters[unitID] - 1
		if destructionCounters[unitID] == 0 then
			Spring.DestroyUnit(unitID)
			destructionCounters[unitID] = nil
		end
	end
end

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
	--truck:
	if unitDefID == CORTRUCK then
		if destructionCounters[unitID] then
			return 0,1
		elseif Spring.GetUnitHealth(unitID) <= damage and lastPassengers[unitID] then
			local passengerID = lastPassengers[unitID]
			Spring.UnitDetach(passengerID)
			lastPassengers[unitID] = nil
			destructionCounters[unitID] = DestructionFrames
			protectedByTruck[passengerID] = false
			Spring.SetUnitNoSelect(passengerID, false)
			return 0,1
		end
	--passenger:
	elseif protectedByTruck[unitID] then
		return 0,1
	end
	return damage,1
end
