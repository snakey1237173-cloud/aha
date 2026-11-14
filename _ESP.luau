local ESP = {}

ESP.ESPed = {}

ESP.ESPMalRoom = function(Room :Model)

	if Room:WaitForChild("Door"):FindFirstChild("HighlightPart") then return end

	local Door = Room:WaitForChild("Door"):WaitForChild("Door")

	local HighlightPart = Instance.new("Part",Room:WaitForChild("Door"))
	HighlightPart.Name = "HighlightPart"
	HighlightPart.Size = Door.Size
	HighlightPart.CFrame = Door.CFrame
	HighlightPart.Transparency = 1
	HighlightPart.Anchored = true
	HighlightPart.CanCollide = false
	HighlightPart.Material = Enum.Material.Glass
	HighlightPart.Reflectance = -math.huge

	local Weld = Instance.new("WeldConstraint",HighlightPart)
	Weld.Part0 = Door
	Weld.Part1 = HighlightPart

	HighlightPart.Anchored = false

	local Highlight = Instance.new("Highlight",HighlightPart)
	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.FillColor = Color3.fromRGB(0, 255, 255)
	Highlight.FillTransparency = 0.75
	Highlight.OutlineTransparency = 0.25
	Highlight.OutlineColor = Color3.fromRGB(0, 166, 216)

	local BillboardGui = Instance.new("BillboardGui")
	BillboardGui.Parent = HighlightPart
	BillboardGui.Size = UDim2.fromScale(3,2)
	BillboardGui.AlwaysOnTop = true
	BillboardGui.ClipsDescendants = false

	local Text = Instance.new("TextLabel")
	Text.Parent = BillboardGui
	Text.Size = UDim2.fromScale(1,0.75)
	Text.BackgroundTransparency = 1
	Text.BorderSizePixel = 0
	Text.TextColor3 = Color3.fromRGB(255, 255, 255)
	Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
	Text.Text = "Door "..tostring(tonumber(Room.Name)+1)
	Text.TextScaled = true
	Text.Font = Enum.Font.Highway

	local Studs = Instance.new("TextLabel")
	Studs.Parent = BillboardGui
	Studs.Size = UDim2.fromScale(1,0.5)
	Studs.Position = UDim2.fromScale(0,0.75)
	Studs.BackgroundTransparency = 1
	Studs.BorderSizePixel = 0
	Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
	Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
	Studs.Text = "30"
	Studs.TextScaled = true
	Studs.Font = Enum.Font.Highway

	local Running = true
	local co = coroutine.create(function()
		while Running do

			task.wait(0.25)
			local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-HighlightPart.Position).Magnitude)
			Studs.Text = "["..tostring(Distance).."]"
		end
	end)
	coroutine.resume(co)


	HighlightPart.Destroying:Connect(function()

		Running = false

	end)

	local SizeConstraint = Instance.new("UITextSizeConstraint")
	SizeConstraint.Parent = Text
	SizeConstraint.MaxTextSize = 1

	local UiStroke = Instance.new("UIStroke")
	UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
	UiStroke.Color = Color3.fromRGB(0, 0, 0)
	UiStroke.Thickness = 1
	
	table.insert(ESP.ESPed,Highlight)
	table.insert(ESP.ESPed,BillboardGui)

end

