base, flap1, flap2, flap3, dish, door, arm, gun, plate, turret, shield =
piece('base', 'flap1', 'flap2', 'flap3', 'dish', 'door', 'arm', 'gun', 'plate', 'turret', 'shield')

include("include/teleportation_gates.lua")
common = include("headers/common_includes_lus.lua")

function script.Create()
	StartThread(common.SmokeUnit, {base, door, plate})
	StartThread(Teleportation)
end

function script.TransportPickup(unitID)
	Teleport(unitID)
end

function script.Killed()
	--Explode(arm, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)-- + BITMAP1 + 128)
	--Explode(base, SFX.SHATTER)-- + 128)
	--Explode(door, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)-- + BITMAP4 + 128)
	--Explode(flap1, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)-- + BITMAP5 + 128)
	--Explode(flap2, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)-- + BITMAP1 + 128)
	--Explode(flap3, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)-- + BITMAP2 + 128)
	--Explode(gun, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)-- + BITMAP3 + 128)
	--Explode(plate, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)-- + BITMAP4 + 128)
	--Explode(turret, SFX.SHATTER + SFX.EXPLODE_ON_HIT)-- + BITMAP5 + 128)
	return 3
end
