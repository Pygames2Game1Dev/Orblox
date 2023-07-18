local ui = {
	windowcount = 0
}

local dragger = {}
local resizer = {}

do
	local mouse = game.Players.LocalPlayer:GetMouse()
	local inputService = game.UserInputService
	local heartbeat = game.RunService.Heartbeat
	function dragger.new(frame)
		local s, event = pcall(function()
			return frame.MouseEnter
		end)

		if s then
			frame.Active = true

			event:connect(function()
				local input = frame.InputBegan:connect(function(key)
					if key.UserInputType == Enum.UserInputType.MouseButton1 then
						local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y)
						while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Quad', 0.1, true)
						end
					end
				end)

				local leave
				leave = frame.MouseLeave:connect(function()
					input:disconnect()
					leave:disconnect()
				end)
			end)
		end
	end

	function resizer.new(p, s)
		p:GetPropertyChangedSignal('AbsoluteSize'):connect(function()
			s.Size = UDim2.new(s.Size.X.Scale, s.Size.X.Offset, s.Size.Y.Scale, p.AbsoluteSize.Y)
		end)
	end
end


local defaults = {
	txtcolor = Color3.fromRGB(255, 255, 255),
	underline = Color3.fromRGB(0, 255, 140),
	barcolor = Color3.fromRGB(40, 40, 40),
	bgcolor = Color3.fromRGB(30, 30, 30)
}

function ui:Create(class, props)
	local object = Instance.new(class)

	for i, prop in next, props do
		if i ~= 'Parent' then
			object[i] = prop
		end
	end

	object.Parent = props.Parent
	return object
end

