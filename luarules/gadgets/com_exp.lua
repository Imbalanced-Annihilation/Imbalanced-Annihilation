function gadget:GetInfo()
	return {
		name		= "Commander Exp",
		desc		= "Sets Commander exp effect",
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

ArmComDamageKoef = {1.0, 1.1, 1.2, 1.3, 1.4, 1.5}
CorComDamageKoef = {1.0, 1.15, 1.3, 1.4, 1.5, 1.6}

local ARMCOM = UnitDefNames["armcom"].id
local CORCOM = UnitDefNames["corcom"].id

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
	if attackerDefID == ARMCOM then
		local i = 1 + math.floor(Spring.GetUnitExperience(attackerID))
		local lim = table.getn(ArmComDamageKoef)
		if i > lim then
			i = lim
		end
		return (damage * ArmComDamageKoef[i]),1
	elseif attackerDefID == CORCOM then
		local i = 1 + math.floor(Spring.GetUnitExperience(attackerID))
		local lim = table.getn(CorComDamageKoef)
		if i > lim then
			i = lim
		end
		return (damage * CorComDamageKoef[i]),1
	end
	return damage,1
end
