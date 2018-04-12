--Returns first found not blocked ground position with some range limit and search step
--Currently not considers unit's size
--Author: Krogoth, 2018

function Spring.Utilities.GetValidGroundPosition(unitID, startX,startZ, range, step)
	local maxLength = math.floor(range / step)
	--order of steps: x+, z-, x-, z+
	
	local x,z = startX,startZ
	z = z + step
	local stepSide = 1
	local length = 1
	while Spring.GetGroundBlocked(x,z) do
		if stepSide == 1 then
			x = x + step*length
			stepSide = 2
		elseif stepSide == 2 then
			z = z - step*length
			stepSide = 3
		elseif stepSide == 3 then
			x = x - step*length
			stepSide = 4
		else
			z = z + step*length
			stepSide = 1
		end
		if length >= maxLength then
			return nil
		end
		length = length + 1
	end
	return x,z
end
