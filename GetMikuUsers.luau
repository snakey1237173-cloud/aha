const Players = game:GetService("Players")

local player = Players.LocalPlayer

local useMikuGui = false

return function()

	local mikuUsers = {

		[1] = 5037267735,
		[2] = 3259425964,
		--	[3] = 3048261775

	}

	if table.find(mikuUsers, player.UserId) then

		useMikuGui = true

	end
	
	return useMikuGui
	
end
