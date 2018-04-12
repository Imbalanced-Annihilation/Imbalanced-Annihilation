function gadget:GetInfo()
	return {
		name		= "Corfing Fire",
		desc		= "Prevents corfing from moving/stopping while fires",
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

local CORFING = UnitDefNames["corfing"].id
local CORFING_SALVO = WeaponDefNames["corfing_corfing_salvo"].id
local RestoreFrames = 20

local fingtimers = {}

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	fingtimers[unitID] = nil
end

function gadget:GameFrame(n)
	for unitID, timer in pairs(fingtimers) do
		fingtimers[unitID] = timer - 1
		if fingtimers[unitID] == 0 then
			fingtimers[unitID] = nil
			local TurnRate = UnitDefs[CORFING].turnRate
			local Speed = UnitDefs[CORFING].speed
			Spring.MoveCtrl.SetGroundMoveTypeData(unitID, {turnRate = TurnRate, maxSpeed = Speed})
			Spring.SetUnitWeaponState(unitID, 1, "range", WeaponDefs[CORFING_SALVO].range)
		end
	end
end

function gadget:ProjectileCreated(proID, proOwnerID, weaponDefID)
	if weaponDefID == CORFING_SALVO then
		Spring.MoveCtrl.SetGroundMoveTypeData(proOwnerID, {turnRate = 0, maxSpeed = 0})
		Spring.SetUnitWeaponState(proOwnerID, 1, "range", 0) --to prevent from aiming
		fingtimers[proOwnerID] = RestoreFrames
	end
end