ESP.ESPMalThing = function(Thing :Instance)

	if Thing:GetAttribute("Checked") then return end

	if Thing.Name == "KeyObtain" or Thing.Name == "ElectricalKeyObtain" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(0, 255, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(0, 111, 17)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(1.5,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Key"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)


	elseif Thing.Name == "LeverForGate" or Thing.Name == "TimerLever" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(0, 255, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(0, 111, 17)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Lever"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "StairwellFireAlarm" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(0, 255, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(0, 111, 17)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Fire Alarm"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "LibraryHintPaper" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(0, 255, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(0, 111, 17)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Paper"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "LiveHintBook" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(0, 255, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(0, 111, 17)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Book"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "LiveBreakerPolePickup" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(0, 255, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(0, 111, 17)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(1.5,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Breaker"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "FuseObtain" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(0, 255, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(0, 111, 17)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(1.5,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Fuse"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "MinesGenerator" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(0, 255, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(0, 111, 17)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Generator"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)
		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1

		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "MinesAnchor" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(0, 255, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(0, 111, 17)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Anchor"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)


	elseif Thing.Name == "MinesGateButton" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(0, 255, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(0, 111, 17)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Button"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "Locker_Large" or Thing.Name == "Wardrobe" or 	Thing.Name == "Backdoor_Wardrobe" or Thing.Name == "Toolshed" or string.find(Thing.Name,"HidingSpot%d") or Thing.Name == "Bed" or Thing.Name == "CircularVent" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 213, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(255, 157, 0)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Closet"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)


	elseif Thing.Name == "SideroomDupe" then

		local Door = Thing:WaitForChild("DoorFake"):WaitForChild("Door")

		local HighlightPart = Instance.new("Part",Thing:WaitForChild("DoorFake"))
		HighlightPart.Name = "HighlightPart"
		HighlightPart.Size = Door.Size
		HighlightPart.CFrame = Door.CFrame
		HighlightPart.Transparency = 1
		HighlightPart.Anchored = true
		HighlightPart.CanCollide = true
		HighlightPart.Material = Enum.Material.Glass
		HighlightPart.Reflectance = -math.huge

		local Weld = Instance.new("WeldConstraint",HighlightPart)
		Weld.Part0 = Door
		Weld.Part1 = HighlightPart

		HighlightPart.Anchored = false

		local Highlight = Instance.new("Highlight",HighlightPart)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(177, 0, 0)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = HighlightPart
		BillboardGui.Size = UDim2.fromScale(3,2)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(229, 0, 0)
		Text.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Text.Text = "Dupe"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(229, 0, 0)
		Studs.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()
			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-HighlightPart.Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end
		end)

		HighlightPart.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "Grumbo" then -- TODO: Fix the grumbles

		local Queen = false

		if Thing:FindFirstChild("QueensMark",true) then

			Queen = true

		end

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(177, 0, 0)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(229, 0, 0)
		Text.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Text.Text = "Grumble"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(229, 0, 0)
		Studs.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		if Queen then

			Highlight.FillColor = Color3.fromRGB(217, 0, 255)
			Highlight.OutlineColor = Color3.fromRGB(112, 0, 177)
			Text.TextColor3 = Color3.fromRGB(191, 0, 229)
			Text.BorderColor3 = Color3.fromRGB(130, 0, 173)
			Text.Text = "Queen Grumble"
			Studs.TextColor3 = Color3.fromRGB(191, 0, 229)
			Studs.BorderColor3 = Color3.fromRGB(130, 0, 173)

		end

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "FigureRig" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(177, 0, 0)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(229, 0, 0)
		Text.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Text.Text = "Figure"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(229, 0, 0)
		Studs.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "SnareBase" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(177, 0, 0)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(229, 0, 0)
		Text.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Text.Text = "Snare"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(229, 0, 0)
		Studs.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "TV_Stand" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(177, 0, 0)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(229, 0, 0)
		Text.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Text.Text = "Noise TV"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(229, 0, 0)
		Studs.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "ChestBox" or Thing.Name == "ChestBoxLocked" or Thing.Name == "Chest_Vine" then

		if Thing:FindFirstChild("Highlight") then return end

		local Locked = false

		if Thing.Name == "ChestBoxLocked" then
			Locked = true
		end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 251)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(217, 0, 255)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Chest"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		if Locked == true then
			Text.Text = "Chest (Locked)"
			Highlight.FillColor = Color3.fromRGB(191, 0, 255)
			Highlight.OutlineColor = Color3.fromRGB(149, 0, 255)
		end

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "Toolshed_Small" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 251)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(217, 0, 255)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Toolshed"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "LotusPetalPickup" or Thing.Name == "LotusHolder" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 251)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(217, 0, 255)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(1.5,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Petal"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "Groundskeeper" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(177, 0, 0)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(229, 0, 0)
		Text.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Text.Text = "Groundskeeper"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(229, 0, 0)
		Studs.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "MandrakeLive" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 0)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(177, 0, 0)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(229, 0, 0)
		Text.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Text.Text = "Mandrake"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(229, 0, 0)
		Studs.BorderColor3 = Color3.fromRGB(173, 0, 0)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "Candy" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 251)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(217, 0, 255)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Candy"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "JewelryCase" then
		task.wait(0.2)

		if Thing:FindFirstChild("Highlight") then return end

		local Item = Thing:FindFirstChildWhichIsA("Model")

		if not Item then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 85, 127)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(85, 85, 127)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = Item.Name .. " in jewelry case"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local ItemHigh = Highlight:Clone()
		ItemHigh.Parent = Item
		ItemHigh.FillColor = Color3.fromRGB(255, 204, 0)
		ItemHigh.OutlineColor = Color3.fromRGB(255, 149, 0)
		ItemHigh.Parent = Item

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,ItemHigh)
		table.insert(ESP.ESPed,BillboardGui)

	elseif Thing.Name == "DepotHalloween" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 251)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(0, 255, 127)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = "Depot"
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)


	elseif Thing.Name == "FloorLootItem" then
		task.wait(0.2)

		local Item = Thing:FindFirstChildWhichIsA("Model")

		if not Item then return end
		if Item.Name == "GoldPile" then return end

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Item)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(255, 0, 251)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(217, 0, 255)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Item
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = Item.Name
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Item:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Item.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)


	end

	if Thing.Parent and Thing.Parent.Name == "SalvageItems" then

		if Thing:FindFirstChild("Highlight") then return end

		local Highlight = Instance.new("Highlight",Thing)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.FillColor = Color3.fromRGB(119, 0, 255)
		Highlight.FillTransparency = 0.75
		Highlight.OutlineTransparency = 0.25
		Highlight.OutlineColor = Color3.fromRGB(72, 0, 255)

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = Thing
		BillboardGui.Size = UDim2.fromScale(2,1)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.ClipsDescendants = false

		local Text = Instance.new("TextLabel")
		Text.Parent = BillboardGui
		Text.Size = UDim2.fromScale(1,0.75)
		Text.BackgroundTransparency = 1
		Text.BorderSizePixel = 0
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Text.Text = Thing.Name
		Text.TextScaled = true
		Text.Font = Enum.Font.Highway

		local Studs = Instance.new("TextLabel")
		Studs.Parent = BillboardGui
		Studs.Size = UDim2.fromScale(1,0.5)
		Studs.Position = UDim2.fromScale(0,0.75)
		Studs.BackgroundTransparency = 1
		Studs.BorderSizePixel = 0
		Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
		Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
		Studs.Text = "30"
		Studs.TextScaled = true
		Studs.Font = Enum.Font.Highway

		local Running = true
		local co = coroutine.create(function()

			while Running do

				task.wait(1)
				local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Thing:GetPivot().Position).Magnitude)
				Studs.Text = "["..tostring(Distance).."]"
			end

		end)
		coroutine.resume(co)

		Thing.Destroying:Connect(function()

			Running = false

		end)

		local SizeConstraint = Instance.new("UITextSizeConstraint")
		SizeConstraint.Parent = Text
		SizeConstraint.MaxTextSize = 1

		local UiStroke = Instance.new("UIStroke")
		UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		UiStroke.Color = Color3.fromRGB(0, 0, 0)
		UiStroke.Thickness = 1
		
		table.insert(ESP.ESPed,Highlight)
		table.insert(ESP.ESPed,BillboardGui)

	end

	Thing:SetAttribute("Checked")