function ui:CreateWindow(options)
	assert(options.text, 'no name')
	local window = {
		count = 0,
		toggles = {},
		closed = false
	}

	local options = options or {}
	setmetatable(options, {__index = defaults})

	self.windowcount = self.windowcount + 1

	ui.gui = ui.gui or self:Create('ScreenGui', {Name = tostring(math.random(100000000,  1000000000)), Parent = game.CoreGui})
	window.frame = self:Create('Frame', {
		Name = options.text,
		Parent = self.gui,
		Active = true,
		BackgroundTransparency = 0,
		Size = UDim2.new(0, 190, 0, 30),
		Position = UDim2.new(0, (15 + ((200 * self.windowcount) - 200)), 0, 15),
		BackgroundColor3 = options.barcolor,
		BorderSizePixel = 0
	})

	window.background = self:Create('Frame', {
		Name = 'Background',
		Parent = window.frame,
		BorderSizePixel = 0,
		BackgroundColor3 = options.bgcolor,
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0, 25),
		ClipsDescendants = true
	})

	window.container = self:Create('Frame', {
		Name = 'Container',
		Parent = window.frame,
		BorderSizePixel = 0,
		BackgroundColor3 = options.bgcolor,
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0.3, 0),
		ClipsDescendants = true
	})

	window.organizer = self:Create('UIListLayout', {
		Name = 'Sorter',
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = window.container
	})

	window.padder = self:Create('UIPadding', {
		Name = 'Padding',
		PaddingLeft = UDim.new(0, 10),
		PaddingTop = UDim.new(0, 5),
		Parent = window.container
	})

	self:Create('Frame', {
		Name = 'Underline',
		Size = UDim2.new(1, 0, 0, 1),
		Position = UDim2.new(0, 0, 1, -1),
		BorderSizePixel = 0,
		BackgroundColor3 = options.underline,
		Parent = window.frame
	})

	local togglebutton = self:Create('TextButton', {
		Name = 'Toggle',
		ZIndex = 2,
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -25, 0, 0),
		Size = UDim2.new(0, 25, 1, 0),
		Text = '-',
		TextSize = 17,
		TextColor3 = options.txtcolor,
		Font = Enum.Font.SourceSans,
		Parent = window.frame
	})

	togglebutton.MouseButton1Click:connect(function()
		window.closed = not window.closed
		togglebutton.Text = (window.closed and '+' or '-')
		if window.closed then
			window:Resize(true, UDim2.new(1, 0, 0, 0))
		else
			window:Resize(true)
		end
	end)

	self:Create('TextLabel', {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		TextColor3 = options.txtcolor,
		TextColor3 = (options.bartextcolor or Color3.fromRGB(255, 255, 255)),
		TextSize = 17,
		Font = Enum.Font.SourceSansSemibold,
		Text = options.text or 'window',
		Name = 'Window',
		Parent = window.frame
	})

	do
		dragger.new(window.frame)
		resizer.new(window.background, window.container)
	end

	local function getSize()
		local ySize = 0
		for i, object in next, window.container:GetChildren() do
			if (not object:IsA('UIListLayout')) and (not object:IsA('UIPadding')) then
				ySize = ySize + object.AbsoluteSize.Y
			end
		end
		return UDim2.new(1, 0, 0, ySize + 10)
	end

	function window:Resize(tween, change)
		local size = change or getSize()
		self.container.ClipsDescendants = true

		if tween then
			self.background:TweenSize(size, 'Out', 'Sine', 0.5, true)
		else
			self.background.Size = size
		end
	end

	function window:AddToggle(text, callback)
		self.count = self.count + 1

		callback = callback or function() end
		local label = ui:Create('TextLabel', {
			Text =  text,
			Size = UDim2.new(1, -10, 0, 20),
			BackgroundTransparency = 1,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			LayoutOrder = self.Count,
			TextSize = 16,
			Font = Enum.Font.SourceSans,
			Parent = self.container
		})

		local button = ui:Create('TextButton', {
			Text = 'OFF',
			TextColor3 = Color3.fromRGB(255, 25, 25),
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -25, 0, 0),
			Size = UDim2.new(0, 25, 1, 0),
			TextSize = 17,
			Font = Enum.Font.SourceSansSemibold,
			Parent = label
		})

		button.MouseButton1Click:connect(function()
			self.toggles[text] = (not self.toggles[text])
			button.TextColor3 = (self.toggles[text] and Color3.fromRGB(0, 255, 140) or Color3.fromRGB(255, 25, 25))
			button.Text =(self.toggles[text] and 'ON' or 'OFF')

			callback(self.toggles[text])
		end)

		self:Resize()
		return button
	end

	function window:AddBox(text, callback)
		self.count = self.count + 1
		callback = callback or function() end

		local box = ui:Create('TextBox', {
			PlaceholderText = text,
			Size = UDim2.new(1, -10, 0, 20),
			BackgroundTransparency = 0.75,
			BackgroundColor3 = options.boxcolor,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextSize = 16,
			Text = '',
			Font = Enum.Font.SourceSans,
			LayoutOrder = self.Count,
			BorderSizePixel = 0,
			Parent = self.container
		})

		box.FocusLost:connect(function(...)
			callback(box, ...)
		end)

		self:Resize()
		return box
	end

	function window:AddDestroy(text, callback)
		self.count = self.count + 1

		callback = callback or function() end
		local button = ui:Create('TextButton', {
			Text =  text,
			Size = UDim2.new(1, -10, 0, 20),
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromRGB(50,50,50),
			BorderColor3 = Color3.fromRGB(150,150,150),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextSize = 16,
			Font = Enum.Font.SourceSans,
			LayoutOrder = self.Count,
			Parent = self.container
		})

		button.MouseButton1Click:connect(callback)
		self:Resize()
		return button
	end

	function window:AddButton(text, callback)
		self.count = self.count + 1

		callback = callback or function() end
		local button = ui:Create('TextButton', {
			Text =  text,
			Size = UDim2.new(1, -10, 0, 20),
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromRGB(65,65,65),
			BorderColor3 = Color3.fromRGB(150,150,150),
			BorderSizePixel = 0,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextSize = 16,
			Font = Enum.Font.SourceSans,
			LayoutOrder = self.Count,
			Parent = self.container
		})

		button.MouseButton1Click:connect(callback)
		self:Resize()
		return button
	end

	function window:AddLabel(text)
		self.count = self.count + 1

		local tSize = game.TextService:GetTextSize(text, 16, Enum.Font.SourceSans, Vector2.new(math.huge, math.huge))

		local button = ui:Create('TextLabel', {
			Text =  text,
			Size = UDim2.new(1, -10, 0, tSize.Y + 5),
			TextScaled = false,
			BackgroundTransparency = 1,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = 16,
			Font = Enum.Font.SourceSans,
			LayoutOrder = self.Count,
			Parent = self.container
		})

		self:Resize()
		return button
	end

	function window:AddDropdown(options, callback)
		self.count = self.count + 1
		local default = options[1] or ''

		callback = callback or function() end
		local dropdown = ui:Create('TextLabel', {
			Size = UDim2.new(1, -10, 0, 20),
			BackgroundTransparency = 0.75,
			BackgroundColor3 = options.boxcolor,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextSize = 16,
			Text = default,
			Font = Enum.Font.SourceSans,
			BorderSizePixel = 0,
			LayoutOrder = self.Count,
			Parent = self.container
		})

		local button = ui:Create('ImageButton',{
			BackgroundTransparency = 1,
			Image = 'rbxasset://textures/collapsibleArrowDown.png',
			Size = UDim2.new(0, 18, 1, 0),
			Position = UDim2.new(1, -20, 0, 0),
			Parent = dropdown
		})

		local frame

		local function isInGui(frame)
			local mloc = game.UserInputService:GetMouseLocation()
			local mouse = Vector2.new(mloc.X, mloc.Y - 36)

			local x1, x2 = frame.AbsolutePosition.X, frame.AbsolutePosition.X + frame.AbsoluteSize.X
			local y1, y2 = frame.AbsolutePosition.Y, frame.AbsolutePosition.Y + frame.AbsoluteSize.Y

			return (mouse.X >= x1 and mouse.X <= x2) and (mouse.Y >= y1 and mouse.Y <= y2)
		end

		local function count(t)
			local c = 0
			for i, v in next, t do
				c = c + 1
			end
			return c
		end

		button.MouseButton1Click:connect(function()
			if count(options) == 0 then
				return
			end

			if frame then
				frame:Destroy()
				frame = nil
			end

			self.container.ClipsDescendants = false

			frame = ui:Create('Frame', {
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
				Size = UDim2.new(0, dropdown.AbsoluteSize.X, 0, (count(options) * 21)),
				BorderSizePixel = 0,
				Parent = dropdown,
				ClipsDescendants = true,
				ZIndex = 2
			})

			ui:Create('UIListLayout', {
				Name = 'Layout',
				Parent = frame
			})

			for i, option in next, options do
				local selection = ui:Create('TextButton', {
					Text = option,
					BackgroundColor3 = Color3.fromRGB(40, 40, 40),
					TextColor3 = Color3.fromRGB(255, 255, 255),
					BorderSizePixel = 0,
					TextSize = 16,
					Font = Enum.Font.SourceSans,
					Size = UDim2.new(1, 0, 0, 21),
					Parent = frame,
					ZIndex = 2
				})

				selection.MouseButton1Click:connect(function()
					dropdown.Text = option
					callback(option)
					frame.Size = UDim2.new(1, 0, 0, 0)
					game.Debris:AddItem(frame, 0.1)
				end)
			end
		end)

		game.UserInputService.InputBegan:connect(function(m)
			if m.UserInputType == Enum.UserInputType.MouseButton1 then
				if frame and (not isInGui(frame)) then
					game.Debris:AddItem(frame)
				end
			end
		end)

		callback(default)
		self:Resize()
		return {
			Refresh = function(self, array)
				game.Debris:AddItem(frame)
				options = array
				dropdown.Text = options[1]
			end
		}
	end


	return window
