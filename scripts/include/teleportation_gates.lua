--Handles Teleportation Gates along with unit_teleportation_gates gadget
--Author: Krogoth, 2018

UnloadRadius = 220
SFX = "genericshellexplosion-large-lightning"
Sound = "sounds/emgpuls1.wav"

local otherGates
local teleportedUnit,destX,destZ

function SetOtherGates(gates)
	otherGates = gates
end

function Teleportation()
	while (1) do
		if teleportedUnit then
			local x,y,z = Spring.GetUnitPosition(teleportedUnit)
			Spring.SpawnCEG(SFX, x,y,z)
			Spring.PlaySoundFile(Sound, 1, x,y,z, "sfx")
			Spring.SetUnitPosition(teleportedUnit, destX,destZ)
			x,y,z = Spring.GetUnitPosition(teleportedUnit)
			Spring.SpawnCEG(SFX, x,y,z)
			Spring.PlaySoundFile(Sound, 1, x,y,z, "sfx")
			--remove unit's load command if such is left:
			local commands = Spring.GetUnitCommands(teleportedUnit, 1)
			if #commands ~= 0 and commands[1].id == CMD.LOAD_ONTO and commands[1].params[1] == unitID then
				Spring.GiveOrderToUnit(teleportedUnit, CMD.REMOVE, {CMD.LOAD_ONTO}, {"alt"})
				Spring.GiveOrderToUnit(teleportedUnit, CMD.INSERT, {0, CMD.STOP, 0}, {"alt"})
			end
			teleportedUnit = nil
		end
		Sleep(100)
	end
end

function Teleport(unitID)
	if otherGates then
		while teleportedUnit do
			Sleep(100)
		end
		local targetX,targetY,targetZ = Spring.GetUnitPosition(otherGates)
		destX,destZ = Spring.Utilities.GetValidGroundPosition(unitID, targetX,targetZ, UnloadRadius, 10.0)
		if destX then
			teleportedUnit = unitID
		end
	end
end