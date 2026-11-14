const Players = game:GetService("Players")

local player = Players.LocalPlayer

local ahaKey = {}

ahaKey.GetPlayerKey = function()
	
	local KeyComponment = "6cec01a0-e884-4dbe-bf80-af41d1286ab9"

	local Key = player.UserId
	for i = 1, #KeyComponment do
		Key = bit32.bxor(Key,string.byte(KeyComponment,i))
		Key = bit32.band(Key * 16777619, 0xFFFFFFFF)
	end

	return Key
	
end

return ahaKey
