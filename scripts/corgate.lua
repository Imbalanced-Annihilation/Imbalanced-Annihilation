base, beam, arms, disha, dishb, gun, legs, platform, shield =
piece('base', 'beam', 'arms', 'disha', 'dishb', 'gun', 'legs', 'platform', 'shield')

include("include/teleportation_gates.lua")
common = include("headers/common_includes_lus.lua")

function script.Create()
	StartThread(common.SmokeUnit, {base, arms, platform})
	StartThread(Teleportation)
end

function script.TransportPickup(unitID)
	Teleport(unitID)
end

function script.Killed()
	--Explode(arms, SFX.SHATTER + SFX.EXPLODE_ON_HIT + SFX.NO_HEATCLOUD)-- + BITMAP1)
	--Explode(base, SFX.SHATTER + SFX.NO_HEATCLOUD)
	--Explode(beam, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT + SFX.NO_HEATCLOUD)-- + BITMAP3)
	--Explode(disha, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT + SFX.NO_HEATCLOUD)-- + BITMAP4)
	--Explode(dishb, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT + SFX.NO_HEATCLOUD)-- + BITMAP5)
	--Explode(platform, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT + SFX.NO_HEATCLOUD)-- + BITMAP3)
	return 3
end