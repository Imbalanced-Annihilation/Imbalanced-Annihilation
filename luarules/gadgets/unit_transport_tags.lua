function gadget:GetInfo()
	return {
		name      = "Unit transport tags",
		desc      = "Handles unitdef custom tags: notTransportedByOthers, paratrooper, unloadedFlatGround",
			--based on unit_transportable_nanos by Beherith and unit_transportfix by knorke and bluestone
			author    = "Krogoth, Beherith, knorke, bluestone",
		date      = "2018",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled   = true
	}
end

if not gadgetHandler:IsSyncedCode() then
	return false
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions, cmdTag, synced)
	if cmdID == CMD.LOAD_UNITS then
		if #cmdParams == 1 then --if unit is target
			if Spring.ValidUnitID(cmdParams[1]) then 
				local udef = UnitDefs[Spring.GetUnitDefID(cmdParams[1])]
				if Spring.GetUnitTeam(cmdParams[1]) ~= teamID and udef.customParams.nottransportedbyothers then
					return false
				end
			end
		end
	elseif cmdID == CMD.UNLOAD_UNITS then
		local transportedUnits = Spring.GetUnitIsTransporting(unitID)
		if transportedUnits then
			if #transportedUnits ~= 0 then
				local udef = UnitDefs[Spring.GetUnitDefID(transportedUnits[1])]
				if udef.customParams.unloadedflatground then
					local x,y,z = Spring.GetGroundNormal(cmdParams[1], cmdParams[3])
					if cmdParams[2] < 0 or y < 0.9 then
						return false
					end
				end
			end
		end
	end
	return true
end

probablyCrashingUnits = {}

VFS.Include("unitconfigs/transport_survivors.lua")

local function HasValue(tab, val)
	for i,value in ipairs(tab) do
		if value == val then
			return true
		end
	end
	return false
end

function gadget:UnitUnloaded(unitID, unitDefID, teamID, transportID)
	if UnitDefs[unitDefID].customParams.paratrooper or
		(TransportSurvivors[unitDefID] and HasValue(TransportSurvivors[unitDefID], Spring.GetUnitDefID(transportID)))
	then
		Spring.GiveOrderToUnit(unitID, CMD.STOP, {}, {})
	else
		probablyCrashingUnits[unitID] = transportID
	end
end

function gadget:GameFrame(n)
	for unitID,transportID in pairs(probablyCrashingUnits) do
		--check that trans is dead/crashing and unit is still alive:
		if not Spring.GetUnitIsDead(unitID) and
			(Spring.GetUnitIsDead(transportID) or (Spring.GetUnitMoveTypeData(transportID).aircraftState == "crashing"))
		then
			Spring.DestroyUnit(unitID, true, false) 
		end
	end
	probablyCrashingUnits = {}
end