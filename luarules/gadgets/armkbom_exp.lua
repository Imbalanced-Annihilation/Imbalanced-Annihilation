function gadget:GetInfo()
	return {
		name		= "Armkbom Exp",
		desc		= "Sets Armkbom exp effect",
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

ArmkbomDamageKoef = {1.0, 1.2, 1.4, 1.6, 1.7, 1.8, 1.9, 2.0}

local ARMKBOM = UnitDefNames["armkbom"].id

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
	if attackerDefID == ARMKBOM then
		local i = 1 + math.floor(Spring.GetUnitExperience(attackerID))
		local lim = table.getn(ArmkbomDamageKoef)
		if i > lim then
			i = lim
		end
		return (damage * ArmkbomDamageKoef[i]),1
	end
	return damage,1
end
