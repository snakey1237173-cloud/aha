const ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameData = ReplicatedStorage:WaitForChild("GameData")

return {
	
	FloorInfo = {

		Floor = GameData:WaitForChild("Floor"),
		FloorDestination = GameData:WaitForChild("FloorDestination"),
		FloorDestinationSpecific = GameData:WaitForChild("FloorDestinationSpecific"),
		FloorSpecific = GameData:WaitForChild("FloorSpecific"),

	},

	LiveEntites = workspace:WaitForChild("LiveEntities")
	
}
