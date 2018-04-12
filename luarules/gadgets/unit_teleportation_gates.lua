function gadget:GetInfo()
	return {
		name = "Teleportation Gates",
		desc = "Handles building, activation and approaching units with teleportationGates unitdef custom tag.",
			--Units with teleportationGates unitdef custom tag must have SetOtherGates(gates) method
			--Teleportation Gates builders may have teleportationGatesBuildSpeedModifier custom param
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

local GuardLoadEdge = 200

local allyTeamGates1 = {}
local allyTeamGates2 = {}

local builderSpeeds = {}
local approachingUnitsInfo = {}

function gadget:GameFrame(n)
	--adjust builder's speed:
	for builder,buildSpeeds in pairs(builderSpeeds) do
		local type,target,isFeature = Spring.Utilities.GetUnitNanoTarget(builder)
		if type and not isFeature and UnitDefs[Spring.GetUnitDefID(target)].customParams.teleportationgates then
			Spring.SetUnitBuildSpeed(builder, buildSpeeds[2])
		else
			Spring.SetUnitBuildSpeed(builder, buildSpeeds[1])
		end
	end
	--replace load with guard for certain range where structure-unit interaction is weird:
	for unitID,info in pairs(approachingUnitsInfo) do
		local gates = info[1]
		local phase = info[2]
		local removed
		local commands = Spring.GetUnitCommands(unitID, 1)
		if #commands ~= 0 then
			--remove load/guard commands (before replacing):
			if commands[1].id == CMD.LOAD_ONTO then
				if phase == 1 then
					Spring.GiveOrderToUnit(unitID, CMD.REMOVE, {commands[1].tag}, {})
					info[2] = 2
				end
			elseif commands[1].id == CMD.GUARD then
				if phase == 3 and Spring.GetUnitSeparation(unitID, gates) < GuardLoadEdge then
					Spring.GiveOrderToUnit(unitID, CMD.REMOVE, {commands[1].tag}, {})
					info[2] = 4
				end
			else
				removed = true
			end
		else
			removed = true
		end
		if removed then
			phase = info[2]
			--replacing load/guard with guard/load:
			if phase == 2 then
				Spring.GiveOrderToUnit(unitID, CMD.INSERT, {0, CMD.GUARD, 0, gates}, {"alt"})
				info[2] = 3
			elseif phase == 4 then
				Spring.GiveOrderToUnit(unitID, CMD.INSERT, {0, CMD.LOAD_ONTO, 0, gates}, {"alt"})
				approachingUnitsInfo[unitID] = nil
			end
		end
	end
end

function gadget:AllowUnitCreation(unitDefID, builderID, builderTeam, x, y, z, facing)
	if UnitDefs[unitDefID].customParams.teleportationgates then
		local _1,_2,_3,_4,_5,allyTeamID = Spring.GetTeamInfo(builderTeam)
		if allyTeamGates1[allyTeamID] and allyTeamGates2[allyTeamID] then
			return false
		end
	end
	return true
end

function gadget:AllowUnitBuildStep(builderID, builderTeam, unitID, unitDefID, part)
	if UnitDefs[unitDefID].customParams.teleportationgates then
		local _1,_2,_3,_4,_5,allyTeamID = Spring.GetTeamInfo(builderTeam)
		if allyTeamGates1[allyTeamID] and allyTeamGates2[allyTeamID] then
			return false
		end
	end
	return true
end

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	--watch potential builder:
	local param = UnitDefs[unitDefID].customParams.teleportationgatesbuildspeedmodifier
	if param then
		builderSpeeds[unitID] = {UnitDefs[unitDefID].buildSpeed, UnitDefs[unitDefID].buildSpeed*tonumber(param)}
	end
end

function gadget:UnitFinished(unitID, unitDefID, teamID)
	--set team gates:
	if UnitDefs[unitDefID].customParams.teleportationgates then
		local _1,_2,_3,_4,_5,allyTeamID = Spring.GetTeamInfo(teamID)
		if not allyTeamGates1[allyTeamID] then
			allyTeamGates1[allyTeamID] = unitID
		else
			allyTeamGates2[allyTeamID] = unitID
		end
		local gates1,gates2 = allyTeamGates1[allyTeamID],allyTeamGates2[allyTeamID]
		if gates1 and gates2 then
			--activate both gates:
			Spring.UnitScript.CallAsUnit(gates1, Spring.UnitScript.GetScriptEnv(gates1).SetOtherGates, gates2)
			Spring.UnitScript.CallAsUnit(gates2, Spring.UnitScript.GetScriptEnv(gates2).SetOtherGates, gates1)
		end
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, builderID)
	if UnitDefs[unitDefID].customParams.teleportationgates then
		local _1,_2,_3,_4,_5,allyTeamID = Spring.GetTeamInfo(teamID)
		if unitID == allyTeamGates1[allyTeamID] then
			allyTeamGates1[allyTeamID] = allyTeamGates2[allyTeamID]
		end
		allyTeamGates2[allyTeamID] = nil
		--deactivate the other gates:
		if allyTeamGates1[allyTeamID] then
			local env = Spring.UnitScript.GetScriptEnv(unitID)
			Spring.UnitScript.CallAsUnit(unitID, env.SetOtherGates, nil)
		end
	end
end

function gadget:UnitCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOpts, cmdTag)
	if cmdID == CMD.LOAD_ONTO and UnitDefs[Spring.GetUnitDefID(cmdParams[1])].customParams.teleportationgates then
		--watch unit approaching gates:
		if Spring.GetUnitSeparation(unitID, cmdParams[1]) >= GuardLoadEdge then
			approachingUnitsInfo[unitID] = {cmdParams[1], 1}
		end
	end
end
