const Players = game:GetService("Players")

local player = Players.LocalPlayer

local _User = {}

_User.GetKey = function()
	
	local KeyComponment = "6cec01a0-e884-4dbe-bf80-af41d1286ab9"

	local Key = player.UserId
	for i = 1, #KeyComponment do
		Key = bit32.bxor(Key,string.byte(KeyComponment,i))
		Key = bit32.band(Key * 16777619, 0xFFFFFFFF)
	end
	
	return Key
	
end

_User.IsInTable = function(idTable)
	
	if table.find(idTable, player.UserId) then

		return true

	else

		return false

	end
	
end

_User.Miku = function()
	
	local mikuUsers = {

		[1] = 5037267735,
		[2] = 3259425964,
		--	[3] = 3048261775

	}
	
	local useMiku = _User.IsInTable(mikuUsers)
	
	return useMiku
	
end

return _User