end

local IDs = {}

ESP.ESPMalHoncho = function(Room :Model)

	for _, Thing in Room:GetDescendants() do

		if Thing.Name == "ArchivesPackageDeposit" then

			local ID = Thing:GetAttribute("BoxID")

			table.insert(IDs,ID)

			for _, Box in Room:GetDescendants() do

				if Box.Name == "ArchivesStorageBox" then

					local BoxID = Box:GetAttribute("Tool_BoxID")

					if table.find(IDs,BoxID) then

						if Box:FindFirstChild("Highlight") then continue end

						local Highlight = Instance.new("Highlight",Box)
						Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						Highlight.FillColor = Color3.fromRGB(0, 255, 0)
						Highlight.FillTransparency = 0.75
						Highlight.OutlineTransparency = 0.25
						Highlight.OutlineColor = Color3.fromRGB(0, 111, 17)

						local BillboardGui = Instance.new("BillboardGui")
						BillboardGui.Parent = Box
						BillboardGui.Size = UDim2.fromScale(2,1)
						BillboardGui.AlwaysOnTop = true
						BillboardGui.ClipsDescendants = false

						local Text = Instance.new("TextLabel")
						Text.Parent = BillboardGui
						Text.Size = UDim2.fromScale(1.5,1)
						Text.BackgroundTransparency = 1
						Text.BorderSizePixel = 0
						Text.TextColor3 = Color3.fromRGB(255, 255, 255)
						Text.BorderColor3 = Color3.fromRGB(0, 113, 170)
						Text.Text = "Box " .. tostring(BoxID)
						Text.TextScaled = true
						Text.Font = Enum.Font.Highway

						local Studs = Instance.new("TextLabel")
						Studs.Parent = BillboardGui
						Studs.Size = UDim2.fromScale(1,0.5)
						Studs.Position = UDim2.fromScale(0,0.75)
						Studs.BackgroundTransparency = 1
						Studs.BorderSizePixel = 0
						Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
						Studs.BorderColor3 = Color3.fromRGB(0, 113, 170)
						Studs.Text = "30"
						Studs.TextScaled = true
						Studs.Font = Enum.Font.Highway

						local Running = true
						local co = coroutine.create(function()

							while Running do

								task.wait(1)
								local Distance = math.round((game.Players.LocalPlayer.Character:GetPivot().Position-Box:GetPivot().Position).Magnitude)
								Studs.Text = "["..tostring(Distance).."]"
							end

						end)
						coroutine.resume(co)

						Box.Destroying:Connect(function()

							Running = false

						end)

						local SizeConstraint = Instance.new("UITextSizeConstraint")
						SizeConstraint.Parent = Text
						SizeConstraint.MaxTextSize = 1

						local UiStroke = Instance.new("UIStroke")
						UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
						UiStroke.Color = Color3.fromRGB(0, 0, 0)
						UiStroke.Thickness = 1					
						
						table.insert(ESP.ESPed,Highlight)
						table.insert(ESP.ESPed,BillboardGui)

					end

				end

			end


		end

	end

end

ESP.ESPChange = function(Enable :boolean)
	
	if Enable then
		
		for _, v in ESP.ESPed do
			
			v.Enabled = true
			
		end
		
	else
		
		for _, v in ESP.ESPed do

			v.Enabled = false

		end
		
	end
	
end

return ESP