end

return ui

--[[
	How to use example
	local ui = loadstring(game:HttpGet('https://raw.githubusercontent.com/BoaHacker/ROBLOX/main/ui', true))()

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local antiAFK = true
player.Idled:connect(function()
	if antiAFK then
		game.VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		game.VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end
end)

local Player = ui:CreateWindow({
	text = 'Player'
})

local Settings = ui:CreateWindow({
	text = 'Settings'
})

Player:AddToggle('Infinite Jump', function(state)
	getgenv().InfiniteJump = state
	game.UserInputService.JumpRequest:connect(function()
		if not getgenv().InfiniteJump then return end
		player.Character.Humanoid:ChangeState('Jumping')
	end)
end)

for i, v in pairs(workspace:GetChildren()) do
	if v.Name == 'Core' then
		v:Destroy()
	end
end
local Core = Instance.new('Part', workspace)
Core.Name = 'Core'
Core.Size = Vector3.new(0.05, 0.05, 0.05)
Core.CanCollide = false
workspace:WaitForChild('Core')
local torso = workspace.Core
local speed = 10
local keys = {a = false, d = false, w = false, s = false}
local e1
local e2
local function Fly()
	local pos = Instance.new('BodyPosition', torso)
	local gyro = Instance.new('BodyGyro', torso)
	pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
	pos.position = torso.Position
	gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
	gyro.cframe = torso.CFrame
	repeat
		wait()
		player.Character.Humanoid.PlatformStand = true
		local new = gyro.cframe - gyro.cframe.p + pos.position
		if not keys.w and not keys.s and not keys.a and not keys.d then
			speed = 5
		end
		if keys.w then
			new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
			speed = speed + 0
		end
		if keys.s then
			new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
			speed = speed + 0
		end
		if keys.d then
			new = new * CFrame.new(speed, 0, 0)
			speed = speed + 0
		end
		if keys.a then
			new = new * CFrame.new(-speed, 0, 0)
			speed = speed + 0
		end
		if speed > 10 then
			speed = 5
		end
		pos.position = new.p
		if keys.w then
			gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(speed * 0), 0, 0)
		elseif keys.s then
			gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 0), 0, 0)
		else
			gyro.cframe = workspace.CurrentCamera.CoordinateFrame
		end
	until getgenv().Fly == false
	if gyro then gyro:Destroy() end
	if pos then pos:Destroy() end
	player.Character.Humanoid.PlatformStand = false
	speed = 10
end
e1 = mouse.KeyDown:connect(function(key)
	if not torso or not torso.Parent then e1:disconnect() e2:disconnect() return end
	if key == 'w' then
		keys.w = true
	elseif key == 's' then
		keys.s = true
	elseif key == 'a' then
		keys.a = true
	elseif key == 'd' then
		keys.d = true
	end
end)
e2 = mouse.KeyUp:connect(function(key)
	if key == 'w' then
		keys.w = false
	elseif key == 's' then
		keys.s = false
	elseif key == 'a' then
		keys.a = false
	elseif key == 'd' then
		keys.d = false
	end
end)
Player:AddToggle('Fly', function(state)
	getgenv().Fly = state
	if not getgenv().Fly then for i, v in pairs(workspace:FindFirstChild('Core'):GetChildren()) do v:Destroy() end return end
	local Weld = Instance.new('Weld', Core)
	Weld.Part0 = Core
	Weld.Part1 = player.Character.HumanoidRootPart
	Weld.C0 = CFrame.new(0, 0, 0)
	Fly()
end)

Player:AddToggle('Noclip', function(state)
	getgenv().Noclip = state
	while true do
		if not getgenv().Noclip then return end
		game.RunService.Stepped:wait()
		for i, v in pairs(player.Character:GetDescendants()) do
			if v:IsA('BasePart') then
				v.CanCollide = false
			end
		end
	end
end)

Player:AddToggle('Click to TP', function(state)
	getgenv().ClicktoTP = state
	mouse.Button1Down:Connect(function()
		if not getgenv().ClicktoTP then return end
		player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z) * CFrame.Angles(0, math.rad(player.Character.HumanoidRootPart.Orientation.Y), 0)
	end)
end)

Player:AddBox('Walkspeed', function(state)
	if tonumber(state.Text) ~= nil then
		player.Character.Humanoid.WalkSpeed = state.Text
	end
end)

Player:AddBox('Jumppower', function(state)
	if tonumber(state.Text) ~= nil then
		if player.Character.Humanoid.UseJumpPower == true then
			player.Character.Humanoid.JumpPower = state.Text
		else
			player.Character.Humanoid.JumpHeight = state.Text
		end
	end
end)

Player:AddBox('Gravity', function(state)
	if tonumber(state.Text) ~= nil then
		workspace.Gravity = state.Text
	end
end)

Player:AddButton('Reset to Default', function()
	player.Character.Humanoid.WalkSpeed = 16
	if player.Character.Humanoid.UseJumpPower == true then
		player.Character.Humanoid.JumpPower = 50
	else
		player.Character.Humanoid.JumpHeight = 7.2
	end
	player.Character.Humanoid.JumpPower = 50
	workspace.Gravity = 196.2
end)

Settings:AddButton('Destroy UI', function()
	ui.gui:Destroy()
	antiAFK = false
	getgenv().InfiniteJump = false
	getgenv().Fly = false
	getgenv().Noclip = false
	getgenv().ClicktoTP = false
	player.Character.Humanoid.WalkSpeed = 16
	if player.Character.Humanoid.UseJumpPower == true then
		player.Character.Humanoid.JumpPower = 50
	else
		player.Character.Humanoid.JumpHeight = 7.2
	end
	workspace.Gravity = 196.2
end)

]]