if game.CoreGui:FindFirstChild("woof") then
	game.CoreGui.woof:Destroy()
 end
 
 if game:GetService("CoreGui"):FindFirstChild("Notifaction") then
	game:GetService("CoreGui").Notifaction:Destroy();
 end
 
 -- hello Leadi
 local Mainholder = {RainbowColorValue = 0, HueSelectionPosition = 0}
 
 
 coroutine.wrap(
	 function()
		while wait() do
		  Mainholder.RainbowColorValue = Mainholder.RainbowColorValue + 1 / 255
		  Mainholder.HueSelectionPosition = Mainholder.HueSelectionPosition + 1
	
		   if Mainholder.RainbowColorValue >= 1 then
			 Mainholder.RainbowColorValue = 0
		   end
	
		   if Mainholder.HueSelectionPosition == 80 then
			 Mainholder.HueSelectionPosition = 0
		   end
		end
	 end
	)()
 
 local UserInputService = game:GetService("UserInputService")
 local TweenService = game:GetService("TweenService")
 local RunService = game:GetService("RunService")
 local LocalPlayer = game:GetService("Players").LocalPlayer
 local Mouse = LocalPlayer:GetMouse()
 getgenv().checklists = {}
 
 local function MakeDraggable(topbarobject, object)
	 local Dragging = nil
	 local DragInput = nil
	 local DragStart = nil
	 local StartPosition = nil
	
	 local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
		   UDim2.new(
			  StartPosition.X.Scale,
			  StartPosition.X.Offset + Delta.X,
			  StartPosition.Y.Scale,
			  StartPosition.Y.Offset + Delta.Y
		   )
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	 end
	
	 topbarobject.InputBegan:Connect(
		function(input)
		   if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			  Dragging = true
			  DragStart = input.Position
			  StartPosition = object.Position
	
			  input.Changed:Connect(
				 function()
					if input.UserInputState == Enum.UserInputState.End then
					   Dragging = false
					end
				 end
			  )
		   end
		end
	 )
	
	 topbarobject.InputChanged:Connect(
		function(input)
		   if
			  input.UserInputType == Enum.UserInputType.MouseMovement or
				 input.UserInputType == Enum.UserInputType.Touch
		   then
			  DragInput = input
		   end
		end
	 )
	
	 UserInputService.InputChanged:Connect(
		function(input)
		   if input == DragInput and Dragging then
			  Update(input)
		   end
		end
	 )
	end
 
	function ToolTip(object, object2, unorginal, orginal)
	   object.MouseLeave:Connect(function()
		  task.wait(.7)
		  TweenService:Create(
			 object2,
			 TweenInfo.new(.2, Enum.EasingStyle.Quad),
			 {TextTransparency = 1}
		  ):Play()
		  wait(.3)
		  object2.Text = orginal
		  TweenService:Create(
			 object2,
			 TweenInfo.new(.2, Enum.EasingStyle.Quad),
			 {TextTransparency = 0}
		  ):Play()
	   end)
 
	   object.MouseEnter:Connect(function()
		  task.wait(.6)
		  TweenService:Create(
			 object2,
			 TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			 {TextTransparency = 1}
		  ):Play()
		  -- repeat task.wait() until object2.TextTransparency == 1
		  wait(.3)
		  object2.Text = unorginal
		  TweenService:Create(
			 object2,
			 TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			 {TextTransparency = 0}
		  ):Play()
	   end)
	end
 
	spawn(function()
	   game:GetService("Players").LocalPlayer.Idled:connect(
 function()
	 game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	 wait(1)
	 game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
 end)
	end)
 
 
 local woof = Instance.new("ScreenGui")
 woof.Name = "woof"
 woof.Parent = game.CoreGui
 
 -- or Color3.fromRGB(27, 27, 27),
 -- or Color3.fromRGB(35, 35, 35)
 -- or Color3.fromRGB(0, 255, 255)
 
 local objects = {}
 
 getgenv().GUI_Color = {
	Bacground = Color3.fromRGB(27, 27, 27),
	DarkContrast = Color3.fromRGB(35, 35, 35),
	TextColor = Color3.fromRGB(255, 255, 255)
 }
 
 function Mainholder:Window(hubname, gamename)
	local FirstTab = false
 
	local MainFrame = Instance.new("Frame")
	local MainCorner = Instance.new("UICorner")
	local LeftFrame = Instance.new("Frame")
	local LeftFrameCorner = Instance.new("UICorner")
	local TabHolder = Instance.new("ScrollingFrame")
	local TabHoldLayout = Instance.new("UIListLayout")
	local DragFrame = Instance.new("Frame")
	local GameTitle = Instance.new("TextLabel")
	local MainTitle = Instance.new("TextLabel")
	local MainFrameholder = Instance.new("Frame")
	local Discord = Instance.new("TextButton")
	local DiscordCorner = Instance.new("UICorner")
	local DiscordPadding = Instance.new("UIPadding")
	local MenuBtn = Instance.new("TextButton")
	local MenuBtnCorner = Instance.new("UICorner")
	local MenuBtnPadding = Instance.new("UIPadding")
	local SettingsFrame = Instance.new("Frame")
	local SettingsFrameCorner = Instance.new("UICorner")
	local SettingsFrameShadow = Instance.new("Frame")
	local SettingsFrameImage = Instance.new("ImageLabel")
	local SettingsFrameImage_2 = Instance.new("ImageLabel")
	local SettingsFrameLayout = Instance.new("UIListLayout")
	local Keybind = Instance.new("TextButton")
	local TextKeybind = Instance.new("TextLabel")
	local BindText = Instance.new("TextLabel")
 
	local ContainerHold = Instance.new("Frame")
	local DragFrame2 = Instance.new("Frame")
	local MainFrameContainerSearch = Instance.new("ScrollingFrame")
	local MainFrameContainerSearchLayout = Instance.new("UIListLayout")
	local SettingsButton = Instance.new("TextButton")
	local ImageLabel = Instance.new("ImageLabel")
 
	local MainSettingsFrame = Instance.new("Frame")
	local MainSettingsDragFrame = Instance.new("Frame")
	local MainSettingsFrameCorner = Instance.new("UICorner")
	local MainSettingsContainer = Instance.new("ScrollingFrame")
	local MainSettingsContainerLayout = Instance.new("UIListLayout")
	local MainSettingsTitle = Instance.new("TextLabel")
	local MainSettingsFrameClose = Instance.new("ImageButton")
 
	local InternalUIFrame = Instance.new("Frame")
 
 
	MainFrame.Name = "MainFrame"
	MainFrame.Parent = woof
	MainFrame.BackgroundColor3 = getgenv().GUI_Color.Bacground
	MainFrame.Position = UDim2.new(0.590548515, -325, 0.683814943, -250)
	MainFrame.Size = UDim2.new(0, 650, 0, 410)
	-- 0, 650, 0, 410 ^^
	
	MainCorner.CornerRadius = UDim.new(0, 5)
	MainCorner.Name = "MainCorner"
	MainCorner.Parent = MainFrame
	
	LeftFrame.Name = "LeftFrame"
	LeftFrame.Parent = MainFrame
	LeftFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	LeftFrame.BackgroundTransparency = 1.000
	LeftFrame.Position = UDim2.new(0.5, -325, 0.609756112, -250)
	LeftFrame.Size = UDim2.new(0, 199, 0, 350)
	
	LeftFrameCorner.CornerRadius = UDim.new(0, 5)
	LeftFrameCorner.Name = "LeftFrameCorner"
	LeftFrameCorner.Parent = LeftFrame
	
	TabHolder.Name = "TabHolder"
	TabHolder.Parent = LeftFrame
	TabHolder.Active = true
	TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabHolder.BackgroundTransparency = 1.000
	TabHolder.BorderSizePixel = 0
	TabHolder.Position = UDim2.new(0.0520000011, 0, 0.214000002, 0)
	TabHolder.Size = UDim2.new(0, 188, 0, 273)
	TabHolder.ScrollBarThickness = 0
	
	TabHoldLayout.Name = "TabHoldLayout"
	TabHoldLayout.Parent = TabHolder
	TabHoldLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabHoldLayout.Padding = UDim.new(0, 5)
 
 
	DragFrame.Name = "DragFrame"
	DragFrame.Parent = MainFrame
	DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DragFrame.BackgroundTransparency = 1.000
	DragFrame.Position = UDim2.new(0.30130294, 0, 0.00253164559, 0)
	DragFrame.Size = UDim2.new(0, 428, 0, 21)
 
	MakeDraggable(DragFrame, MainFrame)
	
	GameTitle.Name = "GameTitle"
	GameTitle.Parent = MainFrame
	GameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GameTitle.BackgroundTransparency = 1.000
	GameTitle.Position = UDim2.new(0.0297903754, 0, 0.0987561122, 6)
	GameTitle.Size = UDim2.new(0, 159, 0, 20)
	GameTitle.Font = Enum.Font.Gotham
	GameTitle.Text = gamename
	GameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	GameTitle.TextSize = 17.000
	GameTitle.TextTransparency = 0.400
	
	MainTitle.Name = "MainTitle"
	MainTitle.Parent = MainFrame
	MainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainTitle.BackgroundTransparency = 1.000
	MainTitle.Position = UDim2.new(0.0322690085, 0, 0.035682939, 0)
	MainTitle.Size = UDim2.new(0, 159, 0, 20)
	MainTitle.Font = Enum.Font.Gotham
	MainTitle.Text = hubname
	MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	MainTitle.TextSize = 25.000
	
	MainFrameholder.Name = "MainFrameholder"
	MainFrameholder.Parent = MainFrame
	MainFrameholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainFrameholder.BackgroundTransparency = 1.000
	MainFrameholder.Position = UDim2.new(0.0153846154, 0, 0.160975605, 0)
	MainFrameholder.Size = UDim2.new(0, 178, 0, 283)
	MainFrameholder.Visible = true
 
	SettingsButton.Name = "SettingsButton"
	SettingsButton.Parent = MainFrameholder
	SettingsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsButton.BackgroundTransparency = 1.000
	SettingsButton.Position = UDim2.new(3.12026191, 0, -0.215547696, 0)
	SettingsButton.Size = UDim2.new(0, 43, 0, 29)
	SettingsButton.Font = Enum.Font.SourceSans
	SettingsButton.Text = ""
	SettingsButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	SettingsButton.TextSize = 14.000
 
	
	ImageLabel.Parent = SettingsButton
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.Position = UDim2.new(0.282051295, 0, 0.172413796, 0)
	ImageLabel.Size = UDim2.new(0, 20, 0, 20)
	ImageLabel.Image = "http://www.roblox.com/asset/?id=6031104648"
 
	local Toggled = false
	SettingsButton.MouseButton1Click:Connect(function()
	   if Toggled == false then
 
		  --{2.455, 0},{-0.417, 0}
		  SettingsFrame.Visible = true
		  TweenService:Create(
			 SettingsFrame,
			 TweenInfo.new(.3, Enum.EasingStyle.Quad),
			 {Position = UDim2.new(2.455, 0, -0.417, 0)}
		  ):Play()
		  repeat wait() until SettingsFrame.Position == UDim2.new(2.455, 0, -0.417, 0)
		  Discord.Visible = true
		  MenuBtn.Visible = true
		  Toggled = true
	   else
		  Discord.Visible = false
		  MenuBtn.Visible = false
		  TweenService:Create(
			 SettingsFrame,
			 TweenInfo.new(.3, Enum.EasingStyle.Quad),
			 {Position = UDim2.new(2.455, 0, -0.195, 0)}
		  ):Play()
		  repeat task.wait() until SettingsFrame.Position == UDim2.new(2.455, 0, -0.195, 0)
		  SettingsFrame.Visible = false
 
		  Toggled = false
	   end
	end)
 
	SettingsFrame.Name = "SettingsFrame"
	SettingsFrame.Parent = MainFrameholder
	SettingsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SettingsFrame.Position = UDim2.new(2.455, 0, -0.195, 0)
	SettingsFrame.Size = UDim2.new(1, 0, -0.0212014131, 50)
	SettingsFrame.Visible = false
	
	SettingsFrameCorner.CornerRadius = UDim.new(0, 6)
	SettingsFrameCorner.Name = "SettingsFrameCorner"
	SettingsFrameCorner.Parent = SettingsFrame
 
 
	Discord.Name = "Discord"
	Discord.Parent = SettingsFrame
	Discord.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Discord.BackgroundTransparency = 1.000
	Discord.Position = UDim2.new(-3.4289414e-07, 0, 0, 0)
	Discord.Size = UDim2.new(1.00000072, 0, 0, 20)
	Discord.Font = Enum.Font.Gotham
	Discord.Text = "Internal UI"
	Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
	Discord.TextSize = 13.000
	Discord.TextTransparency = 0.400
	Discord.TextXAlignment = Enum.TextXAlignment.Left
	Discord.Visible = false
	
	DiscordCorner.CornerRadius = UDim.new(0, 6)
	DiscordCorner.Name = "DiscordCorner"
	DiscordCorner.Parent = Discord
	
	DiscordPadding.Name = "DiscordPadding"
	DiscordPadding.Parent = Discord
	DiscordPadding.PaddingLeft = UDim.new(0, 10)
 
	Discord.MouseButton1Click:Connect(function()
	   Discord.TextSize = 10
	   TweenService:Create(Discord,TweenInfo.new(.1, Enum.EasingStyle.Quad),{TextSize = 13.000}):Play()
	   InternalUIFrame.Visible = true
	end)
 
 
	MenuBtn.Name = "MenuBtn"
	MenuBtn.Parent = SettingsFrame
	MenuBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	MenuBtn.BackgroundTransparency = 1.000
	MenuBtn.Position = UDim2.new(-3.4289414e-07, 0, 0.454545468, 0)
	MenuBtn.Size = UDim2.new(1.00000072, 0, 0, 20)
	MenuBtn.Font = Enum.Font.Gotham
	MenuBtn.Text = "Settings"
	MenuBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	MenuBtn.TextSize = 13.000
	MenuBtn.TextTransparency = 0.400
	MenuBtn.TextXAlignment = Enum.TextXAlignment.Left
	MenuBtn.Visible = false
	
	MenuBtnCorner.CornerRadius = UDim.new(0, 6)
	MenuBtnCorner.Name = "MenuBtnCorner"
	MenuBtnCorner.Parent = MenuBtn
	
	MenuBtnPadding.Name = "MenuBtnPadding"
	MenuBtnPadding.Parent = MenuBtn
	MenuBtnPadding.PaddingLeft = UDim.new(0, 10)
 
	MenuBtn.MouseButton1Click:Connect(function()
	   MenuBtn.TextSize = 10
	   TweenService:Create(MenuBtn,TweenInfo.new(.1, Enum.EasingStyle.Quad),{TextSize = 13.000}):Play()
	end)
 
 
 
 
	SettingsFrameShadow.Name = "SettingsFrameShadow"
	SettingsFrameShadow.Parent = SettingsFrame
	SettingsFrameShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsFrameShadow.BackgroundTransparency = 1.000
	SettingsFrameShadow.Position = UDim2.new(-0.0168539323, 0, -0.727272749, 0)
	SettingsFrameShadow.Size = UDim2.new(1, 0, -0.13636364, 50)
	
	SettingsFrameImage.Name = "SettingsFrameImage"
	SettingsFrameImage.Parent = SettingsFrameShadow
	SettingsFrameImage.AnchorPoint = Vector2.new(0.5, 0.5)
	SettingsFrameImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsFrameImage.BackgroundTransparency = 1.000
	SettingsFrameImage.BorderSizePixel = 0
	SettingsFrameImage.Position = UDim2.new(0.505617976, 0, -0.409090936, 0)
	SettingsFrameImage.Size = UDim2.new(1.20000005, 0, 1.20000005, 0)
	SettingsFrameImage.Visible = false
	SettingsFrameImage.ZIndex = 7
	SettingsFrameImage.Image = "rbxassetid://5587865193"
	SettingsFrameImage.ImageColor3 = Color3.fromRGB(0, 0, 0)
	SettingsFrameImage.ImageTransparency = 0.900
	
	SettingsFrameImage_2.Name = "SettingsFrameImage"
	SettingsFrameImage_2.Parent = SettingsFrameShadow
	SettingsFrameImage_2.AnchorPoint = Vector2.new(0.5, 0.5)
	SettingsFrameImage_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsFrameImage_2.BackgroundTransparency = 1.000
	SettingsFrameImage_2.BorderSizePixel = 0
	SettingsFrameImage_2.Position = UDim2.new(0.5, 0, -0.387454629, 0)
	SettingsFrameImage_2.Size = UDim2.new(1.60000014, 0, 1.77963626, 0)
	SettingsFrameImage_2.Visible = false
	SettingsFrameImage_2.ZIndex = 7
	SettingsFrameImage_2.Image = "rbxassetid://5587865193"
	SettingsFrameImage_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
	SettingsFrameImage_2.ImageTransparency = 0.800
	
	SettingsFrameLayout.Name = "SettingsFrameLayout"
	SettingsFrameLayout.Parent = SettingsFrame
	SettingsFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
 
	ContainerHold.Name = "ContainerHold"
	ContainerHold.Parent = MainFrame
	ContainerHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ContainerHold.BackgroundTransparency = 1.000
	ContainerHold.Size = UDim2.new(0, 650, 0, 409)
 
	DragFrame2.Name = "DragFrame2"
	DragFrame2.Parent = MainFrame
	DragFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DragFrame2.BackgroundTransparency = 1.000
	DragFrame2.Position = UDim2.new(0, 0, 0.00253169355, 0)
	DragFrame2.Size = UDim2.new(0, 211, 0, 408)
 
	MakeDraggable(DragFrame2, MainFrame)
 
 
	local MainFrameSearch = Instance.new("TextButton")
	local MainFrameSearchIcon = Instance.new("ImageLabel")
	local MainFrameSearchBox = Instance.new("TextBox")
	local MainFrameSearchBoxPadding = Instance.new("UIPadding")
	local MainFrameSearchBoxCorner = Instance.new("UICorner")
 
	MainFrameSearch.Name = "MainFrameSearch"
	MainFrameSearch.Parent = MainFrame
	MainFrameSearch.AnchorPoint = Vector2.new(1, 0.5)
	MainFrameSearch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainFrameSearch.BackgroundTransparency = 1.000
	MainFrameSearch.LayoutOrder = 2
	MainFrameSearch.Position = UDim2.new(0.984615386, 0, 0.0487804934, 0)
	MainFrameSearch.Size = UDim2.new(0, 40, 0, 40)
	MainFrameSearch.Font = Enum.Font.SourceSans
	MainFrameSearch.Text = ""
	MainFrameSearch.TextColor3 = Color3.fromRGB(0, 0, 0)
	MainFrameSearch.TextSize = 14.000
 
	local SearchMainToggled = false
 
	MainFrameSearch.MouseButton1Click:Connect(function()
	   if SearchMainToggled == false then
		  MainFrameSearchBox.PlaceholderText = "Search"
		  MainFrameSearchBox.Visible = true
		  TweenService:Create(
			 MainFrameSearchBox,
			 TweenInfo.new(.3, Enum.EasingStyle.Quad),
			 {BackgroundTransparency = 0}
		  ):Play()
		  repeat wait() until MainFrameSearchBox.BackgroundTransparency == 0
		  SearchMainToggled = true
		  MainFrameSearchBox.Visible = true
	   else
		  MainFrameSearchBox.PlaceholderText = ""
		  TweenService:Create(
			 MainFrameSearchBox,
			 TweenInfo.new(.3, Enum.EasingStyle.Quad),
			 {BackgroundTransparency = 1}
		  ):Play()
		  repeat task.wait() until MainFrameSearchBox.BackgroundTransparency == 1
		  SearchMainToggled = false
		  MainFrameSearchBox.Visible = false
	   end
	end)
	
	MainFrameSearchIcon.Name = "MainFrameSearchIcon"
	MainFrameSearchIcon.Parent = MainFrameSearch
	MainFrameSearchIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrameSearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainFrameSearchIcon.BackgroundTransparency = 1.000
	MainFrameSearchIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrameSearchIcon.Size = UDim2.new(0, 14, 0, 14)
	MainFrameSearchIcon.Image = "http://www.roblox.com/asset/?id=6521439400"
	MainFrameSearchIcon.ImageTransparency = 0
	MainFrameSearchIcon.Visible = true
	
	MainFrameSearchBox.Name = "MainFrameSearchBox"
	MainFrameSearchBox.Parent = MainFrame
	MainFrameSearchBox.AnchorPoint = Vector2.new(0, 0.5)
	MainFrameSearchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	MainFrameSearchBox.Position = UDim2.new(1.00730777, -365, 0.0563506782, 0)
	MainFrameSearchBox.Size = UDim2.new(0, 245, 0, 23)
	MainFrameSearchBox.Font = Enum.Font.Ubuntu
	MainFrameSearchBox.PlaceholderColor3 = Color3.fromRGB(115, 115, 115)
	MainFrameSearchBox.PlaceholderText = ""
	MainFrameSearchBox.Text = ""
	MainFrameSearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	MainFrameSearchBox.TextSize = 15.000
	MainFrameSearchBox.BackgroundTransparency = 1
	MainFrameSearchBox.Visible = false
	
	MainFrameSearchBoxPadding.Name = "MainFrameSearchBoxPadding"
	MainFrameSearchBoxPadding.Parent = MainFrameSearchBox
	MainFrameSearchBoxPadding.PaddingLeft = UDim.new(0, 7)
	MainFrameSearchBoxPadding.PaddingRight = UDim.new(0, 8)
	
	MainFrameSearchBoxCorner.Name = "MainFrameSearchBoxCorner"
	MainFrameSearchBoxCorner.Parent = MainFrameSearchBox
 
 --[[
	Keybind.Name = "Keybind"
	Keybind.Parent = MainFrameholder
	Keybind.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Keybind.BackgroundTransparency = 1.000
	Keybind.Position = UDim2.new(0.124106236, 0, 1.05042291, 0)
	Keybind.Size = UDim2.new(0, 126, 0, 31)
	Keybind.Font = Enum.Font.SourceSans
	Keybind.Text = ""
	Keybind.TextColor3 = Color3.fromRGB(0, 0, 0)
	Keybind.TextSize = 14.000
	Keybind.TextXAlignment = Enum.TextXAlignment.Left
	
	TextKeybind.Name = "TextKeybind"
	TextKeybind.Parent = Keybind
	TextKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextKeybind.BackgroundTransparency = 1.000
	TextKeybind.Position = UDim2.new(0, 0, -0.0152253183, 0)
	TextKeybind.Size = UDim2.new(0, 126, 0, 31)
	TextKeybind.Font = Enum.Font.SourceSans
	TextKeybind.Text = "Bind:"
	TextKeybind.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextKeybind.TextSize = 20.000
	TextKeybind.TextXAlignment = Enum.TextXAlignment.Left
	
	BindText.Name = "BindText"
	BindText.Parent = Keybind
	BindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	BindText.BackgroundTransparency = 1.000
	BindText.Position = UDim2.new(0.46825397, 0, -0.0152253183, 0)
	BindText.Size = UDim2.new(0, 60, 0, 31)
	BindText.Font = Enum.Font.SourceSans
	BindText.Text = "Rightcontrol"
	BindText.TextColor3 = Color3.fromRGB(255, 255, 255)
	BindText.TextSize = 18.000]]
 
	local Bind = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	local Desc = Instance.new("TextLabel")
	local BText = Instance.new("TextLabel")
	local BindCorner = Instance.new("UICorner")
 
	Bind.Name = "Bind"
	Bind.Parent = MainSettingsContainer
	Bind.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Bind.Position = UDim2.new(0.0567428395, 0, 0.16803278, 0)
	Bind.Size = UDim2.new(0.910000026, 0, 0.00800000038, 34)
	Bind.AutoButtonColor = false
	Bind.Font = Enum.Font.SourceSans
	Bind.TextColor3 = Color3.fromRGB(0, 0, 0)
	Bind.TextSize = 14.000
	Bind.TextTransparency = 1.000
	Bind.TextXAlignment = Enum.TextXAlignment.Left
	
	Title.Name = "Title"
	Title.Parent = Bind
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0, 13, 0, 0)
	Title.Size = UDim2.new(0.287203521, 1, 0.5, 0)
	Title.Font = Enum.Font.Gotham
	Title.Text = "Close Bind"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextXAlignment = Enum.TextXAlignment.Left
	
	Desc.Name = "Desc"
	Desc.Parent = Bind
	Desc.AnchorPoint = Vector2.new(0, 1)
	Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Desc.BackgroundTransparency = 1.000
	Desc.Position = UDim2.new(0.0205142926, 5, 0.988621473, 0)
	Desc.Size = UDim2.new(0.589060307, 1, 0.5, 0)
	Desc.Font = Enum.Font.Gotham
	Desc.Text = "Hides/Shows the main window."
	Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
	Desc.TextSize = 12.000
	Desc.TextTransparency = 0.400
	Desc.TextXAlignment = Enum.TextXAlignment.Left
	
	BText.Name = "BText"
	BText.Parent = Bind
	BText.AnchorPoint = Vector2.new(1, 0)
	BText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	BText.BackgroundTransparency = 1.000
	BText.Position = UDim2.new(0.982375741, -5, 0.077415362, 0)
	BText.Selectable = true
	BText.Size = UDim2.new(0, 90, 0, 32)
	BText.Font = Enum.Font.Gotham
	BText.Text = "RightControl"
	BText.TextColor3 = Color3.fromRGB(255, 255, 255)
	BText.TextSize = 14.000
	BText.TextXAlignment = Enum.TextXAlignment.Right
	
	BindCorner.Name = "BindCorner"
	BindCorner.Parent = Bind
 
	local keybind_data = {}
 
 local keybind_options
 
 local keybind_name
 
 local UIS = game:GetService('UserInputService')
   
   
		  keybind_name = tostring(keybind_name or "New Keybind")
		  callback = typeof(callback) == "function" and callback or function()end
		  keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
		  keybind_options = {
			 ["standard"] = keybind_options.standard or Enum.KeyCode.RightControl,
		  }
   
   
   
		  callback = typeof(callback) == "function" and callback or function()end
		  keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
		  keybind_options = {
			 ["standard"] = keybind_options.standard or Enum.KeyCode.RightControl,
		  }
   
		  local shortkeys = {
			 RightControl = 'RightControl',
			 LeftControl = 'LeftControl',
			 LeftShift = 'LeftShift',
			 RightShift = 'RightShift',
			 MouseButton1 = "MouseButton1",
			 MouseButton2 = "MouseButton2"
		  }
		  local checks = {
			 binding = false,
		  }
 
		  function keybind_data:SetKeybind(Keybind)
			 local key = shortkeys[Keybind.Name] or Keybind.Name
			 BText.Text = key
			 keybind = Keybind
		  end
   
		  UIS.InputBegan:Connect(function(a, b)
			 if checks.binding then
				spawn(function()
				   wait()
				   checks.binding = false
				end)
				return
			 end
			 if a.KeyCode == keybind and not b then
				pcall(callback, keybind)
			 end
		  end)
   
		  keybind_data:SetKeybind(keybind_options.standard)
 
 
		  Bind.MouseButton1Click:Connect(function()
			 if checks.binding then return end
			 BText.Text = "[...]"
			 checks.binding = true
			 local a, b = UIS.InputBegan:Wait()
			 keybind_data:SetKeybind(a.KeyCode)
	 end)
 
	 local settingsToggled = nil
	 MenuBtn.MouseButton1Click:Connect(function()
	   settingsToggled = false
	end)
	 local uitoggled = false
   UserInputService.InputBegan:Connect(
	function(io, p)
	   if io.KeyCode == Enum.KeyCode[game:GetService("CoreGui").woof.MainSettingsFrame.MainSettingsContainer.Bind.BText.Text] then
		  if uitoggled == false then
			 spawn(function()
				if settingsToggled == false then
				   MainSettingsContainer.Visible = false
				   MainSettingsTitle.Visible = false
				   MainSettingsFrameClose.Visible = false
				   TweenService:Create(
					  MainSettingsFrame,
					  TweenInfo.new(.3, Enum.EasingStyle.Quad),
					  {BackgroundTransparency = 1}
				   ):Play()
	   
				   repeat wait() until MainSettingsFrame.BackgroundTransparency == 1
				   MainSettingsFrame.Visible = false
				   settingsToggled = true
				end
			 end)
 
			 ContainerHold.Visible = false
			 MainFrameholder.Visible = false
			 LeftFrame.Visible = false
			 GameTitle.Visible = false
			 MainTitle.Visible = false
			 MainFrameSearch.Visible = false
			 MainFrameSearchBox.Visible = false
 
			 TweenService:Create(
				MainFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 1}
			 ):Play()
 
			 repeat wait() until MainFrame.BackgroundTransparency == 1
			 MainFrame.Visible = false
			 uitoggled = true
		  else
 
			 spawn(function()
				if settingsToggled == true then
				   MainSettingsFrame.Visible = true
				   TweenService:Create(
					  MainSettingsFrame,
					  TweenInfo.new(.3, Enum.EasingStyle.Quad),
					  {BackgroundTransparency = 0}
				   ):Play()
	   
				   repeat wait() until MainSettingsFrame.BackgroundTransparency == 0
				   MainSettingsContainer.Visible = true
				   MainSettingsTitle.Visible = true
				   MainSettingsFrameClose.Visible = true
				   settingsToggled = false
				end
			 end)
 
			 MainFrame.Visible = true
 
			 TweenService:Create(
				MainFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 0}
			 ):Play()
 
			 repeat wait() until MainFrame.BackgroundTransparency == 0
			 ContainerHold.Visible = true
			 MainFrameholder.Visible = true
			 LeftFrame.Visible = true
			 GameTitle.Visible = true
			 MainTitle.Visible = true
			 MainFrameSearch.Visible = true
			 if MainFrameSearchBox.Visible == false then
			 else
				MainFrameSearchBox.Visible = true
			 end
			 
 
			 uitoggled = false
		  end
		  end
		  end)
 
 
		  MenuBtn.MouseButton1Click:Connect(function()
			 MainSettingsFrame.Visible = true
			 TweenService:Create(
				MainSettingsFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 0}
			 ):Play()
 
			 repeat wait() until MainSettingsFrame.BackgroundTransparency == 0
 
			 MainSettingsContainer.Visible = true
			 MainSettingsTitle.Visible = true
			 MainSettingsFrameClose.Visible = true
		  end)
 
		  function Ripple(Object)
			 spawn(function()
				local Circle = Instance.new("ImageLabel")
				Circle.Parent = Object
				Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Circle.BackgroundTransparency = 1.000
				Circle.ZIndex = 10
				Circle.Image = "rbxassetid://266543268"
				Circle.ImageColor3 = Color3.fromRGB(210,210,210)
				Circle.ImageTransparency = 0.8
				Circle.Position = UDim2.new(0, Mouse.X - Circle.AbsolutePosition.X, 0, Mouse.Y - Circle.AbsolutePosition.Y)
				local Size = Object.AbsoluteSize.X
				TweenService:Create(Circle, TweenInfo.new(0.5), {Position = UDim2.fromScale(math.clamp(Mouse.X - Object.AbsolutePosition.X, 0, Object.AbsoluteSize.X)/Object.AbsoluteSize.X,Object,math.clamp(Mouse.Y - Object.AbsolutePosition.Y, 0, Object.AbsoluteSize.Y)/Object.AbsoluteSize.Y) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, Size = UDim2.fromOffset(Size,Size)}):Play()
				spawn(function()
				   wait(0.5)
				   Circle:Destroy()
				end)
			 end)
		  end
 
 
		  local ScriptHub = Instance.new("TextButton")
		  local ScriptHubTitle = Instance.new("TextLabel")
		  local ScriptHubDesc = Instance.new("TextLabel")
		  local ScriptHubCorner = Instance.new("UICorner")
 
		  ScriptHub.Name = "ScriptHub"
		  ScriptHub.Parent = MainSettingsContainer
		  ScriptHub.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		  ScriptHub.Position = UDim2.new(0.0450380854, 0, 0.180327863, 0)
		  ScriptHub.Size = UDim2.new(0.909923851, 0, 0.00819672085, 34)
		  ScriptHub.AutoButtonColor = false
		  ScriptHub.Font = Enum.Font.SourceSans
		  ScriptHub.TextColor3 = Color3.fromRGB(0, 0, 0)
		  ScriptHub.TextSize = 14.000
		  ScriptHub.TextTransparency = 1.000
		  ScriptHub.TextXAlignment = Enum.TextXAlignment.Left
 
		  ScriptHub.MouseButton1Click:Connect(function()
			 Ripple(ScriptHub)
		 end)
 
		 ScriptHub.MouseButton1Click:Connect(function()
		  if game.CoreGui:FindFirstChild("ScriptBloxSearcher") then
			  game:GetService("CoreGui").ScriptBloxSearcher.MainFrame.Visible = true
		  else
			local ScriptBloxSearcher = Instance.new("ScreenGui")
			local MainFrame = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TopBarFrame = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local SearchBox = Instance.new("TextBox")
			local UICorner_3 = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local CloseButton = Instance.new("ImageButton")
			local UICorner_4 = Instance.new("UICorner")
			local ClearCacheButton = Instance.new("TextButton")
			local UICorner_5 = Instance.new("UICorner")
			local TopbarBottomCover = Instance.new("Frame")
			local ScriptListFrame = Instance.new("ScrollingFrame")
			local UIPadding = Instance.new("UIPadding")
			local Scripts = Instance.new("Folder")
			local UIGridLayout = Instance.new("UIGridLayout")
			local ScriptFrame = Instance.new("Frame")
			local UICorner_6 = Instance.new("UICorner")
			local ScriptTitle = Instance.new("TextLabel")
			local ExecuteButton = Instance.new("TextButton")
			local UICorner_7 = Instance.new("UICorner")
			local InfoButton = Instance.new("TextButton")
			local UICorner_8 = Instance.new("UICorner")
			local ScriptAuthor = Instance.new("TextLabel")
			local ScriptGame = Instance.new("TextLabel")
			local VerifiedScriptFrame = Instance.new("Frame")
			local UICorner_9 = Instance.new("UICorner")
			local ScriptTitle_2 = Instance.new("TextLabel")
			local VerifiedIcon = Instance.new("ImageLabel")
			local ExecuteButton_2 = Instance.new("TextButton")
			local UICorner_10 = Instance.new("UICorner")
			local InfoButton_2 = Instance.new("TextButton")
			local UICorner_11 = Instance.new("UICorner")
			local ScriptAuthor_2 = Instance.new("TextLabel")
			local ScriptGame_2 = Instance.new("TextLabel")
			local ScriptListBackgroundFrame = Instance.new("Frame")
			local UICorner_12 = Instance.new("UICorner")
			local NoScriptsFound = Instance.new("TextLabel")
			local InfoBox = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UICorner_13 = Instance.new("UICorner")
			local Info = Instance.new("Frame")
			local PreviewImage = Instance.new("ImageLabel")
			local UIScale = Instance.new("UIScale")
			local UICorner_14 = Instance.new("UICorner")
			local Author = Instance.new("Frame")
			local InfoBoxAuthor = Instance.new("TextLabel")
			local ProfilePicture = Instance.new("ImageLabel")
			local UICorner_15 = Instance.new("UICorner")
			local Title_2 = Instance.new("Frame")
			local InfoBoxTitle = Instance.new("TextLabel")
			local Game = Instance.new("TextLabel")
			local Buttons = Instance.new("Frame")
			local UIListLayout_2 = Instance.new("UIListLayout")
			local Close = Instance.new("TextButton")
			local UICorner_16 = Instance.new("UICorner")
			local CopyScriptBloxLink = Instance.new("TextButton")
			local UICorner_17 = Instance.new("UICorner")
			local CopyScriptButton = Instance.new("TextButton")
			local UICorner_18 = Instance.new("UICorner")
			local ExecuteButton_3 = Instance.new("TextButton")
			local UICorner_19 = Instance.new("UICorner")
			local InfoBoxDescription = Instance.new("TextLabel")
			local Comments = Instance.new("Frame")
			local UICorner_20 = Instance.new("UICorner")
			local Inner = Instance.new("Frame")
			local UICorner_21 = Instance.new("UICorner")
			local Line = Instance.new("Frame")
			local CommentsText = Instance.new("TextLabel")
			local Comments_2 = Instance.new("ScrollingFrame")
			local Comment = Instance.new("Frame")
			local Content = Instance.new("TextLabel")
			local Author_2 = Instance.new("TextLabel")
			local ProfilePicture_2 = Instance.new("ImageLabel")
			local UICorner_22 = Instance.new("UICorner")
			local UIListLayout_3 = Instance.new("UIListLayout")
			
			ScriptBloxSearcher.Name = "ScriptBloxSearcher"
			ScriptBloxSearcher.Parent = game:GetService("CoreGui")
			ScriptBloxSearcher.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			ScriptBloxSearcher.ResetOnSpawn = false
			
			MainFrame.Name = "MainFrame"
			MainFrame.Parent = ScriptBloxSearcher
			MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			MainFrame.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
			MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			MainFrame.Size = UDim2.new(0, 1019, 0, 571)
			MainFrame.ZIndex = 2
			
			UIAspectRatioConstraint.Parent = MainFrame
			UIAspectRatioConstraint.AspectRatio = 1.778
			
			UICorner.CornerRadius = UDim.new(0, 12)
			UICorner.Parent = MainFrame
			
			TopBarFrame.Name = "TopBarFrame"
			TopBarFrame.Parent = MainFrame
			TopBarFrame.BackgroundColor3 = Color3.fromRGB(13, 18, 39)
			TopBarFrame.Size = UDim2.new(0, 1015, 0, 40)
			TopBarFrame.ZIndex = 2
			
			UICorner_2.CornerRadius = UDim.new(0, 12)
			UICorner_2.Parent = TopBarFrame
			
			SearchBox.Name = "SearchBox"
			SearchBox.Parent = TopBarFrame
			SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SearchBox.Position = UDim2.new(0, 5, 0, 5)
			SearchBox.Size = UDim2.new(0, 220, 0, 30)
			SearchBox.ClearTextOnFocus = false
			SearchBox.Font = Enum.Font.Gotham
			SearchBox.PlaceholderText = "Search"
			SearchBox.Text = ""
			SearchBox.TextColor3 = Color3.fromRGB(0, 0, 0)
			SearchBox.TextScaled = true
			SearchBox.TextSize = 14.000
			SearchBox.TextWrapped = true
			
			UICorner_3.CornerRadius = UDim.new(0, 12)
			UICorner_3.Parent = SearchBox
			
			Title.Name = "Title"
			Title.Parent = TopBarFrame
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Size = UDim2.new(0, 1015, 0, 40)
			Title.Font = Enum.Font.Gotham
			Title.Text = "<font color=\"#8C7DFF\">Script</font>Blox"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 28.000
			
			CloseButton.Name = "CloseButton"
			CloseButton.Parent = TopBarFrame
			CloseButton.BackgroundColor3 = Color3.fromRGB(214, 21, 24)
			CloseButton.Position = UDim2.new(0, 980, 0, 5)
			CloseButton.Size = UDim2.new(0, 30, 0, 30)
			CloseButton.AutoButtonColor = false
			CloseButton.Image = "rbxassetid://54479706"
			
			UICorner_4.CornerRadius = UDim.new(0, 12)
			UICorner_4.Parent = CloseButton
			
			ClearCacheButton.Name = "ClearCacheButton"
			ClearCacheButton.Parent = TopBarFrame
			ClearCacheButton.BackgroundColor3 = Color3.fromRGB(39, 48, 88)
			ClearCacheButton.Position = UDim2.new(0, 755, 0, 5)
			ClearCacheButton.Size = UDim2.new(0, 220, 0, 30)
			ClearCacheButton.AutoButtonColor = false
			ClearCacheButton.Font = Enum.Font.GothamSemibold
			ClearCacheButton.Text = "Clear Cache"
			ClearCacheButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			ClearCacheButton.TextSize = 24.000
			ClearCacheButton.TextWrapped = true
			
			UICorner_5.CornerRadius = UDim.new(0, 12)
			UICorner_5.Parent = ClearCacheButton
			
			TopbarBottomCover.Name = "TopbarBottomCover"
			TopbarBottomCover.Parent = MainFrame
			TopbarBottomCover.BackgroundColor3 = Color3.fromRGB(13, 18, 39)
			TopbarBottomCover.BorderSizePixel = 0
			TopbarBottomCover.LayoutOrder = 1
			TopbarBottomCover.Position = UDim2.new(3.0063287e-08, 0, 0.0437828377, 0)
			TopbarBottomCover.Size = UDim2.new(0, 1015, 0, 15)
			
			ScriptListFrame.Name = "ScriptListFrame"
			ScriptListFrame.Parent = MainFrame
			ScriptListFrame.Active = true
			ScriptListFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScriptListFrame.BackgroundTransparency = 1.000
			ScriptListFrame.BorderSizePixel = 0
			ScriptListFrame.Position = UDim2.new(0, 10, 0.0700000003, 10)
			ScriptListFrame.Size = UDim2.new(0, 995, 0, 511)
			ScriptListFrame.ZIndex = 2
			ScriptListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			
			UIPadding.Parent = ScriptListFrame
			UIPadding.PaddingBottom = UDim.new(0, 10)
			UIPadding.PaddingLeft = UDim.new(0, 25)
			UIPadding.PaddingRight = UDim.new(0, 25)
			UIPadding.PaddingTop = UDim.new(0, 10)
			
			Scripts.Name = "Scripts"
			Scripts.Parent = ScriptListFrame
			
			UIGridLayout.Parent = Scripts
			UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIGridLayout.CellPadding = UDim2.new(0, 20, 0, 20)
			UIGridLayout.CellSize = UDim2.new(0, 300, 0, 150)
			
			ScriptFrame.Name = "ScriptFrame"
			ScriptFrame.Parent = Scripts
			ScriptFrame.BackgroundColor3 = Color3.fromRGB(39, 48, 88)
			ScriptFrame.Size = UDim2.new(0, 300, 0, 150)
			
			UICorner_6.CornerRadius = UDim.new(0, 12)
			UICorner_6.Parent = ScriptFrame
			
			ScriptTitle.Name = "ScriptTitle"
			ScriptTitle.Parent = ScriptFrame
			ScriptTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScriptTitle.BackgroundTransparency = 1.000
			ScriptTitle.Position = UDim2.new(0, 10, 0, 10)
			ScriptTitle.Size = UDim2.new(0, 280, 0, 40)
			ScriptTitle.Font = Enum.Font.Gotham
			ScriptTitle.Text = "Script Title"
			ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ScriptTitle.TextScaled = true
			ScriptTitle.TextSize = 14.000
			ScriptTitle.TextWrapped = true
			ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left
			
			ExecuteButton.Name = "ExecuteButton"
			ExecuteButton.Parent = ScriptFrame
			ExecuteButton.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
			ExecuteButton.Position = UDim2.new(0.0399999991, 0, 0.733333349, 0)
			ExecuteButton.Size = UDim2.new(0, 130, 0, 30)
			ExecuteButton.AutoButtonColor = false
			ExecuteButton.Font = Enum.Font.GothamBold
			ExecuteButton.Text = "Execute"
			ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			ExecuteButton.TextSize = 14.000
			
			UICorner_7.CornerRadius = UDim.new(0, 12)
			UICorner_7.Parent = ExecuteButton
			
			InfoButton.Name = "InfoButton"
			InfoButton.Parent = ScriptFrame
			InfoButton.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
			InfoButton.Position = UDim2.new(0.533333361, 0, 0.733333349, 0)
			InfoButton.Size = UDim2.new(0, 130, 0, 30)
			InfoButton.AutoButtonColor = false
			InfoButton.Font = Enum.Font.GothamBold
			InfoButton.Text = "Info"
			InfoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			InfoButton.TextSize = 14.000
			
			UICorner_8.CornerRadius = UDim.new(0, 12)
			UICorner_8.Parent = InfoButton
			
			ScriptAuthor.Name = "ScriptAuthor"
			ScriptAuthor.Parent = ScriptFrame
			ScriptAuthor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScriptAuthor.BackgroundTransparency = 1.000
			ScriptAuthor.Position = UDim2.new(0, 10, 0, 55)
			ScriptAuthor.Size = UDim2.new(0, 280, 0, 25)
			ScriptAuthor.Font = Enum.Font.Gotham
			ScriptAuthor.Text = "by ScriptAuthor"
			ScriptAuthor.TextColor3 = Color3.fromRGB(192, 192, 192)
			ScriptAuthor.TextSize = 14.000
			ScriptAuthor.TextWrapped = true
			ScriptAuthor.TextXAlignment = Enum.TextXAlignment.Left
			
			ScriptGame.Name = "ScriptGame"
			ScriptGame.Parent = ScriptFrame
			ScriptGame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScriptGame.BackgroundTransparency = 1.000
			ScriptGame.Position = UDim2.new(0, 10, 0, 80)
			ScriptGame.Size = UDim2.new(0, 280, 0, 25)
			ScriptGame.Font = Enum.Font.Gotham
			ScriptGame.Text = "Game"
			ScriptGame.TextColor3 = Color3.fromRGB(192, 192, 192)
			ScriptGame.TextSize = 14.000
			ScriptGame.TextWrapped = true
			ScriptGame.TextXAlignment = Enum.TextXAlignment.Left
			
			VerifiedScriptFrame.Name = "VerifiedScriptFrame"
			VerifiedScriptFrame.Parent = Scripts
			VerifiedScriptFrame.BackgroundColor3 = Color3.fromRGB(39, 48, 88)
			VerifiedScriptFrame.Size = UDim2.new(0, 300, 0, 150)
			
			UICorner_9.CornerRadius = UDim.new(0, 12)
			UICorner_9.Parent = VerifiedScriptFrame
			
			ScriptTitle_2.Name = "ScriptTitle"
			ScriptTitle_2.Parent = VerifiedScriptFrame
			ScriptTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScriptTitle_2.BackgroundTransparency = 1.000
			ScriptTitle_2.Position = UDim2.new(0, 50, 0, 10)
			ScriptTitle_2.Size = UDim2.new(0, 240, 0, 40)
			ScriptTitle_2.Font = Enum.Font.Gotham
			ScriptTitle_2.Text = "Script Title"
			ScriptTitle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			ScriptTitle_2.TextScaled = true
			ScriptTitle_2.TextSize = 14.000
			ScriptTitle_2.TextWrapped = true
			ScriptTitle_2.TextXAlignment = Enum.TextXAlignment.Left
			
			VerifiedIcon.Name = "VerifiedIcon"
			VerifiedIcon.Parent = VerifiedScriptFrame
			VerifiedIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			VerifiedIcon.BackgroundTransparency = 1.000
			VerifiedIcon.Position = UDim2.new(0, 10, 0, 15)
			VerifiedIcon.Size = UDim2.new(0, 30, 0, 30)
			VerifiedIcon.Image = "rbxassetid://8240362117"
			
			ExecuteButton_2.Name = "ExecuteButton"
			ExecuteButton_2.Parent = VerifiedScriptFrame
			ExecuteButton_2.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
			ExecuteButton_2.Position = UDim2.new(0.0399999991, 0, 0.733333349, 0)
			ExecuteButton_2.Size = UDim2.new(0, 130, 0, 30)
			ExecuteButton_2.AutoButtonColor = false
			ExecuteButton_2.Font = Enum.Font.GothamBold
			ExecuteButton_2.Text = "Execute"
			ExecuteButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			ExecuteButton_2.TextSize = 14.000
			
			UICorner_10.CornerRadius = UDim.new(0, 12)
			UICorner_10.Parent = ExecuteButton_2
			
			InfoButton_2.Name = "InfoButton"
			InfoButton_2.Parent = VerifiedScriptFrame
			InfoButton_2.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
			InfoButton_2.Position = UDim2.new(0.533333361, 0, 0.733333349, 0)
			InfoButton_2.Size = UDim2.new(0, 130, 0, 30)
			InfoButton_2.AutoButtonColor = false
			InfoButton_2.Font = Enum.Font.GothamBold
			InfoButton_2.Text = "Info"
			InfoButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			InfoButton_2.TextSize = 14.000
			
			UICorner_11.CornerRadius = UDim.new(0, 12)
			UICorner_11.Parent = InfoButton_2
			
			ScriptAuthor_2.Name = "ScriptAuthor"
			ScriptAuthor_2.Parent = VerifiedScriptFrame
			ScriptAuthor_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScriptAuthor_2.BackgroundTransparency = 1.000
			ScriptAuthor_2.Position = UDim2.new(0.0399999991, 0, 0.366666675, 0)
			ScriptAuthor_2.Size = UDim2.new(0, 280, 0, 25)
			ScriptAuthor_2.Font = Enum.Font.Gotham
			ScriptAuthor_2.Text = "by ScriptAuthor"
			ScriptAuthor_2.TextColor3 = Color3.fromRGB(192, 192, 192)
			ScriptAuthor_2.TextSize = 14.000
			ScriptAuthor_2.TextWrapped = true
			ScriptAuthor_2.TextXAlignment = Enum.TextXAlignment.Left
			
			ScriptGame_2.Name = "ScriptGame"
			ScriptGame_2.Parent = VerifiedScriptFrame
			ScriptGame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScriptGame_2.BackgroundTransparency = 1.000
			ScriptGame_2.Position = UDim2.new(0, 10, 0, 80)
			ScriptGame_2.Size = UDim2.new(0, 280, 0, 25)
			ScriptGame_2.Font = Enum.Font.Gotham
			ScriptGame_2.Text = "Game"
			ScriptGame_2.TextColor3 = Color3.fromRGB(192, 192, 192)
			ScriptGame_2.TextSize = 14.000
			ScriptGame_2.TextWrapped = true
			ScriptGame_2.TextXAlignment = Enum.TextXAlignment.Left
			
			ScriptListBackgroundFrame.Name = "ScriptListBackgroundFrame"
			ScriptListBackgroundFrame.Parent = MainFrame
			ScriptListBackgroundFrame.BackgroundColor3 = Color3.fromRGB(13, 18, 39)
			ScriptListBackgroundFrame.Position = UDim2.new(0, 10, 0.0700000003, 10)
			ScriptListBackgroundFrame.Size = UDim2.new(0, 995, 0, 511)
			
			UICorner_12.CornerRadius = UDim.new(0, 12)
			UICorner_12.Parent = ScriptListBackgroundFrame
			
			NoScriptsFound.Name = "No Scripts Found"
			NoScriptsFound.Parent = MainFrame
			NoScriptsFound.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NoScriptsFound.BackgroundTransparency = 1.000
			NoScriptsFound.Position = UDim2.new(3.0063287e-08, 10, 0.0700000003, 10)
			NoScriptsFound.Size = UDim2.new(0, 995, 0, 509)
			NoScriptsFound.Visible = false
			NoScriptsFound.ZIndex = 3
			NoScriptsFound.Font = Enum.Font.GothamSemibold
			NoScriptsFound.Text = "No Scripts have been found!"
			NoScriptsFound.TextColor3 = Color3.fromRGB(255, 0, 0)
			NoScriptsFound.TextScaled = true
			NoScriptsFound.TextSize = 100.000
			NoScriptsFound.TextWrapped = true
			
			InfoBox.Name = "InfoBox"
			InfoBox.Parent = MainFrame
			InfoBox.Active = true
			InfoBox.BackgroundColor3 = Color3.fromRGB(13, 18, 39)
			InfoBox.BorderSizePixel = 0
			InfoBox.Position = UDim2.new(0, 10, 0, 50)
			InfoBox.Size = UDim2.new(0, 995, 0, 510)
			InfoBox.ZIndex = 3
			InfoBox.CanvasSize = UDim2.new(0, 0, 0, 0)
			InfoBox.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
			
			UIListLayout.Parent = InfoBox
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 10)
			
			UICorner_13.CornerRadius = UDim.new(0, 12)
			UICorner_13.Parent = InfoBox
			
			Info.Name = "Info"
			Info.Parent = InfoBox
			Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Info.BackgroundTransparency = 1.000
			Info.Size = UDim2.new(0, 995, 0, 207)
			
			PreviewImage.Name = "PreviewImage"
			PreviewImage.Parent = Info
			PreviewImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			PreviewImage.BackgroundTransparency = 1.000
			PreviewImage.Position = UDim2.new(0, 50, 0, 10)
			PreviewImage.Size = UDim2.new(0, 480, 0, 270)
			PreviewImage.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
			
			UIScale.Parent = PreviewImage
			UIScale.Scale = 0.700
			
			UICorner_14.CornerRadius = UDim.new(0, 24)
			UICorner_14.Parent = PreviewImage
			
			Author.Name = "Author"
			Author.Parent = Info
			Author.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Author.BackgroundTransparency = 1.000
			Author.Position = UDim2.new(0, 395, 0, 110)
			Author.Size = UDim2.new(0, 250, 0, 40)
			
			InfoBoxAuthor.Name = "InfoBoxAuthor"
			InfoBoxAuthor.Parent = Author
			InfoBoxAuthor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			InfoBoxAuthor.BackgroundTransparency = 1.000
			InfoBoxAuthor.BorderSizePixel = 0
			InfoBoxAuthor.Position = UDim2.new(0, 45, 0, 0)
			InfoBoxAuthor.Size = UDim2.new(0, 150, 0, 40)
			InfoBoxAuthor.Font = Enum.Font.Gotham
			InfoBoxAuthor.Text = "Author"
			InfoBoxAuthor.TextColor3 = Color3.fromRGB(140, 125, 233)
			InfoBoxAuthor.TextSize = 20.000
			InfoBoxAuthor.TextWrapped = true
			InfoBoxAuthor.TextXAlignment = Enum.TextXAlignment.Left
			
			ProfilePicture.Name = "ProfilePicture"
			ProfilePicture.Parent = Author
			ProfilePicture.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ProfilePicture.BackgroundTransparency = 1.000
			ProfilePicture.Size = UDim2.new(0, 40, 0, 40)
			ProfilePicture.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
			
			UICorner_15.CornerRadius = UDim.new(1, 0)
			UICorner_15.Parent = ProfilePicture
			
			Title_2.Name = "Title"
			Title_2.Parent = Info
			Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_2.BackgroundTransparency = 1.000
			Title_2.Position = UDim2.new(0, 395, 0, 10)
			Title_2.Size = UDim2.new(0, 550, 0, 50)
			
			InfoBoxTitle.Name = "InfoBoxTitle"
			InfoBoxTitle.Parent = Title_2
			InfoBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			InfoBoxTitle.BackgroundTransparency = 1.000
			InfoBoxTitle.Size = UDim2.new(0, 550, 0, 50)
			InfoBoxTitle.Font = Enum.Font.GothamSemibold
			InfoBoxTitle.Text = "Script Title"
			InfoBoxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			InfoBoxTitle.TextScaled = true
			InfoBoxTitle.TextSize = 14.000
			InfoBoxTitle.TextWrapped = true
			InfoBoxTitle.TextXAlignment = Enum.TextXAlignment.Left
			
			Game.Name = "Game"
			Game.Parent = Info
			Game.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Game.BackgroundTransparency = 1.000
			Game.Position = UDim2.new(0, 395, 0, 70)
			Game.Size = UDim2.new(0, 250, 0, 25)
			Game.Font = Enum.Font.Gotham
			Game.Text = "Game Name"
			Game.TextColor3 = Color3.fromRGB(255, 255, 255)
			Game.TextSize = 22.000
			Game.TextXAlignment = Enum.TextXAlignment.Left
			
			Buttons.Name = "Buttons"
			Buttons.Parent = InfoBox
			Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Buttons.BackgroundTransparency = 1.000
			Buttons.Position = UDim2.new(0.0100502511, 0, 0.911764622, 0)
			Buttons.Size = UDim2.new(0, 975, 0, 35)
			
			UIListLayout_2.Parent = Buttons
			UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
			UIListLayout_2.Padding = UDim.new(0, 40)
			
			Close.Name = "Close"
			Close.Parent = Buttons
			Close.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
			Close.LayoutOrder = 3
			Close.Position = UDim2.new(0, 735, 0, 465)
			Close.Size = UDim2.new(0, 200, 0, 35)
			Close.ZIndex = 2
			Close.AutoButtonColor = false
			Close.Font = Enum.Font.GothamBold
			Close.Text = "Close"
			Close.TextColor3 = Color3.fromRGB(255, 255, 255)
			Close.TextSize = 14.000
			
			UICorner_16.CornerRadius = UDim.new(0, 12)
			UICorner_16.Parent = Close
			
			CopyScriptBloxLink.Name = "CopyScriptBloxLink"
			CopyScriptBloxLink.Parent = Buttons
			CopyScriptBloxLink.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
			CopyScriptBloxLink.LayoutOrder = 1
			CopyScriptBloxLink.Position = UDim2.new(0, 505, 0, 465)
			CopyScriptBloxLink.Size = UDim2.new(0, 200, 0, 35)
			CopyScriptBloxLink.AutoButtonColor = false
			CopyScriptBloxLink.Font = Enum.Font.GothamBold
			CopyScriptBloxLink.Text = "Copy ScriptBlox Link"
			CopyScriptBloxLink.TextColor3 = Color3.fromRGB(255, 255, 255)
			CopyScriptBloxLink.TextSize = 14.000
			
			UICorner_17.CornerRadius = UDim.new(0, 12)
			UICorner_17.Parent = CopyScriptBloxLink
			
			CopyScriptButton.Name = "CopyScriptButton"
			CopyScriptButton.Parent = Buttons
			CopyScriptButton.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
			CopyScriptButton.LayoutOrder = 2
			CopyScriptButton.Position = UDim2.new(0, 270, 0, 465)
			CopyScriptButton.Size = UDim2.new(0, 200, 0, 35)
			CopyScriptButton.AutoButtonColor = false
			CopyScriptButton.Font = Enum.Font.GothamBold
			CopyScriptButton.Text = "Copy Script"
			CopyScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			CopyScriptButton.TextSize = 14.000
			
			UICorner_18.CornerRadius = UDim.new(0, 12)
			UICorner_18.Parent = CopyScriptButton
			
			ExecuteButton_3.Name = "ExecuteButton"
			ExecuteButton_3.Parent = Buttons
			ExecuteButton_3.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
			ExecuteButton_3.Position = UDim2.new(0, 30, 0, 465)
			ExecuteButton_3.Size = UDim2.new(0, 200, 0, 35)
			ExecuteButton_3.AutoButtonColor = false
			ExecuteButton_3.Font = Enum.Font.GothamBold
			ExecuteButton_3.Text = "Execute"
			ExecuteButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
			ExecuteButton_3.TextSize = 14.000
			
			UICorner_19.CornerRadius = UDim.new(0, 12)
			UICorner_19.Parent = ExecuteButton_3
			
			InfoBoxDescription.Name = "InfoBoxDescription"
			InfoBoxDescription.Parent = InfoBox
			InfoBoxDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			InfoBoxDescription.BackgroundTransparency = 1.000
			InfoBoxDescription.Size = UDim2.new(0, 960, 0, 0)
			InfoBoxDescription.Font = Enum.Font.Gotham
			InfoBoxDescription.Text = "This is a pretty cool description!"
			InfoBoxDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
			InfoBoxDescription.TextSize = 20.000
			InfoBoxDescription.TextWrapped = true
			InfoBoxDescription.TextXAlignment = Enum.TextXAlignment.Left
			InfoBoxDescription.TextYAlignment = Enum.TextYAlignment.Top
			
			Comments.Name = "Comments"
			Comments.Parent = InfoBox
			Comments.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Comments.Size = UDim2.new(0, 950, 0, 200)
			
			UICorner_20.CornerRadius = UDim.new(0, 12)
			UICorner_20.Parent = Comments
			
			Inner.Name = "Inner"
			Inner.Parent = Comments
			Inner.AnchorPoint = Vector2.new(0.5, 0.5)
			Inner.BackgroundColor3 = Color3.fromRGB(13, 18, 39)
			Inner.Position = UDim2.new(0.5, 0, 0.5, 0)
			Inner.Size = UDim2.new(0, 946, 0, 196)
			
			UICorner_21.CornerRadius = UDim.new(0, 12)
			UICorner_21.Parent = Inner
			
			Line.Name = "Line"
			Line.Parent = Inner
			Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Line.BorderSizePixel = 0
			Line.LayoutOrder = 1
			Line.Position = UDim2.new(0, 0, 0, 25)
			Line.Size = UDim2.new(0, 946, 0, 2)
			
			CommentsText.Name = "CommentsText"
			CommentsText.Parent = Inner
			CommentsText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CommentsText.BackgroundTransparency = 1.000
			CommentsText.Size = UDim2.new(0, 976, 0, 25)
			CommentsText.Font = Enum.Font.GothamBold
			CommentsText.Text = "Comments"
			CommentsText.TextColor3 = Color3.fromRGB(255, 255, 255)
			CommentsText.TextSize = 14.000
			
			Comments_2.Name = "Comments"
			Comments_2.Parent = Inner
			Comments_2.Active = true
			Comments_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Comments_2.BackgroundTransparency = 1.000
			Comments_2.BorderSizePixel = 0
			Comments_2.Position = UDim2.new(0, 5, 0, 30)
			Comments_2.Size = UDim2.new(0, 935, 0, 160)
			Comments_2.CanvasSize = UDim2.new(0, 0, 0, 0)
			
			Comment.Name = "Comment"
			Comment.Parent = Comments_2
			Comment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Comment.BackgroundTransparency = 1.000
			Comment.Size = UDim2.new(0, 920, 0, 50)
			
			Content.Name = "Content"
			Content.Parent = Comment
			Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Content.BackgroundTransparency = 1.000
			Content.Position = UDim2.new(0, 50, 0, 30)
			Content.Size = UDim2.new(0, 880, 0, 20)
			Content.Font = Enum.Font.Gotham
			Content.Text = "Pretty Cool Comment"
			Content.TextColor3 = Color3.fromRGB(255, 255, 255)
			Content.TextSize = 14.000
			Content.TextWrapped = true
			Content.TextXAlignment = Enum.TextXAlignment.Left
			Content.TextYAlignment = Enum.TextYAlignment.Top
			
			Author_2.Name = "Author"
			Author_2.Parent = Comment
			Author_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Author_2.BackgroundTransparency = 1.000
			Author_2.BorderSizePixel = 0
			Author_2.Position = UDim2.new(0, 50, 0, 5)
			Author_2.Size = UDim2.new(0, 200, 0, 25)
			Author_2.Font = Enum.Font.GothamBold
			Author_2.Text = "Author"
			Author_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Author_2.TextSize = 20.000
			Author_2.TextWrapped = true
			Author_2.TextXAlignment = Enum.TextXAlignment.Left
			
			ProfilePicture_2.Name = "ProfilePicture"
			ProfilePicture_2.Parent = Comment
			ProfilePicture_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ProfilePicture_2.BackgroundTransparency = 1.000
			ProfilePicture_2.Position = UDim2.new(0, 5, 0, 5)
			ProfilePicture_2.Size = UDim2.new(0, 40, 0, 40)
			ProfilePicture_2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
			
			UICorner_22.CornerRadius = UDim.new(1, 0)
			UICorner_22.Parent = ProfilePicture_2
			
			UIListLayout_3.Parent = Comments_2
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_3.Padding = UDim.new(0, 5)
			
			
			
			assert(assert, "Assert couldn't assert itself! I think your computer might be broken.")
			
			function createfolders(path)
				local pathtbl = string.split(path, "/")
				for i, v in pairs(pathtbl) do
					if i == 1 then
						if not isfolder(v) then
							makefolder(v)
						end
					else
						local newpath = pathtbl[1]
						for i2=2, i-1 do
							newpath = newpath.. "/" ..pathtbl[i2]
						end
						newpath = newpath.. "/" ..v
						if not isfolder(newpath) then
							makefolder(newpath)
						end
					end
				end
			end
			
			if not isfile("ScriptBlox/Searcher/Cache.json") and isfolder("ScriptBlox") then
				delfolder("ScriptBlox")
			end
			
			createfolders("ScriptBlox/Searcher/ImageCache/Scripts")
			createfolders("ScriptBlox/Searcher/ImageCache/ProfilePictures")
			
			if not isfile("ScriptBlox/Searcher/Cache.json") then
				writefile("ScriptBlox/Searcher/Cache.json", "{}")
			end
			
			ScriptBloxSearcher.MainFrame.InfoBox.Visible = false
			
			local getfakeasset = getcustomasset or getsynasset
			
			local HttpService = game:GetService("HttpService")
			local TweenService = game:GetService("TweenService")
			local TextService = game:GetService("TextService")
			
			local cache = HttpService:JSONDecode(readfile("ScriptBlox/Searcher/Cache.json"))
			
			local page = 1
			local gquery = ""
			
			function tableConcat(t1,t2)
				for i, v in pairs(t2) do
					table.insert(t1, v)
				end
				return t1
			end
			
			-- UI Conversion Fixes
			ScriptBloxSearcher.MainFrame.TopBarFrame.Title.RichText = true
			ScriptBloxSearcher.MainFrame.ScriptListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
			ScriptBloxSearcher.MainFrame.InfoBox.InfoBoxDescription.AutomaticSize = Enum.AutomaticSize.Y
			ScriptBloxSearcher.MainFrame.ScriptListFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
			ScriptBloxSearcher.MainFrame.InfoBox.AutomaticCanvasSize = Enum.AutomaticSize.Y
			ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments.AutomaticCanvasSize = Enum.AutomaticSize.Y
			ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments.ScrollBarImageColor3 = Color3.new(0, 0, 0)
			ScriptBloxSearcher.MainFrame.InfoBox.ScrollBarImageColor3 = Color3.new(0, 0, 0)
			
			-- Templates
			local VerifiedScript = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts.VerifiedScriptFrame:Clone()
			local Script = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts.ScriptFrame:Clone()
			ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts.ScriptFrame:Destroy()
			ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts.VerifiedScriptFrame:Destroy()
			
			local Comment = ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments.Comment:Clone()
			ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments.Comment:Destroy()
			
			-- Hover transition function
			function setHoverTransition(from, to, obj)
				from = from or obj.BackgroundColor3
				
				obj.MouseEnter:Connect(function()
			
					TweenService:Create(obj, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
						BackgroundColor3 = to
					}):Play()
			
				end)
				
				obj.MouseLeave:Connect(function()
			
					TweenService:Create(obj, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
						BackgroundColor3 = from
					}):Play()
			
				end)
			end
			
			-- Info Box Hover Trabsitions
			setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScriptBloxSearcher.MainFrame.InfoBox.Buttons.ExecuteButton)
			setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScriptBloxSearcher.MainFrame.InfoBox.Buttons.Close)
			setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScriptBloxSearcher.MainFrame.InfoBox.Buttons.CopyScriptBloxLink)
			setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScriptBloxSearcher.MainFrame.InfoBox.Buttons.CopyScriptButton)
			
			function _if(a, b, c)
				if a then return b else return c end
			end
			
			function fastmodeExec(func)
				if getgenv().fastmode == true then
					task.spawn(func)
				else
					func()
				end
			end
			
			-- fetchScripts function
			function fetchScripts(query, page)
				page = page or 1
				query = HttpService:UrlEncode(query)
				
				local url = _if(query == "", "https://www.scriptblox.com/api/script/fetch?page="..tostring(page), "https://scriptblox.com/api/script/search?q="..query.."&max=100&mode=free&page=".. tostring(page))
				local req = HttpService:JSONDecode(game:HttpGetAsync(url)).result
				
				return req.scripts
			end
			
			function fetchComments(scriptId, page)
				page = page or 1	
				
				local url = "https://scriptblox.com/api/comment/" ..scriptId.. "?page=" ..tostring(page).. "&max=20"
				local req = HttpService:JSONDecode(game:HttpGetAsync(url)).result
				
				return req.comments
			end
			
			function loadImage(url, id, ispfp)
				ispfp = _if(type(ispfp) == "boolean", ispfp, false)
				
				local path = "ScriptBlox/Searcher/ImageCache/" .._if(ispfp, "ProfilePictures/", "Scripts/")..id..".png"
				
				if table.find(string.split(url, "/"), "user-default.png") then
					path = "ScriptBlox/Searcher/ImageCache/ProfilePictures/user-default.png"
				end
				
				if isfile(path) then
					return getfakeasset(path)
				else
					local img = game:HttpGetAsync(url)
					writefile(path, img)
					
					return getfakeasset(path)
				end
			end
			
			function fixScript(scriptObj)
				if not scriptObj["script"] or not scriptObj["owner"] or not scriptObj["features"] then
					local cacheObj = cache[scriptObj["_id"]]
					if cacheObj then
						scriptObj["script"] = _if(scriptObj["script"], scriptObj["script"], cacheObj.script)
						scriptObj["features"] = _if(scriptObj["features"], scriptObj["features"], cacheObj.features)
						scriptObj["owner"] = _if(scriptObj["owner"], scriptObj["owner"], cacheObj.owner)
					else
						local req = HttpService:JSONDecode(game:HttpGetAsync("https://www.scriptblox.com/api/script/".. scriptObj.slug)).script
						scriptObj["script"] = _if(scriptObj["script"], scriptObj["script"], req.script)
						scriptObj["features"] = _if(scriptObj["features"], scriptObj["features"], req.features)
						scriptObj["owner"] = _if(scriptObj["owner"], scriptObj["owner"], req.owner)
						
						cache[scriptObj["_id"]] = req
					end
				end
				return scriptObj
			end
			
			function updateCache(newCache)
				cache = newCache
				writefile("ScriptBlox/Searcher/Cache.json", HttpService:JSONEncode(cache))
			end
			
			function updateInfoBox(scriptObj)
				scriptObj = fixScript(scriptObj)
				
				ScriptBloxSearcher.MainFrame.InfoBox.Info.Author.InfoBoxAuthor.Text = scriptObj.owner.username
				ScriptBloxSearcher.MainFrame.InfoBox.Info.Title.InfoBoxTitle.Text = scriptObj.title
				ScriptBloxSearcher.MainFrame.InfoBox.Info.Game.Text = scriptObj.game.name
				ScriptBloxSearcher.MainFrame.InfoBox.InfoBoxDescription.Text = scriptObj.features or "For features to be displayed, please use the search bar to find this script and then open the info again, this is caused by an API Error that I will fix later."
				
				task.spawn(function()
					ScriptBloxSearcher.MainFrame.InfoBox.Info.Author.ProfilePicture.Image = loadImage("https://scriptblox.com"..scriptObj.owner.profilePicture, scriptObj["owner"]["_id"], true)
				end)
				task.spawn(function()
					ScriptBloxSearcher.MainFrame.InfoBox.Info.PreviewImage.Image = loadImage(_if(string.find(scriptObj.game.imageUrl, "rbxcdn.com"), scriptObj.game.imageUrl, "https://scriptblox.com"..scriptObj.game.imageUrl), scriptObj["_id"], false)
				end)
				
				local ExecuteConnection
				local CopyLinkConnection
				local CopyScriptConnection
				
				ExecuteConnection = ScriptBloxSearcher.MainFrame.InfoBox.Buttons.ExecuteButton.MouseButton1Click:Connect(function()
					loadstring(scriptObj.script)()
				end)
				
				CopyLinkConnection = ScriptBloxSearcher.MainFrame.InfoBox.Buttons.CopyScriptBloxLink.MouseButton1Click:Connect(function()
					setclipboard("https://scriptblox.com/script/".. scriptObj.slug)
				end)
				
				CopyScriptConnection = ScriptBloxSearcher.MainFrame.InfoBox.Buttons.CopyScriptButton.MouseButton1Click:Connect(function()
					setclipboard(scriptObj.script)
				end)
				
				ScriptBloxSearcher.MainFrame.InfoBox.Buttons.Close.MouseButton1Click:Connect(function()
					ExecuteConnection:Disconnect()
					CopyLinkConnection:Disconnect()
					CopyScriptConnection:Disconnect()
					
					ScriptBloxSearcher.MainFrame.InfoBox.Visible = false
					ScriptBloxSearcher.MainFrame.ScriptListFrame.Visible = true
				end)
				
				local commentsUIListLayout = ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments.UIListLayout:Clone()
				ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments:ClearAllChildren()
				commentsUIListLayout.Parent = ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments
				
				task.spawn(function()
					for _, v in pairs(fetchComments(scriptObj["_id"])) do
			
						local newComment = Comment:Clone()
						newComment.Parent = ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments
						newComment.Content.Text = v.text
						newComment.Author.Text = v.commentBy.username
			
						task.spawn(function()
							newComment.ProfilePicture.Image = loadImage("https://scriptblox.com"..v.commentBy.profilePicture, v.commentBy["_id"], true)
						end)
			
					end
				end)
			end
			
			-- Refresh Scripts Browser with new scripts
			function refreshScripts(scriptTbl)
				if #scriptTbl <= 0 then
					ScriptBloxSearcher.MainFrame["No Scripts Found"].Visible = true
					return
				else
					ScriptBloxSearcher.MainFrame["No Scripts Found"].Visible = false
				end
				
				local UIGridLayoutCopy = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts.UIGridLayout:Clone()
				ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts:ClearAllChildren()
				UIGridLayoutCopy.Parent = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts
				
				addScripts(scriptTbl)
			end
			
			function addScripts(scriptTbl)
				for i, v in pairs(scriptTbl) do
					fastmodeExec(function()
						local newScript
			
						v = fixScript(v)
			
						if v.verified == true then
							newScript = VerifiedScript:Clone()
							newScript.ScriptTitle.Text = v.title
							newScript.ScriptAuthor.Text = "by ".. v.owner.username
							newScript.ScriptGame.Text = v.game.name
							newScript.Parent = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts
						else
							newScript = Script:Clone()
							newScript.ScriptTitle.Text = v.title
							newScript.ScriptAuthor.Text = "by ".. v.owner.username
							newScript.ScriptGame.Text = v.game.name
							newScript.Parent = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts
						end
			
						-- Execute Button
						newScript.ExecuteButton.MouseButton1Click:Connect(function()
							loadstring(v.script)()
						end)
			
						setHoverTransition(newScript.ExecuteButton.BackgroundColor3, Color3.new(0.152941, 0.188235, 0.345098), newScript.ExecuteButton)
			
						-- Info Button
						newScript.InfoButton.MouseButton1Click:Connect(function()
							updateInfoBox(v)
							task.wait()
							ScriptBloxSearcher.MainFrame.InfoBox.Visible = true
							ScriptBloxSearcher.MainFrame.ScriptListFrame.Visible = false
						end)
			
						setHoverTransition(newScript.InfoButton.BackgroundColor3, Color3.new(0.152941, 0.188235, 0.345098), newScript.InfoButton)
			
						-- Background
						setHoverTransition(newScript.BackgroundColor3, Color3.new(0.254902, 0.317647, 0.576471), newScript)
					end)
				end
				
				updateCache(cache)
				
				pagefetchrunning = false
			end
			
			
			
			-- Search Bar
			ScriptBloxSearcher.MainFrame.TopBarFrame.SearchBox.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					gquery = ScriptBloxSearcher.MainFrame.TopBarFrame.SearchBox.Text
					page = 1
					local scriptsTbl = fetchScripts(ScriptBloxSearcher.MainFrame.TopBarFrame.SearchBox.Text, 1)
					refreshScripts(scriptsTbl)
				end
			end)
			
			-- Closing
			ScriptBloxSearcher.MainFrame.TopBarFrame.CloseButton.MouseButton1Click:Connect(function()
				MainFrame.Visible = false
			end)
			
			setHoverTransition(nil, Color3.fromRGB(214, 71, 74), ScriptBloxSearcher.MainFrame.TopBarFrame.CloseButton)
			
			-- Clear Cache
			ScriptBloxSearcher.MainFrame.TopBarFrame.ClearCacheButton.MouseButton1Click:Connect(function()
				updateCache({})
				for _, v in pairs(listfiles("ScriptBlox/Searcher/ImageCache/ProfilePictures")) do
					delfile(_if(string.find(v, "ScriptBlox"), v, "ScriptBlox/Searcher/ImageCache/ProfilePictures/"..v))
				end
				for _, v in pairs(listfiles("ScriptBlox/Searcher/ImageCache/Scripts")) do
					delfile(_if(string.find(v, "ScriptBlox"), v, "ScriptBlox/Searcher/ImageCache/Scripts/"..v))
				end
			end)
			setHoverTransition(nil, Color3.new(0.254902, 0.317647, 0.576471), ScriptBloxSearcher.MainFrame.TopBarFrame.ClearCacheButton)
			
			-- Dragging
			local UserInputService = game:GetService("UserInputService")
			local gui = ScriptBloxSearcher.MainFrame
			
			local dragging
			local dragInput
			local dragStart
			local startPos
			
			local function update(input)
				local delta = input.Position - dragStart
				gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end
			
			gui.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position
			
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)
			
			gui.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
			
			UserInputService.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					update(input)
				end
			end)
			
			refreshScripts(fetchScripts(gquery, 1))
			
			ScriptBloxSearcher.MainFrame.ScriptListFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				if (ScriptBloxSearcher.MainFrame.ScriptListFrame.CanvasPosition.Y + ScriptBloxSearcher.MainFrame.ScriptListFrame.AbsoluteSize.Y) >= ScriptBloxSearcher.MainFrame.ScriptListFrame.AbsoluteCanvasSize.Y -200 and not pagefetchrunning then
					page = page + 1
					pagefetchrunning = true
					addScripts(fetchScripts(gquery, page))
				end
			end)
			local ScriptBloxSearcher = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UICorner = Instance.new("UICorner")
local TopBarFrame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local SearchBox = Instance.new("TextBox")
local UICorner_3 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("ImageButton")
local UICorner_4 = Instance.new("UICorner")
local ClearCacheButton = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local TopbarBottomCover = Instance.new("Frame")
local ScriptListFrame = Instance.new("ScrollingFrame")
local UIPadding = Instance.new("UIPadding")
local Scripts = Instance.new("Folder")
local UIGridLayout = Instance.new("UIGridLayout")
local ScriptFrame = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local ScriptTitle = Instance.new("TextLabel")
local ExecuteButton = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local InfoButton = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local ScriptAuthor = Instance.new("TextLabel")
local ScriptGame = Instance.new("TextLabel")
local VerifiedScriptFrame = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local ScriptTitle_2 = Instance.new("TextLabel")
local VerifiedIcon = Instance.new("ImageLabel")
local ExecuteButton_2 = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local InfoButton_2 = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local ScriptAuthor_2 = Instance.new("TextLabel")
local ScriptGame_2 = Instance.new("TextLabel")
local ScriptListBackgroundFrame = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local NoScriptsFound = Instance.new("TextLabel")
local InfoBox = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UICorner_13 = Instance.new("UICorner")
local Info = Instance.new("Frame")
local PreviewImage = Instance.new("ImageLabel")
local UIScale = Instance.new("UIScale")
local UICorner_14 = Instance.new("UICorner")
local Author = Instance.new("Frame")
local InfoBoxAuthor = Instance.new("TextLabel")
local ProfilePicture = Instance.new("ImageLabel")
local UICorner_15 = Instance.new("UICorner")
local Title_2 = Instance.new("Frame")
local InfoBoxTitle = Instance.new("TextLabel")
local Game = Instance.new("TextLabel")
local Buttons = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local Close = Instance.new("TextButton")
local UICorner_16 = Instance.new("UICorner")
local CopyScriptBloxLink = Instance.new("TextButton")
local UICorner_17 = Instance.new("UICorner")
local CopyScriptButton = Instance.new("TextButton")
local UICorner_18 = Instance.new("UICorner")
local ExecuteButton_3 = Instance.new("TextButton")
local UICorner_19 = Instance.new("UICorner")
local InfoBoxDescription = Instance.new("TextLabel")
local Comments = Instance.new("Frame")
local UICorner_20 = Instance.new("UICorner")
local Inner = Instance.new("Frame")
local UICorner_21 = Instance.new("UICorner")
local Line = Instance.new("Frame")
local CommentsText = Instance.new("TextLabel")
local Comments_2 = Instance.new("ScrollingFrame")
local Comment = Instance.new("Frame")
local Content = Instance.new("TextLabel")
local Author_2 = Instance.new("TextLabel")
local ProfilePicture_2 = Instance.new("ImageLabel")
local UICorner_22 = Instance.new("UICorner")
local UIListLayout_3 = Instance.new("UIListLayout")

ScriptBloxSearcher.Name = "ScriptBloxSearcher"
ScriptBloxSearcher.Parent = game:GetService("CoreGui")
ScriptBloxSearcher.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScriptBloxSearcher.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScriptBloxSearcher
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 1019, 0, 571)
MainFrame.ZIndex = 2

UIAspectRatioConstraint.Parent = MainFrame
UIAspectRatioConstraint.AspectRatio = 1.778

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

TopBarFrame.Name = "TopBarFrame"
TopBarFrame.Parent = MainFrame
TopBarFrame.BackgroundColor3 = Color3.fromRGB(13, 18, 39)
TopBarFrame.Size = UDim2.new(0, 1015, 0, 40)
TopBarFrame.ZIndex = 2

UICorner_2.CornerRadius = UDim.new(0, 12)
UICorner_2.Parent = TopBarFrame

SearchBox.Name = "SearchBox"
SearchBox.Parent = TopBarFrame
SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.Position = UDim2.new(0, 5, 0, 5)
SearchBox.Size = UDim2.new(0, 220, 0, 30)
SearchBox.ClearTextOnFocus = false
SearchBox.Font = Enum.Font.Gotham
SearchBox.PlaceholderText = "Search"
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(0, 0, 0)
SearchBox.TextScaled = true
SearchBox.TextSize = 14.000
SearchBox.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0, 12)
UICorner_3.Parent = SearchBox

Title.Name = "Title"
Title.Parent = TopBarFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(0, 1015, 0, 40)
Title.Font = Enum.Font.Gotham
Title.Text = "<font color=\"#8C7DFF\">Script</font>Blox"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 28.000

CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBarFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(214, 21, 24)
CloseButton.Position = UDim2.new(0, 980, 0, 5)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.AutoButtonColor = false
CloseButton.Image = "rbxassetid://54479706"

UICorner_4.CornerRadius = UDim.new(0, 12)
UICorner_4.Parent = CloseButton

ClearCacheButton.Name = "ClearCacheButton"
ClearCacheButton.Parent = TopBarFrame
ClearCacheButton.BackgroundColor3 = Color3.fromRGB(39, 48, 88)
ClearCacheButton.Position = UDim2.new(0, 755, 0, 5)
ClearCacheButton.Size = UDim2.new(0, 220, 0, 30)
ClearCacheButton.AutoButtonColor = false
ClearCacheButton.Font = Enum.Font.GothamSemibold
ClearCacheButton.Text = "Clear Cache"
ClearCacheButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearCacheButton.TextSize = 24.000
ClearCacheButton.TextWrapped = true

UICorner_5.CornerRadius = UDim.new(0, 12)
UICorner_5.Parent = ClearCacheButton

TopbarBottomCover.Name = "TopbarBottomCover"
TopbarBottomCover.Parent = MainFrame
TopbarBottomCover.BackgroundColor3 = Color3.fromRGB(13, 18, 39)
TopbarBottomCover.BorderSizePixel = 0
TopbarBottomCover.LayoutOrder = 1
TopbarBottomCover.Position = UDim2.new(3.0063287e-08, 0, 0.0437828377, 0)
TopbarBottomCover.Size = UDim2.new(0, 1015, 0, 15)

ScriptListFrame.Name = "ScriptListFrame"
ScriptListFrame.Parent = MainFrame
ScriptListFrame.Active = true
ScriptListFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptListFrame.BackgroundTransparency = 1.000
ScriptListFrame.BorderSizePixel = 0
ScriptListFrame.Position = UDim2.new(0, 10, 0.0700000003, 10)
ScriptListFrame.Size = UDim2.new(0, 995, 0, 511)
ScriptListFrame.ZIndex = 2
ScriptListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

UIPadding.Parent = ScriptListFrame
UIPadding.PaddingBottom = UDim.new(0, 10)
UIPadding.PaddingLeft = UDim.new(0, 25)
UIPadding.PaddingRight = UDim.new(0, 25)
UIPadding.PaddingTop = UDim.new(0, 10)

Scripts.Name = "Scripts"
Scripts.Parent = ScriptListFrame

UIGridLayout.Parent = Scripts
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 20, 0, 20)
UIGridLayout.CellSize = UDim2.new(0, 300, 0, 150)

ScriptFrame.Name = "ScriptFrame"
ScriptFrame.Parent = Scripts
ScriptFrame.BackgroundColor3 = Color3.fromRGB(39, 48, 88)
ScriptFrame.Size = UDim2.new(0, 300, 0, 150)

UICorner_6.CornerRadius = UDim.new(0, 12)
UICorner_6.Parent = ScriptFrame

ScriptTitle.Name = "ScriptTitle"
ScriptTitle.Parent = ScriptFrame
ScriptTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle.BackgroundTransparency = 1.000
ScriptTitle.Position = UDim2.new(0, 10, 0, 10)
ScriptTitle.Size = UDim2.new(0, 280, 0, 40)
ScriptTitle.Font = Enum.Font.Gotham
ScriptTitle.Text = "Script Title"
ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle.TextScaled = true
ScriptTitle.TextSize = 14.000
ScriptTitle.TextWrapped = true
ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left

ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = ScriptFrame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
ExecuteButton.Position = UDim2.new(0.0399999991, 0, 0.733333349, 0)
ExecuteButton.Size = UDim2.new(0, 130, 0, 30)
ExecuteButton.AutoButtonColor = false
ExecuteButton.Font = Enum.Font.GothamBold
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 14.000

UICorner_7.CornerRadius = UDim.new(0, 12)
UICorner_7.Parent = ExecuteButton

InfoButton.Name = "InfoButton"
InfoButton.Parent = ScriptFrame
InfoButton.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
InfoButton.Position = UDim2.new(0.533333361, 0, 0.733333349, 0)
InfoButton.Size = UDim2.new(0, 130, 0, 30)
InfoButton.AutoButtonColor = false
InfoButton.Font = Enum.Font.GothamBold
InfoButton.Text = "Info"
InfoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoButton.TextSize = 14.000

UICorner_8.CornerRadius = UDim.new(0, 12)
UICorner_8.Parent = InfoButton

ScriptAuthor.Name = "ScriptAuthor"
ScriptAuthor.Parent = ScriptFrame
ScriptAuthor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptAuthor.BackgroundTransparency = 1.000
ScriptAuthor.Position = UDim2.new(0, 10, 0, 55)
ScriptAuthor.Size = UDim2.new(0, 280, 0, 25)
ScriptAuthor.Font = Enum.Font.Gotham
ScriptAuthor.Text = "by ScriptAuthor"
ScriptAuthor.TextColor3 = Color3.fromRGB(192, 192, 192)
ScriptAuthor.TextSize = 14.000
ScriptAuthor.TextWrapped = true
ScriptAuthor.TextXAlignment = Enum.TextXAlignment.Left

ScriptGame.Name = "ScriptGame"
ScriptGame.Parent = ScriptFrame
ScriptGame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptGame.BackgroundTransparency = 1.000
ScriptGame.Position = UDim2.new(0, 10, 0, 80)
ScriptGame.Size = UDim2.new(0, 280, 0, 25)
ScriptGame.Font = Enum.Font.Gotham
ScriptGame.Text = "Game"
ScriptGame.TextColor3 = Color3.fromRGB(192, 192, 192)
ScriptGame.TextSize = 14.000
ScriptGame.TextWrapped = true
ScriptGame.TextXAlignment = Enum.TextXAlignment.Left

VerifiedScriptFrame.Name = "VerifiedScriptFrame"
VerifiedScriptFrame.Parent = Scripts
VerifiedScriptFrame.BackgroundColor3 = Color3.fromRGB(39, 48, 88)
VerifiedScriptFrame.Size = UDim2.new(0, 300, 0, 150)

UICorner_9.CornerRadius = UDim.new(0, 12)
UICorner_9.Parent = VerifiedScriptFrame

ScriptTitle_2.Name = "ScriptTitle"
ScriptTitle_2.Parent = VerifiedScriptFrame
ScriptTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle_2.BackgroundTransparency = 1.000
ScriptTitle_2.Position = UDim2.new(0, 50, 0, 10)
ScriptTitle_2.Size = UDim2.new(0, 240, 0, 40)
ScriptTitle_2.Font = Enum.Font.Gotham
ScriptTitle_2.Text = "Script Title"
ScriptTitle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle_2.TextScaled = true
ScriptTitle_2.TextSize = 14.000
ScriptTitle_2.TextWrapped = true
ScriptTitle_2.TextXAlignment = Enum.TextXAlignment.Left

VerifiedIcon.Name = "VerifiedIcon"
VerifiedIcon.Parent = VerifiedScriptFrame
VerifiedIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VerifiedIcon.BackgroundTransparency = 1.000
VerifiedIcon.Position = UDim2.new(0, 10, 0, 15)
VerifiedIcon.Size = UDim2.new(0, 30, 0, 30)
VerifiedIcon.Image = "rbxassetid://8240362117"

ExecuteButton_2.Name = "ExecuteButton"
ExecuteButton_2.Parent = VerifiedScriptFrame
ExecuteButton_2.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
ExecuteButton_2.Position = UDim2.new(0.0399999991, 0, 0.733333349, 0)
ExecuteButton_2.Size = UDim2.new(0, 130, 0, 30)
ExecuteButton_2.AutoButtonColor = false
ExecuteButton_2.Font = Enum.Font.GothamBold
ExecuteButton_2.Text = "Execute"
ExecuteButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton_2.TextSize = 14.000

UICorner_10.CornerRadius = UDim.new(0, 12)
UICorner_10.Parent = ExecuteButton_2

InfoButton_2.Name = "InfoButton"
InfoButton_2.Parent = VerifiedScriptFrame
InfoButton_2.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
InfoButton_2.Position = UDim2.new(0.533333361, 0, 0.733333349, 0)
InfoButton_2.Size = UDim2.new(0, 130, 0, 30)
InfoButton_2.AutoButtonColor = false
InfoButton_2.Font = Enum.Font.GothamBold
InfoButton_2.Text = "Info"
InfoButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoButton_2.TextSize = 14.000

UICorner_11.CornerRadius = UDim.new(0, 12)
UICorner_11.Parent = InfoButton_2

ScriptAuthor_2.Name = "ScriptAuthor"
ScriptAuthor_2.Parent = VerifiedScriptFrame
ScriptAuthor_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptAuthor_2.BackgroundTransparency = 1.000
ScriptAuthor_2.Position = UDim2.new(0.0399999991, 0, 0.366666675, 0)
ScriptAuthor_2.Size = UDim2.new(0, 280, 0, 25)
ScriptAuthor_2.Font = Enum.Font.Gotham
ScriptAuthor_2.Text = "by ScriptAuthor"
ScriptAuthor_2.TextColor3 = Color3.fromRGB(192, 192, 192)
ScriptAuthor_2.TextSize = 14.000
ScriptAuthor_2.TextWrapped = true
ScriptAuthor_2.TextXAlignment = Enum.TextXAlignment.Left

ScriptGame_2.Name = "ScriptGame"
ScriptGame_2.Parent = VerifiedScriptFrame
ScriptGame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptGame_2.BackgroundTransparency = 1.000
ScriptGame_2.Position = UDim2.new(0, 10, 0, 80)
ScriptGame_2.Size = UDim2.new(0, 280, 0, 25)
ScriptGame_2.Font = Enum.Font.Gotham
ScriptGame_2.Text = "Game"
ScriptGame_2.TextColor3 = Color3.fromRGB(192, 192, 192)
ScriptGame_2.TextSize = 14.000
ScriptGame_2.TextWrapped = true
ScriptGame_2.TextXAlignment = Enum.TextXAlignment.Left

ScriptListBackgroundFrame.Name = "ScriptListBackgroundFrame"
ScriptListBackgroundFrame.Parent = MainFrame
ScriptListBackgroundFrame.BackgroundColor3 = Color3.fromRGB(13, 18, 39)
ScriptListBackgroundFrame.Position = UDim2.new(0, 10, 0.0700000003, 10)
ScriptListBackgroundFrame.Size = UDim2.new(0, 995, 0, 511)

UICorner_12.CornerRadius = UDim.new(0, 12)
UICorner_12.Parent = ScriptListBackgroundFrame

NoScriptsFound.Name = "No Scripts Found"
NoScriptsFound.Parent = MainFrame
NoScriptsFound.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NoScriptsFound.BackgroundTransparency = 1.000
NoScriptsFound.Position = UDim2.new(3.0063287e-08, 10, 0.0700000003, 10)
NoScriptsFound.Size = UDim2.new(0, 995, 0, 509)
NoScriptsFound.Visible = false
NoScriptsFound.ZIndex = 3
NoScriptsFound.Font = Enum.Font.GothamSemibold
NoScriptsFound.Text = "No Scripts have been found!"
NoScriptsFound.TextColor3 = Color3.fromRGB(255, 0, 0)
NoScriptsFound.TextScaled = true
NoScriptsFound.TextSize = 100.000
NoScriptsFound.TextWrapped = true

InfoBox.Name = "InfoBox"
InfoBox.Parent = MainFrame
InfoBox.Active = true
InfoBox.BackgroundColor3 = Color3.fromRGB(13, 18, 39)
InfoBox.BorderSizePixel = 0
InfoBox.Position = UDim2.new(0, 10, 0, 50)
InfoBox.Size = UDim2.new(0, 995, 0, 510)
InfoBox.ZIndex = 3
InfoBox.CanvasSize = UDim2.new(0, 0, 0, 0)
InfoBox.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

UIListLayout.Parent = InfoBox
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

UICorner_13.CornerRadius = UDim.new(0, 12)
UICorner_13.Parent = InfoBox

Info.Name = "Info"
Info.Parent = InfoBox
Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Info.BackgroundTransparency = 1.000
Info.Size = UDim2.new(0, 995, 0, 207)

PreviewImage.Name = "PreviewImage"
PreviewImage.Parent = Info
PreviewImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PreviewImage.BackgroundTransparency = 1.000
PreviewImage.Position = UDim2.new(0, 50, 0, 10)
PreviewImage.Size = UDim2.new(0, 480, 0, 270)
PreviewImage.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

UIScale.Parent = PreviewImage
UIScale.Scale = 0.700

UICorner_14.CornerRadius = UDim.new(0, 24)
UICorner_14.Parent = PreviewImage

Author.Name = "Author"
Author.Parent = Info
Author.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Author.BackgroundTransparency = 1.000
Author.Position = UDim2.new(0, 395, 0, 110)
Author.Size = UDim2.new(0, 250, 0, 40)

InfoBoxAuthor.Name = "InfoBoxAuthor"
InfoBoxAuthor.Parent = Author
InfoBoxAuthor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoBoxAuthor.BackgroundTransparency = 1.000
InfoBoxAuthor.BorderSizePixel = 0
InfoBoxAuthor.Position = UDim2.new(0, 45, 0, 0)
InfoBoxAuthor.Size = UDim2.new(0, 150, 0, 40)
InfoBoxAuthor.Font = Enum.Font.Gotham
InfoBoxAuthor.Text = "Author"
InfoBoxAuthor.TextColor3 = Color3.fromRGB(140, 125, 233)
InfoBoxAuthor.TextSize = 20.000
InfoBoxAuthor.TextWrapped = true
InfoBoxAuthor.TextXAlignment = Enum.TextXAlignment.Left

ProfilePicture.Name = "ProfilePicture"
ProfilePicture.Parent = Author
ProfilePicture.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProfilePicture.BackgroundTransparency = 1.000
ProfilePicture.Size = UDim2.new(0, 40, 0, 40)
ProfilePicture.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

UICorner_15.CornerRadius = UDim.new(1, 0)
UICorner_15.Parent = ProfilePicture

Title_2.Name = "Title"
Title_2.Parent = Info
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.Position = UDim2.new(0, 395, 0, 10)
Title_2.Size = UDim2.new(0, 550, 0, 50)

InfoBoxTitle.Name = "InfoBoxTitle"
InfoBoxTitle.Parent = Title_2
InfoBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoBoxTitle.BackgroundTransparency = 1.000
InfoBoxTitle.Size = UDim2.new(0, 550, 0, 50)
InfoBoxTitle.Font = Enum.Font.GothamSemibold
InfoBoxTitle.Text = "Script Title"
InfoBoxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoBoxTitle.TextScaled = true
InfoBoxTitle.TextSize = 14.000
InfoBoxTitle.TextWrapped = true
InfoBoxTitle.TextXAlignment = Enum.TextXAlignment.Left

Game.Name = "Game"
Game.Parent = Info
Game.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Game.BackgroundTransparency = 1.000
Game.Position = UDim2.new(0, 395, 0, 70)
Game.Size = UDim2.new(0, 250, 0, 25)
Game.Font = Enum.Font.Gotham
Game.Text = "Game Name"
Game.TextColor3 = Color3.fromRGB(255, 255, 255)
Game.TextSize = 22.000
Game.TextXAlignment = Enum.TextXAlignment.Left

Buttons.Name = "Buttons"
Buttons.Parent = InfoBox
Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Buttons.BackgroundTransparency = 1.000
Buttons.Position = UDim2.new(0.0100502511, 0, 0.911764622, 0)
Buttons.Size = UDim2.new(0, 975, 0, 35)

UIListLayout_2.Parent = Buttons
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_2.Padding = UDim.new(0, 40)

Close.Name = "Close"
Close.Parent = Buttons
Close.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
Close.LayoutOrder = 3
Close.Position = UDim2.new(0, 735, 0, 465)
Close.Size = UDim2.new(0, 200, 0, 35)
Close.ZIndex = 2
Close.AutoButtonColor = false
Close.Font = Enum.Font.GothamBold
Close.Text = "Close"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14.000

UICorner_16.CornerRadius = UDim.new(0, 12)
UICorner_16.Parent = Close

CopyScriptBloxLink.Name = "CopyScriptBloxLink"
CopyScriptBloxLink.Parent = Buttons
CopyScriptBloxLink.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
CopyScriptBloxLink.LayoutOrder = 1
CopyScriptBloxLink.Position = UDim2.new(0, 505, 0, 465)
CopyScriptBloxLink.Size = UDim2.new(0, 200, 0, 35)
CopyScriptBloxLink.AutoButtonColor = false
CopyScriptBloxLink.Font = Enum.Font.GothamBold
CopyScriptBloxLink.Text = "Copy ScriptBlox Link"
CopyScriptBloxLink.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyScriptBloxLink.TextSize = 14.000

UICorner_17.CornerRadius = UDim.new(0, 12)
UICorner_17.Parent = CopyScriptBloxLink

CopyScriptButton.Name = "CopyScriptButton"
CopyScriptButton.Parent = Buttons
CopyScriptButton.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
CopyScriptButton.LayoutOrder = 2
CopyScriptButton.Position = UDim2.new(0, 270, 0, 465)
CopyScriptButton.Size = UDim2.new(0, 200, 0, 35)
CopyScriptButton.AutoButtonColor = false
CopyScriptButton.Font = Enum.Font.GothamBold
CopyScriptButton.Text = "Copy Script"
CopyScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyScriptButton.TextSize = 14.000

UICorner_18.CornerRadius = UDim.new(0, 12)
UICorner_18.Parent = CopyScriptButton

ExecuteButton_3.Name = "ExecuteButton"
ExecuteButton_3.Parent = Buttons
ExecuteButton_3.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
ExecuteButton_3.Position = UDim2.new(0, 30, 0, 465)
ExecuteButton_3.Size = UDim2.new(0, 200, 0, 35)
ExecuteButton_3.AutoButtonColor = false
ExecuteButton_3.Font = Enum.Font.GothamBold
ExecuteButton_3.Text = "Execute"
ExecuteButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton_3.TextSize = 14.000

UICorner_19.CornerRadius = UDim.new(0, 12)
UICorner_19.Parent = ExecuteButton_3

InfoBoxDescription.Name = "InfoBoxDescription"
InfoBoxDescription.Parent = InfoBox
InfoBoxDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoBoxDescription.BackgroundTransparency = 1.000
InfoBoxDescription.Size = UDim2.new(0, 960, 0, 0)
InfoBoxDescription.Font = Enum.Font.Gotham
InfoBoxDescription.Text = "This is a pretty cool description!"
InfoBoxDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoBoxDescription.TextSize = 20.000
InfoBoxDescription.TextWrapped = true
InfoBoxDescription.TextXAlignment = Enum.TextXAlignment.Left
InfoBoxDescription.TextYAlignment = Enum.TextYAlignment.Top

Comments.Name = "Comments"
Comments.Parent = InfoBox
Comments.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Comments.Size = UDim2.new(0, 950, 0, 200)

UICorner_20.CornerRadius = UDim.new(0, 12)
UICorner_20.Parent = Comments

Inner.Name = "Inner"
Inner.Parent = Comments
Inner.AnchorPoint = Vector2.new(0.5, 0.5)
Inner.BackgroundColor3 = Color3.fromRGB(13, 18, 39)
Inner.Position = UDim2.new(0.5, 0, 0.5, 0)
Inner.Size = UDim2.new(0, 946, 0, 196)

UICorner_21.CornerRadius = UDim.new(0, 12)
UICorner_21.Parent = Inner

Line.Name = "Line"
Line.Parent = Inner
Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line.BorderSizePixel = 0
Line.LayoutOrder = 1
Line.Position = UDim2.new(0, 0, 0, 25)
Line.Size = UDim2.new(0, 946, 0, 2)

CommentsText.Name = "CommentsText"
CommentsText.Parent = Inner
CommentsText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommentsText.BackgroundTransparency = 1.000
CommentsText.Size = UDim2.new(0, 976, 0, 25)
CommentsText.Font = Enum.Font.GothamBold
CommentsText.Text = "Comments"
CommentsText.TextColor3 = Color3.fromRGB(255, 255, 255)
CommentsText.TextSize = 14.000

Comments_2.Name = "Comments"
Comments_2.Parent = Inner
Comments_2.Active = true
Comments_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Comments_2.BackgroundTransparency = 1.000
Comments_2.BorderSizePixel = 0
Comments_2.Position = UDim2.new(0, 5, 0, 30)
Comments_2.Size = UDim2.new(0, 935, 0, 160)
Comments_2.CanvasSize = UDim2.new(0, 0, 0, 0)

Comment.Name = "Comment"
Comment.Parent = Comments_2
Comment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Comment.BackgroundTransparency = 1.000
Comment.Size = UDim2.new(0, 920, 0, 50)

Content.Name = "Content"
Content.Parent = Comment
Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Content.BackgroundTransparency = 1.000
Content.Position = UDim2.new(0, 50, 0, 30)
Content.Size = UDim2.new(0, 880, 0, 20)
Content.Font = Enum.Font.Gotham
Content.Text = "Pretty Cool Comment"
Content.TextColor3 = Color3.fromRGB(255, 255, 255)
Content.TextSize = 14.000
Content.TextWrapped = true
Content.TextXAlignment = Enum.TextXAlignment.Left
Content.TextYAlignment = Enum.TextYAlignment.Top

Author_2.Name = "Author"
Author_2.Parent = Comment
Author_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Author_2.BackgroundTransparency = 1.000
Author_2.BorderSizePixel = 0
Author_2.Position = UDim2.new(0, 50, 0, 5)
Author_2.Size = UDim2.new(0, 200, 0, 25)
Author_2.Font = Enum.Font.GothamBold
Author_2.Text = "Author"
Author_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Author_2.TextSize = 20.000
Author_2.TextWrapped = true
Author_2.TextXAlignment = Enum.TextXAlignment.Left

ProfilePicture_2.Name = "ProfilePicture"
ProfilePicture_2.Parent = Comment
ProfilePicture_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProfilePicture_2.BackgroundTransparency = 1.000
ProfilePicture_2.Position = UDim2.new(0, 5, 0, 5)
ProfilePicture_2.Size = UDim2.new(0, 40, 0, 40)
ProfilePicture_2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

UICorner_22.CornerRadius = UDim.new(1, 0)
UICorner_22.Parent = ProfilePicture_2

UIListLayout_3.Parent = Comments_2
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 5)



assert(assert, "Assert couldn't assert itself! I think your computer might be broken.")

function createfolders(path)
	local pathtbl = string.split(path, "/")
	for i, v in pairs(pathtbl) do
		if i == 1 then
			if not isfolder(v) then
				makefolder(v)
			end
		else
			local newpath = pathtbl[1]
			for i2=2, i-1 do
				newpath = newpath.. "/" ..pathtbl[i2]
			end
			newpath = newpath.. "/" ..v
			if not isfolder(newpath) then
				makefolder(newpath)
			end
		end
	end
end

if not isfile("ScriptBlox/Searcher/Cache.json") and isfolder("ScriptBlox") then
	delfolder("ScriptBlox")
end

createfolders("ScriptBlox/Searcher/ImageCache/Scripts")
createfolders("ScriptBlox/Searcher/ImageCache/ProfilePictures")

if not isfile("ScriptBlox/Searcher/Cache.json") then
	writefile("ScriptBlox/Searcher/Cache.json", "{}")
end

ScriptBloxSearcher.MainFrame.InfoBox.Visible = false

local getfakeasset = getcustomasset or getsynasset

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")

local cache = HttpService:JSONDecode(readfile("ScriptBlox/Searcher/Cache.json"))

local page = 1
local gquery = ""

function tableConcat(t1,t2)
	for i, v in pairs(t2) do
		table.insert(t1, v)
	end
	return t1
end

-- UI Conversion Fixes
ScriptBloxSearcher.MainFrame.TopBarFrame.Title.RichText = true
ScriptBloxSearcher.MainFrame.ScriptListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScriptBloxSearcher.MainFrame.InfoBox.InfoBoxDescription.AutomaticSize = Enum.AutomaticSize.Y
ScriptBloxSearcher.MainFrame.ScriptListFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ScriptBloxSearcher.MainFrame.InfoBox.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments.ScrollBarImageColor3 = Color3.new(0, 0, 0)
ScriptBloxSearcher.MainFrame.InfoBox.ScrollBarImageColor3 = Color3.new(0, 0, 0)

-- Templates
local VerifiedScript = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts.VerifiedScriptFrame:Clone()
local Script = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts.ScriptFrame:Clone()
ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts.ScriptFrame:Destroy()
ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts.VerifiedScriptFrame:Destroy()

local Comment = ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments.Comment:Clone()
ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments.Comment:Destroy()

-- Hover transition function
function setHoverTransition(from, to, obj)
	from = from or obj.BackgroundColor3
	
	obj.MouseEnter:Connect(function()

		TweenService:Create(obj, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
			BackgroundColor3 = to
		}):Play()

	end)
	
	obj.MouseLeave:Connect(function()

		TweenService:Create(obj, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
			BackgroundColor3 = from
		}):Play()

	end)
end

-- Info Box Hover Trabsitions
setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScriptBloxSearcher.MainFrame.InfoBox.Buttons.ExecuteButton)
setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScriptBloxSearcher.MainFrame.InfoBox.Buttons.Close)
setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScriptBloxSearcher.MainFrame.InfoBox.Buttons.CopyScriptBloxLink)
setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScriptBloxSearcher.MainFrame.InfoBox.Buttons.CopyScriptButton)

function _if(a, b, c)
	if a then return b else return c end
end

function fastmodeExec(func)
	if getgenv().fastmode == true then
		task.spawn(func)
	else
		func()
	end
end

-- fetchScripts function
function fetchScripts(query, page)
	page = page or 1
	query = HttpService:UrlEncode(query)
	
	local url = _if(query == "", "https://www.scriptblox.com/api/script/fetch?page="..tostring(page), "https://scriptblox.com/api/script/search?q="..query.."&max=100&mode=free&page=".. tostring(page))
	local req = HttpService:JSONDecode(game:HttpGetAsync(url)).result
	
	return req.scripts
end

function fetchComments(scriptId, page)
	page = page or 1	
	
	local url = "https://scriptblox.com/api/comment/" ..scriptId.. "?page=" ..tostring(page).. "&max=20"
	local req = HttpService:JSONDecode(game:HttpGetAsync(url)).result
	
	return req.comments
end

function loadImage(url, id, ispfp)
	ispfp = _if(type(ispfp) == "boolean", ispfp, false)
	
	local path = "ScriptBlox/Searcher/ImageCache/" .._if(ispfp, "ProfilePictures/", "Scripts/")..id..".png"
	
	if table.find(string.split(url, "/"), "user-default.png") then
		path = "ScriptBlox/Searcher/ImageCache/ProfilePictures/user-default.png"
	end
	
	if isfile(path) then
		return getfakeasset(path)
	else
		local img = game:HttpGetAsync(url)
		writefile(path, img)
		
		return getfakeasset(path)
	end
end

function fixScript(scriptObj)
	if not scriptObj["script"] or not scriptObj["owner"] or not scriptObj["features"] then
		local cacheObj = cache[scriptObj["_id"]]
		if cacheObj then
			scriptObj["script"] = _if(scriptObj["script"], scriptObj["script"], cacheObj.script)
			scriptObj["features"] = _if(scriptObj["features"], scriptObj["features"], cacheObj.features)
			scriptObj["owner"] = _if(scriptObj["owner"], scriptObj["owner"], cacheObj.owner)
		else
			local req = HttpService:JSONDecode(game:HttpGetAsync("https://www.scriptblox.com/api/script/".. scriptObj.slug)).script
			scriptObj["script"] = _if(scriptObj["script"], scriptObj["script"], req.script)
			scriptObj["features"] = _if(scriptObj["features"], scriptObj["features"], req.features)
			scriptObj["owner"] = _if(scriptObj["owner"], scriptObj["owner"], req.owner)
			
			cache[scriptObj["_id"]] = req
		end
	end
	return scriptObj
end

function updateCache(newCache)
	cache = newCache
	writefile("ScriptBlox/Searcher/Cache.json", HttpService:JSONEncode(cache))
end

function updateInfoBox(scriptObj)
	scriptObj = fixScript(scriptObj)
	
	ScriptBloxSearcher.MainFrame.InfoBox.Info.Author.InfoBoxAuthor.Text = scriptObj.owner.username
	ScriptBloxSearcher.MainFrame.InfoBox.Info.Title.InfoBoxTitle.Text = scriptObj.title
	ScriptBloxSearcher.MainFrame.InfoBox.Info.Game.Text = scriptObj.game.name
	ScriptBloxSearcher.MainFrame.InfoBox.InfoBoxDescription.Text = scriptObj.features or "For features to be displayed, please use the search bar to find this script and then open the info again, this is caused by an API Error that I will fix later."
	
	task.spawn(function()
		ScriptBloxSearcher.MainFrame.InfoBox.Info.Author.ProfilePicture.Image = loadImage("https://scriptblox.com"..scriptObj.owner.profilePicture, scriptObj["owner"]["_id"], true)
	end)
	task.spawn(function()
		ScriptBloxSearcher.MainFrame.InfoBox.Info.PreviewImage.Image = loadImage(_if(string.find(scriptObj.game.imageUrl, "rbxcdn.com"), scriptObj.game.imageUrl, "https://scriptblox.com"..scriptObj.game.imageUrl), scriptObj["_id"], false)
	end)
	
	local ExecuteConnection
	local CopyLinkConnection
	local CopyScriptConnection
	
	ExecuteConnection = ScriptBloxSearcher.MainFrame.InfoBox.Buttons.ExecuteButton.MouseButton1Click:Connect(function()
		loadstring(scriptObj.script)()
	end)
	
	CopyLinkConnection = ScriptBloxSearcher.MainFrame.InfoBox.Buttons.CopyScriptBloxLink.MouseButton1Click:Connect(function()
		setclipboard("https://scriptblox.com/script/".. scriptObj.slug)
	end)
	
	CopyScriptConnection = ScriptBloxSearcher.MainFrame.InfoBox.Buttons.CopyScriptButton.MouseButton1Click:Connect(function()
		setclipboard(scriptObj.script)
	end)
	
	ScriptBloxSearcher.MainFrame.InfoBox.Buttons.Close.MouseButton1Click:Connect(function()
		ExecuteConnection:Disconnect()
		CopyLinkConnection:Disconnect()
		CopyScriptConnection:Disconnect()
		
		ScriptBloxSearcher.MainFrame.InfoBox.Visible = false
		ScriptBloxSearcher.MainFrame.ScriptListFrame.Visible = true
	end)
	
	local commentsUIListLayout = ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments.UIListLayout:Clone()
	ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments:ClearAllChildren()
	commentsUIListLayout.Parent = ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments
	
	task.spawn(function()
		for _, v in pairs(fetchComments(scriptObj["_id"])) do

			local newComment = Comment:Clone()
			newComment.Parent = ScriptBloxSearcher.MainFrame.InfoBox.Comments.Inner.Comments
			newComment.Content.Text = v.text
			newComment.Author.Text = v.commentBy.username

			task.spawn(function()
				newComment.ProfilePicture.Image = loadImage("https://scriptblox.com"..v.commentBy.profilePicture, v.commentBy["_id"], true)
			end)

		end
	end)
end

-- Refresh Scripts Browser with new scripts
function refreshScripts(scriptTbl)
	if #scriptTbl <= 0 then
		ScriptBloxSearcher.MainFrame["No Scripts Found"].Visible = true
		return
	else
		ScriptBloxSearcher.MainFrame["No Scripts Found"].Visible = false
	end
	
	local UIGridLayoutCopy = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts.UIGridLayout:Clone()
	ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts:ClearAllChildren()
	UIGridLayoutCopy.Parent = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts
	
	addScripts(scriptTbl)
end

function addScripts(scriptTbl)
	for i, v in pairs(scriptTbl) do
		fastmodeExec(function()
			local newScript

			v = fixScript(v)

			if v.verified == true then
				newScript = VerifiedScript:Clone()
				newScript.ScriptTitle.Text = v.title
				newScript.ScriptAuthor.Text = "by ".. v.owner.username
				newScript.ScriptGame.Text = v.game.name
				newScript.Parent = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts
			else
				newScript = Script:Clone()
				newScript.ScriptTitle.Text = v.title
				newScript.ScriptAuthor.Text = "by ".. v.owner.username
				newScript.ScriptGame.Text = v.game.name
				newScript.Parent = ScriptBloxSearcher.MainFrame.ScriptListFrame.Scripts
			end

			-- Execute Button
			newScript.ExecuteButton.MouseButton1Click:Connect(function()
				loadstring(v.script)()
			end)

			setHoverTransition(newScript.ExecuteButton.BackgroundColor3, Color3.new(0.152941, 0.188235, 0.345098), newScript.ExecuteButton)

			-- Info Button
			newScript.InfoButton.MouseButton1Click:Connect(function()
				updateInfoBox(v)
				task.wait()
				ScriptBloxSearcher.MainFrame.InfoBox.Visible = true
				ScriptBloxSearcher.MainFrame.ScriptListFrame.Visible = false
			end)

			setHoverTransition(newScript.InfoButton.BackgroundColor3, Color3.new(0.152941, 0.188235, 0.345098), newScript.InfoButton)

			-- Background
			setHoverTransition(newScript.BackgroundColor3, Color3.new(0.254902, 0.317647, 0.576471), newScript)
		end)
	end
	
	updateCache(cache)
	
	pagefetchrunning = false
end



-- Search Bar
ScriptBloxSearcher.MainFrame.TopBarFrame.SearchBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		gquery = ScriptBloxSearcher.MainFrame.TopBarFrame.SearchBox.Text
		page = 1
		local scriptsTbl = fetchScripts(ScriptBloxSearcher.MainFrame.TopBarFrame.SearchBox.Text, 1)
		refreshScripts(scriptsTbl)
	end
end)

-- Closing
ScriptBloxSearcher.MainFrame.TopBarFrame.CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

setHoverTransition(nil, Color3.fromRGB(214, 71, 74), ScriptBloxSearcher.MainFrame.TopBarFrame.CloseButton)

-- Clear Cache
ScriptBloxSearcher.MainFrame.TopBarFrame.ClearCacheButton.MouseButton1Click:Connect(function()
	updateCache({})
	for _, v in pairs(listfiles("ScriptBlox/Searcher/ImageCache/ProfilePictures")) do
		delfile(_if(string.find(v, "ScriptBlox"), v, "ScriptBlox/Searcher/ImageCache/ProfilePictures/"..v))
	end
	for _, v in pairs(listfiles("ScriptBlox/Searcher/ImageCache/Scripts")) do
		delfile(_if(string.find(v, "ScriptBlox"), v, "ScriptBlox/Searcher/ImageCache/Scripts/"..v))
	end
end)
setHoverTransition(nil, Color3.new(0.254902, 0.317647, 0.576471), ScriptBloxSearcher.MainFrame.TopBarFrame.ClearCacheButton)

-- Dragging
local UserInputService = game:GetService("UserInputService")
local gui = ScriptBloxSearcher.MainFrame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

refreshScripts(fetchScripts(gquery, 1))

ScriptBloxSearcher.MainFrame.ScriptListFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
	if (ScriptBloxSearcher.MainFrame.ScriptListFrame.CanvasPosition.Y + ScriptBloxSearcher.MainFrame.ScriptListFrame.AbsoluteSize.Y) >= ScriptBloxSearcher.MainFrame.ScriptListFrame.AbsoluteCanvasSize.Y -200 and not pagefetchrunning then
		page = page + 1
		pagefetchrunning = true
		addScripts(fetchScripts(gquery, page))
	end
end)

		  end
	  end)
		  
		  ScriptHubTitle.Name = "ScriptHubTitle"
		  ScriptHubTitle.Parent = ScriptHub
		  ScriptHubTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		  ScriptHubTitle.BackgroundTransparency = 1.000
		  ScriptHubTitle.Position = UDim2.new(0, 13, 0, 0)
		  ScriptHubTitle.Size = UDim2.new(0.287203521, 1, 0.5, 0)
		  ScriptHubTitle.Font = Enum.Font.Gotham
		  ScriptHubTitle.Text = "Script Hub"
		  ScriptHubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		  ScriptHubTitle.TextSize = 14.000
		  ScriptHubTitle.TextXAlignment = Enum.TextXAlignment.Left
		  
		  ScriptHubDesc.Name = "ScriptHubDesc"
		  ScriptHubDesc.Parent = ScriptHub
		  ScriptHubDesc.AnchorPoint = Vector2.new(0, 1)
		  ScriptHubDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		  ScriptHubDesc.BackgroundTransparency = 1.000
		  ScriptHubDesc.Position = UDim2.new(0.0234451853, 5, 1.01473689, 0)
		  ScriptHubDesc.Size = UDim2.new(0.589060307, 1, 0.5, 0)
		  ScriptHubDesc.Font = Enum.Font.Gotham
		  ScriptHubDesc.Text = "Opens a new window connected to Scriptblox."
		  ScriptHubDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
		  ScriptHubDesc.TextSize = 12.000
		  ScriptHubDesc.TextTransparency = 0.400
		  ScriptHubDesc.TextXAlignment = Enum.TextXAlignment.Left
		  
		  ScriptHubCorner.Name = "ScriptHubCorner"
		  ScriptHubCorner.Parent = ScriptHub
 
 
		  local DiscordBut = Instance.new("TextButton")
		  local DiscordButTitle = Instance.new("TextLabel")
		  local DiscordButDesc = Instance.new("TextLabel")
		  local DiscordButCorner = Instance.new("UICorner")
 
		  DiscordBut.Name = "DiscordBut"
		  DiscordBut.Parent = MainSettingsContainer
		  DiscordBut.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		  DiscordBut.Position = UDim2.new(0.0450380854, 0, 0.180327863, 0)
		  DiscordBut.Size = UDim2.new(0.909923851, 0, 0.00819672085, 34)
		  DiscordBut.AutoButtonColor = false
		  DiscordBut.Font = Enum.Font.SourceSans
		  DiscordBut.TextColor3 = Color3.fromRGB(0, 0, 0)
		  DiscordBut.TextSize = 14.000
		  DiscordBut.TextTransparency = 1.000
		  DiscordBut.TextXAlignment = Enum.TextXAlignment.Left
 
		  DiscordBut.MouseButton1Click:Connect(function()
			 Ripple(DiscordBut)
		 end)
 
	   DiscordBut.MouseButton1Click:Connect(function()
		  spawn(function()
			 pcall(function()
				 local req = (syn and syn.request) or (http and http.request) or http_request
				 if req then
					 req({
						 Url = 'http://127.0.0.1:6463/rpc?v=1',
						 Method = 'POST',
						 Headers = {
							 ['Content-Type'] = 'application/json',
							 Origin = 'https://discord.com'
						 },
						 Body = game:GetService('HttpService'):JSONEncode({
							 cmd = 'INVITE_BROWSER',
							 nonce = game:GetService('HttpService'):GenerateGUID(false),
							 args = {code = "9RHAqwHKH2"}
						 })
					 })
				 end
			 end)
		  end)
	   end)
		  
		  DiscordButTitle.Name = "DiscordButTitle"
		  DiscordButTitle.Parent = DiscordBut
		  DiscordButTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		  DiscordButTitle.BackgroundTransparency = 1.000
		  DiscordButTitle.Position = UDim2.new(0, 13, 0, 0)
		  DiscordButTitle.Size = UDim2.new(0.287203521, 1, 0.5, 0)
		  DiscordButTitle.Font = Enum.Font.Gotham
		  DiscordButTitle.Text = "Discord"
		  DiscordButTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		  DiscordButTitle.TextSize = 14.000
		  DiscordButTitle.TextXAlignment = Enum.TextXAlignment.Left
		  
		  DiscordButDesc.Name = "DiscordButDesc"
		  DiscordButDesc.Parent = DiscordBut
		  DiscordButDesc.AnchorPoint = Vector2.new(0, 1)
		  DiscordButDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		  DiscordButDesc.BackgroundTransparency = 1.000
		  DiscordButDesc.Position = UDim2.new(0.0234451853, 5, 1.01473689, 0)
		  DiscordButDesc.Size = UDim2.new(0.589060307, 1, 0.5, 0)
		  DiscordButDesc.Font = Enum.Font.Gotham
		  DiscordButDesc.Text = "Directly joins Project Meow's Discord Server"
		  DiscordButDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
		  DiscordButDesc.TextSize = 12.000
		  DiscordButDesc.TextTransparency = 0.400
		  DiscordButDesc.TextXAlignment = Enum.TextXAlignment.Left
		  
		  DiscordButCorner.Name = "DiscordButCorner"
		  DiscordButCorner.Parent = DiscordBut
 
 
 
	MainSettingsFrame.Name = "MainSettingsFrame"
	MainSettingsFrame.Parent = woof
	MainSettingsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainSettingsFrame.Position = UDim2.new(0.118236467, 0, 0.325320512, 0)
	MainSettingsFrame.Size = UDim2.new(0, 389, 0, 297)
	MainSettingsFrame.BackgroundTransparency = 1.000
	MainSettingsFrame.Visible = false
	
	MainSettingsDragFrame.Name = "MainSettingsDragFrame"
	MainSettingsDragFrame.Parent = MainSettingsFrame
	MainSettingsDragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainSettingsDragFrame.BackgroundTransparency = 1.000
	MainSettingsDragFrame.Size = UDim2.new(0, 389, 0, 45)
 
	MakeDraggable(MainSettingsDragFrame, MainSettingsFrame)
	
	MainSettingsFrameCorner.Name = "MainSettingsFrameCorner"
	MainSettingsFrameCorner.Parent = MainSettingsFrame
 
	MainSettingsFrameClose.Name = "MainSettingsFrameClose"
	MainSettingsFrameClose.Parent = MainSettingsFrame
	MainSettingsFrameClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainSettingsFrameClose.BackgroundTransparency = 1.000
	MainSettingsFrameClose.Position = UDim2.new(0.915167093, 0, 0.0134680131, 0)
	MainSettingsFrameClose.Size = UDim2.new(0, 31, 0, 26)
	MainSettingsFrameClose.Image = "rbxassetid://6031094678"
	MainSettingsFrameClose.Visible = false
 
	MainSettingsFrameClose.MouseButton1Click:Connect(function()
	   MainSettingsContainer.Visible = false
	   MainSettingsTitle.Visible = false
	   MainSettingsFrameClose.Visible = false
	   TweenService:Create(
		  MainSettingsFrame,
		  TweenInfo.new(.3, Enum.EasingStyle.Quad),
		  {BackgroundTransparency = 1}
	   ):Play()
	   repeat wait() until MainSettingsFrame.BackgroundTransparency == 1
	   MainSettingsFrame.Visible = false
	   settingsToggled = nil
	end)
	
	MainSettingsContainer.Name = "MainSettingsContainer"
	MainSettingsContainer.Parent = MainSettingsFrame
	MainSettingsContainer.Active = true
	MainSettingsContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainSettingsContainer.BackgroundTransparency = 1.000
	MainSettingsContainer.BorderSizePixel = 0
	MainSettingsContainer.Position = UDim2.new(0.0205655526, 0, 0.151515156, 0)
	MainSettingsContainer.Size = UDim2.new(0, 375, 0, 244)
	MainSettingsContainer.ScrollBarThickness = 8
	MainSettingsContainer.Visible = false
 
	MainSettingsContainerLayout.Name = "MainSettingsContainerLayout"
	MainSettingsContainerLayout.Parent = MainSettingsContainer
	MainSettingsContainerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	MainSettingsContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
	MainSettingsContainerLayout.Padding = UDim.new(0, 10)
	
	MainSettingsTitle.Name = "MainSettingsTitle"
	MainSettingsTitle.Parent = MainSettingsFrame
	MainSettingsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainSettingsTitle.BackgroundTransparency = 1.000
	MainSettingsTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
	MainSettingsTitle.Size = UDim2.new(0, 389, 0, 50)
	MainSettingsTitle.Font = Enum.Font.Gotham
	MainSettingsTitle.Text = "Settings"
	MainSettingsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	MainSettingsTitle.TextSize = 30.000
	MainSettingsTitle.Visible = false
 
 
 
 local Tabs = {}
 function Tabs:Tab(Title)
	local Tab = Instance.new("TextButton")
	local TabCorner = Instance.new("UICorner")
	local TabTitle = Instance.new("TextLabel")
	local TabGradient = Instance.new("UIGradient")
	local Container = Instance.new("ScrollingFrame")
	local ContainerLayout = Instance.new("UIListLayout")
 
	Tab.Name = Title
	Tab.Parent = TabHolder
	Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tab.Position = UDim2.new(0.0935828909, 0, 0, 0)
	Tab.Size = UDim2.new(0, 173, 0, 37)
	Tab.AutoButtonColor = false
	Tab.Font = Enum.Font.SourceSans
	Tab.Text = ""
	Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
	Tab.TextSize = 15.000
	Tab.BackgroundTransparency = 1
	
	TabCorner.CornerRadius = UDim.new(0, 3)
	TabCorner.Name = "TabCorner"
	TabCorner.Parent = Tab
	
	TabTitle.Name = "TabTitle"
	TabTitle.Parent = Tab
	TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabTitle.BackgroundTransparency = 1.000
	TabTitle.Position = UDim2.new(0.0566037744, 0, 0.100000001, 0)
	TabTitle.Size = UDim2.new(0, 150, 0, 29)
	TabTitle.Font = Enum.Font.Gotham
	TabTitle.Text = Title
	TabTitle.TextColor3 = getgenv().GUI_Color.TextColor
	TabTitle.TextSize = 17.000
	TabTitle.TextXAlignment = Enum.TextXAlignment.Left
	
	TabGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(236, 136, 36)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 204, 51))}
	TabGradient.Name = "TabGradient"
	TabGradient.Parent = Tab
 
	Container.Name = Title
	Container.Parent = ContainerHold
	Container.Active = true
	Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container.BackgroundTransparency = 1.000
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0.304615378, 0, 0.0929095373, 0)
	Container.Size = UDim2.new(0, 445, 0, 361)
	Container.CanvasSize = UDim2.new(0, 0, 5, 0)
	Container.ScrollBarThickness = 7
	Container.CanvasPosition = Vector2.new(0, 600)
	Container.Visible = false
 
	local ContainerPadding = Instance.new("UIPadding")
	ContainerPadding.Name = "ContainerPadding"
	ContainerPadding.Parent = Container
	ContainerPadding.PaddingTop = UDim.new(0, 5)
	ContainerPadding.PaddingBottom = UDim.new(0, 5)
	
	ContainerLayout.Name = "ContainerLayout"
	ContainerLayout.Parent = Container
	ContainerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ContainerLayout.Padding = UDim.new(0, 15)
 
 
	if FirstTab == false then
	   Tab.BackgroundTransparency = 0
	   Container.Visible = true
	   FirstTab = true
	end
	local Textshit
	Tab.MouseButton1Click:Connect(
		  function()
			 for i, v in next, TabHolder:GetChildren() do
				if v.ClassName == "TextButton" then
				   TweenService:Create(
					  v,
					  TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					  {BackgroundTransparency = 1}
				   ):Play()
				   TweenService:Create(
					  Tab,
					  TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					  {BackgroundTransparency = 0}
				   ):Play()
				end
			 end
 
			 for i, v in next, ContainerHold:GetChildren() do
				if v.ClassName == "ScrollingFrame" then
				   fuckit = v
				   v.Visible = false
				end
			 end
 
			 Container.Visible = true
 
 
		  end)
 
 function UpdateResoults()
	 local search = string.lower(MainFrameSearchBox.Text)
	 for i,v in pairs(Container:GetChildren()) do
		 if v.ClassName ~= "UIListLayout" and v.ClassName ~= "Frame" and v.ClassName ~= "UIPadding" then
			 if search ~= "" then
				 local item = string.lower(v.Name)
				 if string.find(item, search) then
					 
				 else
					 v.Visible = false
				 end
			 else
				 v.Visible = true
			 end
		 end
	 end
 
 end
 
 MainFrameSearchBox.Changed:Connect(UpdateResoults)
 
 
	local InternalUIFrameCorner = Instance.new("UICorner")
	local FilesFrame = Instance.new("Frame")
	local FilesCorner = Instance.new("UICorner")
	local FilesHolder = Instance.new("ScrollingFrame")
	local FilesHolderLayout = Instance.new("UIListLayout")
	local SavedFiles = Instance.new("TextButton")
	local FilesHolderPadding = Instance.new("UIPadding")
	local CodingFrame = Instance.new("Frame")
	local CodingFrameCorner = Instance.new("UICorner")
	local CodingFrameHolder = Instance.new("ScrollingFrame")
	local CodingFrameHolderLayout = Instance.new("UIListLayout")
	local CodingBox = Instance.new("TextBox")
	local CodingBoxPadding = Instance.new("UIPadding")
	local ExecuteButton = Instance.new("TextButton")
	local ExecuteButtonCorner = Instance.new("UICorner")
	local SaveFileButton = Instance.new("TextButton")
	local SaveFileButtonCorner = Instance.new("UICorner")
	local ClearButton = Instance.new("TextButton")
	local ClearButtonCorner = Instance.new("UICorner")
	local RefreshButton = Instance.new("TextButton")
	local RefreshButtonCorner = Instance.new("UICorner")
	local CloseButton = Instance.new("TextButton")
	local CloseButtonCorner = Instance.new("UICorner")
 
	local SaveFileCheckFrame = Instance.new("Frame")
	local SaveFileCheckFrameCorner = Instance.new("UICorner")
	local OptionsFrame = Instance.new("Frame")
	local OptionsFrameCorner = Instance.new("UICorner")
	local YESButton = Instance.new("TextButton")
	local YESButtonCorner = Instance.new("UICorner")
	local NOButton = Instance.new("TextButton")
	local NOButtonCorner = Instance.new("UICorner")
	local CreateButton = Instance.new("TextButton")
	local CreateButtonCorner = Instance.new("UICorner")
	local OptionsFrameTitle = Instance.new("TextLabel")
	local OptionsFrameDesc = Instance.new("TextLabel")
	local FileCreateBox = Instance.new("TextBox")
	local FileCreateBoxCorner = Instance.new("UICorner")
 
	local SavedFileOptionsFrame = Instance.new("Frame")
	local SavedFileOptionsFrameCorner = Instance.new("UICorner")
	local SavedFileOptionsFrameLayout = Instance.new("UIListLayout")
	local DeleteButton = Instance.new("TextButton")
	
 
	local MainFolder = "Project Meow"
	local CodeStorage = MainFolder.."/".."CodeStorage"
	local FilesStorage = MainFolder.."/".."FilesStorage"
	local ConfigsStorage = MainFolder.."/".."ConfigsStorage"
 
	local ExecuteFile = CodeStorage.."/".."Exec.lua"
	local SaveProgress = CodeStorage.."/".."Saved.lua"
 
	function addluafolder()
	   if isfolder(MainFolder) then
 
	   else
		  makefolder(MainFolder)
	   end
	end
 
	function addluastorage()
	   if isfolder(CodeStorage) then
 
	   else
		  makefolder(CodeStorage)
	   end
	end
 
	function addFilesStorage()
	   if isfolder(FilesStorage) then
 
	   else
		  makefolder(FilesStorage)
	   end
	end
 
	function addConfigsStorage()
	   if isfolder(ConfigsStorage) then
 
	   else
		  makefolder(ConfigsStorage)
	   end
	end
 
	addluafolder()
	addluastorage()
	addFilesStorage()
	addConfigsStorage()
 
	function AddFileToStorage(name)
	   writefile(FilesStorage.."/"..name..".lua", CodingBox.Text)
	   local stringi = FilesStorage.."/"..name..".lua"
 
		   local NewFileClone = game:GetService("CoreGui").woof.InternalUIFrame.FilesFrame.FilesHolder.SavedFiles:Clone()
		   NewFileClone.Parent = FilesHolder
		   NewFileClone.Text = string.gsub(stringi, "Project Meow/FilesStorage", "\n")
		   NewFileClone.Name = string.gsub(stringi, "Project Meow/FilesStorage", "\n")
		   NewFileClone.Visible = true
		   NewFileClone.TextXAlignment = Enum.TextXAlignment.Left
	end
 
	function RefreshFilesStorage()
	   for i,v in pairs(FilesHolder:GetChildren()) do
		  if v.ClassName == "TextButton" and v.Name ~= "SavedFiles" then
			  v:Destroy()
		  end
	  end
	  local listF = listfiles(FilesStorage)
	  for i,v in pairs(listF) do
	   local NewFileClone = game:GetService("CoreGui").woof.InternalUIFrame.FilesFrame.FilesHolder.SavedFiles:Clone()
	   NewFileClone.Parent = FilesHolder
	   NewFileClone.Text = string.gsub(v, "Project Meow/FilesStorage", "\n")
	   NewFileClone.Name = v
	   NewFileClone.Visible = true
	   NewFileClone.TextXAlignment = Enum.TextXAlignment.Left
	  end
	  for i,v in pairs(FilesHolder:GetChildren()) do
	   if v.ClassName == "TextButton" then
		  v.MouseButton1Click:Connect(function()
			 CodingBox.Text = ""
			 CodingBox.Text = readfile(v.Name)
		   end)
	   end
   end
	end
 
	function addluaexecutefile()
	   writefile(ExecuteFile, CodingBox.Text)
	end
 
	function savefileprogress()
	   writefile(SaveProgress, CodingBox.Text)
	end
 
	
	InternalUIFrame.Name = "InternalUIFrame"
	InternalUIFrame.Parent = woof
	InternalUIFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	InternalUIFrame.Position = UDim2.new(0.153254017, 0, 0.253772289, 0)
	InternalUIFrame.Size = UDim2.new(0, 594, 0, 339)
	InternalUIFrame.Visible = false
 
 
	
	InternalUIFrameCorner.CornerRadius = UDim.new(0, 5)
	InternalUIFrameCorner.Name = "InternalUIFrameCorner"
	InternalUIFrameCorner.Parent = InternalUIFrame
	
	FilesFrame.Name = "FilesFrame"
	FilesFrame.Parent = InternalUIFrame
	FilesFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	FilesFrame.Position = UDim2.new(0.720538735, 0, 0, 0)
	FilesFrame.Size = UDim2.new(0, 166, 0, 297)
	
	FilesCorner.CornerRadius = UDim.new(0, 5)
	FilesCorner.Name = "FilesCorner"
	FilesCorner.Parent = FilesFrame
	
	FilesHolder.Name = "FilesHolder"
	FilesHolder.Parent = FilesFrame
	FilesHolder.Active = true
	FilesHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FilesHolder.BackgroundTransparency = 1.000
	FilesHolder.BorderSizePixel = 0
	FilesHolder.Size = UDim2.new(0, 160, 0, 297)
	FilesHolder.ScrollBarThickness = 6
	
	FilesHolderLayout.Name = "FilesHolderLayout"
	FilesHolderLayout.Parent = FilesHolder
	FilesHolderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	FilesHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
	FilesHolderLayout.Padding = UDim.new(0, 5)
	
	SavedFiles.Name = "SavedFiles"
	SavedFiles.Parent = FilesHolder
	SavedFiles.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SavedFiles.BackgroundTransparency = 1.000
	SavedFiles.Position = UDim2.new(0.0555793755, 0, 0, 0)
	SavedFiles.Size = UDim2.new(0, 149, 0, 22)
	SavedFiles.Font = Enum.Font.Gotham
	SavedFiles.Text = "File"
	SavedFiles.TextColor3 = Color3.fromRGB(255, 255, 255)
	SavedFiles.TextSize = 14.000
	SavedFiles.TextXAlignment = Enum.TextXAlignment.Left
	SavedFiles.Visible = false
	
	FilesHolderPadding.Name = "FilesHolderPadding"
	FilesHolderPadding.Parent = FilesHolder
	FilesHolderPadding.PaddingBottom = UDim.new(0, 5)
	FilesHolderPadding.PaddingTop = UDim.new(0, 5)
	
	CodingFrame.Name = "CodingFrame"
	CodingFrame.Parent = InternalUIFrame
	CodingFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	CodingFrame.Position = UDim2.new(0.0134680131, 0, 0.029498525, 0)
	CodingFrame.Size = UDim2.new(0, 409, 0, 287)
	
	CodingFrameCorner.CornerRadius = UDim.new(0, 3)
	CodingFrameCorner.Name = "CodingFrameCorner"
	CodingFrameCorner.Parent = CodingFrame
	
	CodingFrameHolder.Name = "CodingFrameHolder"
	CodingFrameHolder.Parent = CodingFrame
	CodingFrameHolder.Active = true
	CodingFrameHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CodingFrameHolder.BackgroundTransparency = 1.000
	CodingFrameHolder.BorderSizePixel = 0
	CodingFrameHolder.Position = UDim2.new(0, 0, 0.0140129915, 0)
	CodingFrameHolder.Size = UDim2.new(0, 401, 0, 282)
	CodingFrameHolder.ScrollBarThickness = 7
	
	CodingFrameHolderLayout.Name = "CodingFrameHolderLayout"
	CodingFrameHolderLayout.Parent = CodingFrameHolder
	CodingFrameHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	CodingBox.Name = "CodingBox"
	CodingBox.Parent = CodingFrameHolder
	CodingBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CodingBox.BackgroundTransparency = 1.000
	CodingBox.Size = UDim2.new(0, 409, 0, 276)
	CodingBox.ClearTextOnFocus = false
	CodingBox.Font = Enum.Font.Gotham
	CodingBox.MultiLine = true
	CodingBox.Text = ""
	CodingBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	CodingBox.TextSize = 14.000
	CodingBox.TextXAlignment = Enum.TextXAlignment.Left
	CodingBox.TextYAlignment = Enum.TextYAlignment.Top
 
	function checkifsavefileexists()
	   if isfile(SaveProgress) then
 
	   else
		   writefile(SaveProgress, "")
	   end
   end
 
   checkifsavefileexists()
 
	local Players = game:GetService("Players")
	Players.PlayerRemoving:Connect(function(player)
	   if player.UserId == Players.LocalPlayer.UserId then
		   writefile(SaveProgress, CodingBox.Text)
	   end
   end)
 
   function WhenExecuted()
	if isfile(SaveProgress) then
	   CodingBox.Text = readfile(SaveProgress)
	end
 end
 
 WhenExecuted()
	
	CodingBoxPadding.Name = "CodingBoxPadding"
	CodingBoxPadding.Parent = CodingBox
	CodingBoxPadding.PaddingLeft = UDim.new(0, 5)
	CodingBoxPadding.PaddingTop = UDim.new(0, 5)
	
	ExecuteButton.Name = "ExecuteButton"
	ExecuteButton.Parent = InternalUIFrame
	ExecuteButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	ExecuteButton.Position = UDim2.new(0.0280000009, 0, 0.899999976, 0)
	ExecuteButton.Size = UDim2.new(0, 92, 0, 28)
	ExecuteButton.AutoButtonColor = false
	ExecuteButton.Font = Enum.Font.Gotham
	ExecuteButton.Text = "Execute"
	ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ExecuteButton.TextSize = 14.000
 
	local webhookcheck =
	is_sirhurt_closure and "s" or pebc_execute and "p" and "s" or
	secure_load and "s" or
	KRNL_LOADED and "k" or
	SONA_LOADED and "s" or
	"e"
 
	ExecuteButton.MouseButton1Click:Connect(function()
	   ExecuteButton.TextSize = 0
	   TweenService:Create(
		   ExecuteButton,
		   TweenInfo.new(.3, Enum.EasingStyle.Quad),
		   {TextSize = 14}
	   ):Play()
	   if webhookcheck then
		   pcall(dofile(ExecuteFile))
	   else
		   loadfile(ExecuteFile)()
	   end
	end)
 
	spawn(function()
	   while task.wait() do
		  pcall(function()
			 addluaexecutefile()
			 writefile(SaveProgress, CodingBox.Text)
		  end)
	   end
	end)
	
	ExecuteButtonCorner.CornerRadius = UDim.new(0, 3)
	ExecuteButtonCorner.Name = "ExecuteButtonCorner"
	ExecuteButtonCorner.Parent = ExecuteButton
	
	CloseButton.Name = "CloseButton"
	CloseButton.Parent = InternalUIFrame
	CloseButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	CloseButton.Position = UDim2.new(0.59870708, 0, 0.900000036, 0)
	CloseButton.Size = UDim2.new(0, 84, 0, 28)
	CloseButton.AutoButtonColor = false
	CloseButton.Font = Enum.Font.Gotham
	CloseButton.Text = "Close UI"
	CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.TextSize = 14.000
	
	CloseButtonCorner.CornerRadius = UDim.new(0, 3)
	CloseButtonCorner.Name = "CloseButtonCorner"
	CloseButtonCorner.Parent = CloseButton
 
	CloseButton.MouseButton1Click:Connect(function()
	   CloseButton.TextSize = 0
	   TweenService:Create(CloseButton,TweenInfo.new(.3, Enum.EasingStyle.Quad),{TextSize = 14}):Play()
	   InternalUIFrame.Visible = false
	end)
	
	SaveFileButton.Name = "SaveFileButton"
	SaveFileButton.Parent = InternalUIFrame
	SaveFileButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	SaveFileButton.Position = UDim2.new(0.226653188, 0, 0.899999976, 0)
	SaveFileButton.Size = UDim2.new(0, 92, 0, 28)
	SaveFileButton.AutoButtonColor = false
	SaveFileButton.Font = Enum.Font.Gotham
	SaveFileButton.Text = "Save File"
	SaveFileButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	SaveFileButton.TextSize = 14.000
 
	SaveFileButton.MouseButton1Click:Connect(function()
	   SaveFileButton.TextSize = 0
	   TweenService:Create(SaveFileButton,TweenInfo.new(.3, Enum.EasingStyle.Quad),{TextSize = 14}):Play()
	   SaveFileCheckFrame.Visible = true
	end)
	
	SaveFileButtonCorner.CornerRadius = UDim.new(0, 3)
	SaveFileButtonCorner.Name = "SaveFileButtonCorner"
	SaveFileButtonCorner.Parent = SaveFileButton
	
	ClearButton.Name = "ClearButton"
	ClearButton.Parent = InternalUIFrame
	ClearButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	ClearButton.Position = UDim2.new(0.421939373, 0, 0.899999976, 0)
	ClearButton.Size = UDim2.new(0, 92, 0, 28)
	ClearButton.AutoButtonColor = false
	ClearButton.Font = Enum.Font.Gotham
	ClearButton.Text = "Clear"
	ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ClearButton.TextSize = 14.000
 
	ClearButton.MouseButton1Click:Connect(function()
	   ClearButton.TextSize = 0
	   TweenService:Create(ClearButton,TweenInfo.new(.3, Enum.EasingStyle.Quad),{TextSize = 14}):Play()
	   CodingBox.Text = ""
	end)
	
	ClearButtonCorner.CornerRadius = UDim.new(0, 3)
	ClearButtonCorner.Name = "ClearButtonCorner"
	ClearButtonCorner.Parent = ClearButton
	
	RefreshButton.Name = "RefreshButton"
	RefreshButton.Parent = InternalUIFrame
	RefreshButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	RefreshButton.Position = UDim2.new(0.773791194, 0, 0.899999976, 0)
	RefreshButton.Size = UDim2.new(0, 92, 0, 28)
	RefreshButton.AutoButtonColor = false
	RefreshButton.Font = Enum.Font.Gotham
	RefreshButton.Text = "Refresh"
	RefreshButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	RefreshButton.TextSize = 14.000
 
	RefreshButton.MouseButton1Click:Connect(function()
	   RefreshButton.TextSize = 0
	   TweenService:Create(RefreshButton,TweenInfo.new(.3, Enum.EasingStyle.Quad),{TextSize = 14}):Play()
	   RefreshFilesStorage()
	end)
	
	RefreshButtonCorner.CornerRadius = UDim.new(0, 3)
	RefreshButtonCorner.Name = "RefreshButtonCorner"
	RefreshButtonCorner.Parent = RefreshButton
 
 
 
 
 
	SaveFileCheckFrame.Name = "SaveFileCheckFrame"
	SaveFileCheckFrame.Parent = InternalUIFrame
	SaveFileCheckFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SaveFileCheckFrame.Size = UDim2.new(0, 594, 0, 339)
	SaveFileCheckFrame.Visible = false
	
	SaveFileCheckFrameCorner.CornerRadius = UDim.new(0, 5)
	SaveFileCheckFrameCorner.Name = "SaveFileCheckFrameCorner"
	SaveFileCheckFrameCorner.Parent = SaveFileCheckFrame
	
	OptionsFrame.Name = "OptionsFrame"
	OptionsFrame.Parent = SaveFileCheckFrame
	OptionsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	OptionsFrame.Position = UDim2.new(0.151515156, 0, 0.147492617, 0)
	OptionsFrame.Size = UDim2.new(0, 399, 0, 239)
	
	OptionsFrameCorner.CornerRadius = UDim.new(0, 3)
	OptionsFrameCorner.Name = "OptionsFrameCorner"
	OptionsFrameCorner.Parent = OptionsFrame
	
	YESButton.Name = "YESButton"
	YESButton.Parent = OptionsFrame
	YESButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	YESButton.Position = UDim2.new(0.110275686, 0, 0.836820066, 0)
	YESButton.Size = UDim2.new(0, 91, 0, 30)
	YESButton.Font = Enum.Font.Gotham
	YESButton.Text = "Yes"
	YESButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	YESButton.TextSize = 14.000
 
	YESButton.MouseButton1Click:Connect(function()
	   YESButton.TextSize = 0
	   TweenService:Create(YESButton,TweenInfo.new(.3, Enum.EasingStyle.Quad),{TextSize = 14}):Play()
	   CreateButton.Visible = true
	   FileCreateBox.Visible = true
	end)
	
	YESButtonCorner.CornerRadius = UDim.new(0, 4)
	YESButtonCorner.Name = "YESButtonCorner"
	YESButtonCorner.Parent = YESButton
	
	NOButton.Name = "NOButton"
	NOButton.Parent = OptionsFrame
	NOButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	NOButton.Position = UDim2.new(0.656641662, 0, 0.836820066, 0)
	NOButton.Size = UDim2.new(0, 91, 0, 30)
	NOButton.Font = Enum.Font.Gotham
	NOButton.Text = "No"
	NOButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	NOButton.TextSize = 14.000
 
	NOButton.MouseButton1Click:Connect(function()
	   NOButton.TextSize = 0
	   TweenService:Create(NOButton,TweenInfo.new(.3, Enum.EasingStyle.Quad),{TextSize = 14}):Play()
	   CreateButton.Visible = false
	   FileCreateBox.Visible = false
	   SaveFileCheckFrame.Visible = false
	end)
	
	NOButtonCorner.CornerRadius = UDim.new(0, 4)
	NOButtonCorner.Name = "NOButtonCorner"
	NOButtonCorner.Parent = NOButton
	
	CreateButton.Name = "CreateButton"
	CreateButton.Parent = OptionsFrame
	CreateButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	CreateButton.Position = UDim2.new(0.383458674, 0, 0.836820066, 0)
	CreateButton.Size = UDim2.new(0, 91, 0, 30)
	CreateButton.Font = Enum.Font.Gotham
	CreateButton.Text = "Create"
	CreateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CreateButton.TextSize = 14.000
	CreateButton.Visible = false
 
	CreateButton.MouseButton1Click:Connect(function()
	   CreateButton.TextSize = 0
	   TweenService:Create(CreateButton,TweenInfo.new(.3, Enum.EasingStyle.Quad),{TextSize = 14}):Play()
	   AddFileToStorage(FileCreateBox.Text)
	   CreateButton.Visible = false
	   FileCreateBox.Visible = false
	   SaveFileCheckFrame.Visible = false
	end)
	
	CreateButtonCorner.CornerRadius = UDim.new(0, 4)
	CreateButtonCorner.Name = "CreateButtonCorner"
	CreateButtonCorner.Parent = CreateButton
	
	OptionsFrameTitle.Name = "OptionsFrameTitle"
	OptionsFrameTitle.Parent = OptionsFrame
	OptionsFrameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	OptionsFrameTitle.BackgroundTransparency = 1.000
	OptionsFrameTitle.Position = UDim2.new(0.245614037, 0, 0.0460251048, 0)
	OptionsFrameTitle.Size = UDim2.new(0, 200, 0, 18)
	OptionsFrameTitle.Font = Enum.Font.Gotham
	OptionsFrameTitle.Text = "Create File"
	OptionsFrameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	OptionsFrameTitle.TextSize = 19.000
	
	OptionsFrameDesc.Name = "OptionsFrameDesc"
	OptionsFrameDesc.Parent = OptionsFrame
	OptionsFrameDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	OptionsFrameDesc.BackgroundTransparency = 1.000
	OptionsFrameDesc.Position = UDim2.new(0.248120308, 0, 0.179916322, 0)
	OptionsFrameDesc.Size = UDim2.new(0, 200, 0, 18)
	OptionsFrameDesc.Font = Enum.Font.Gotham
	OptionsFrameDesc.Text = "Do you wish to create this file?"
	OptionsFrameDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
	OptionsFrameDesc.TextSize = 14.000
	
	FileCreateBox.Name = "FileCreateBox"
	FileCreateBox.Parent = OptionsFrame
	FileCreateBox.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	FileCreateBox.Position = UDim2.new(0.305764407, 0, 0.502092063, 0)
	FileCreateBox.Size = UDim2.new(0, 151, 0, 36)
	FileCreateBox.Font = Enum.Font.Gotham
	FileCreateBox.PlaceholderText = "Type File Name"
	FileCreateBox.Text = ""
	FileCreateBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	FileCreateBox.TextSize = 14.000
	FileCreateBox.Visible = false
	
	FileCreateBoxCorner.CornerRadius = UDim.new(0, 4)
	FileCreateBoxCorner.Name = "FileCreateBoxCorner"
	FileCreateBoxCorner.Parent = FileCreateBox
 
 
 
	SavedFileOptionsFrame.Name = "SavedFileOptionsFrame"
	SavedFileOptionsFrame.Parent = SavedFiles
	SavedFileOptionsFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	SavedFileOptionsFrame.Position = UDim2.new(0, 0, 1.36363637, 0)
	SavedFileOptionsFrame.Size = UDim2.new(0, 141, 0, 21)
	SavedFileOptionsFrame.ZIndex = 9
	SavedFileOptionsFrame.Visible = false
	
	SavedFileOptionsFrameCorner.CornerRadius = UDim.new(0, 3)
	SavedFileOptionsFrameCorner.Name = "SavedFileOptionsFrameCorner"
	SavedFileOptionsFrameCorner.Parent = SavedFileOptionsFrame
	
	SavedFileOptionsFrameLayout.Name = "SavedFileOptionsFrameLayout"
	SavedFileOptionsFrameLayout.Parent = SavedFileOptionsFrame
	SavedFileOptionsFrameLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	SavedFileOptionsFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	DeleteButton.Parent = SavedFileOptionsFrame
	DeleteButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DeleteButton.BackgroundTransparency = 1.000
	DeleteButton.Size = UDim2.new(0, 135, 0, 20)
	DeleteButton.Font = Enum.Font.Gotham
	DeleteButton.Text = "Delete"
	DeleteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	DeleteButton.TextSize = 14.000
	DeleteButton.ZIndex = 10
 
 
 local ContainerItems = {}
 
 
 function ContainerItems:Textbox(text, disapper, callback)
	local Textbox = Instance.new("TextButton")
	local TextboxTitle = Instance.new("TextLabel")
	local TextboxFrame = Instance.new("Frame")
	local TextboxFrameCorner = Instance.new("UICorner")
	local TextBox = Instance.new("TextBox")
	local TextboxCorner = Instance.new("UICorner")
	local Textboxinfo = Instance.new("TextLabel")
	local textboxinfoimage = Instance.new("ImageLabel")
 
	Textbox.Name = text
	Textbox.Parent = Container
	Textbox.BackgroundColor3 = getgenv().GUI_Color.DarkContrast
	Textbox.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
	Textbox.Size = UDim2.new(0, 405, 0, 40)
	Textbox.AutoButtonColor = false
	Textbox.Font = Enum.Font.Gotham
	Textbox.Text = ""
	Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
	Textbox.TextSize = 14.000
 
	-- local TextboxStroke = Instance.new("UIStroke")
	-- TextboxStroke.Parent = Textbox
	-- TextboxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	-- TextboxStroke.Color = Color3.fromRGB(65, 65, 65)
	-- TextboxStroke.Transparency = 0.6
	
	TextboxTitle.Name = "TextboxTitle"
	TextboxTitle.Parent = Textbox
	TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextboxTitle.BackgroundTransparency = 1.000
	TextboxTitle.Position = UDim2.new(0.0198511165, 0, 0, 0)
	TextboxTitle.Size = UDim2.new(0, 405, 0, 40)
	TextboxTitle.Font = Enum.Font.Gotham
	TextboxTitle.Text = text
	TextboxTitle.TextColor3 = getgenv().GUI_Color.TextColor
	TextboxTitle.TextSize = 15.000
	TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
	
	TextboxFrame.Name = "TextboxFrame"
	TextboxFrame.Parent = Textbox
	TextboxFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TextboxFrame.Position = UDim2.new(0.650124013, 0, 0.134999841, 0)
	TextboxFrame.Size = UDim2.new(0, 134, 0, 27)
	
	TextboxFrameCorner.CornerRadius = UDim.new(0, 6)
	TextboxFrameCorner.Name = "TextboxFrameCorner"
	TextboxFrameCorner.Parent = TextboxFrame
	
	TextBox.Parent = TextboxFrame
	TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BackgroundTransparency = 1.000
	TextBox.Size = UDim2.new(0, 134, 0, 27)
	TextBox.Font = Enum.Font.Gotham
	TextBox.Text = "Here!" or disapper
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.TextSize = 15.000
	
	TextboxCorner.CornerRadius = UDim.new(0, 6)
	TextboxCorner.Name = "TextboxCorner"
	TextboxCorner.Parent = Textbox
	
	Textboxinfo.Name = "Textboxinfo"
	Textboxinfo.Parent = Textbox
	Textboxinfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Textboxinfo.BackgroundTransparency = 1.000
	Textboxinfo.Position = UDim2.new(0.476641178, 0, 0, 0)
	Textboxinfo.Size = UDim2.new(0, 53, 0, 40)
	Textboxinfo.Visible = false
	Textboxinfo.Font = Enum.Font.Gotham
	Textboxinfo.Text = "->"
	Textboxinfo.TextColor3 = Color3.fromRGB(255, 255, 255)
	Textboxinfo.TextSize = 15.000
	
	textboxinfoimage.Name = "textboxinfoimage"
	textboxinfoimage.Parent = Textbox
	textboxinfoimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textboxinfoimage.BackgroundTransparency = 1.000
	textboxinfoimage.Position = UDim2.new(0.523456812, 0, 0.241463467, 0)
	textboxinfoimage.Size = UDim2.new(0, 25, 0, 21)
	textboxinfoimage.Image = "rbxassetid://6031225818"
 
	-- ToolTip(Textbox, TextboxTitle, tooltiptext or "This is a Textbox!", text)
 
 
	TextBox.FocusLost:Connect(
	   function(ep)
		  if ep then
			 --if #TextBox.Text > 0 then
				pcall(callback, TextBox.Text)
			 --end
		  end
	   end
	)
 
	Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
 end
 
 
 
 function ContainerItems:Slider(text, min, max, start, callback)
	local dragging = false
 
	local Slider = Instance.new("TextButton")
	local SliderTitle = Instance.new("TextLabel")
	local SliderFrame = Instance.new("Frame")
	local SliderFrameCorner = Instance.new("UICorner")
	local SliderIndicator = Instance.new("Frame")
	local SliderIndicatorCorner = Instance.new("UICorner")
	local SliderIndicatorGradient = Instance.new("UIGradient")
	local SliderCorner = Instance.new("UICorner")
	local Value = Instance.new("TextLabel")
	local Value1 = Instance.new("TextBox")
 
 
	Slider.Name = text
	Slider.Parent = Container
	Slider.BackgroundColor3 = getgenv().GUI_Color.DarkContrast
	Slider.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
	Slider.Size = UDim2.new(0, 405, 0, 49)
	Slider.AutoButtonColor = false
	Slider.Font = Enum.Font.Gotham
	Slider.Text = ""
	Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
	Slider.TextSize = 14.000
 
	-- local SliderStroke = Instance.new("UIStroke")
	-- SliderStroke.Parent = Slider
	-- SliderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	-- SliderStroke.Color = Color3.fromRGB(65, 65, 65)
	-- SliderStroke.Transparency = 0.6
	
	SliderTitle.Name = "SliderTitle"
	SliderTitle.Parent = Slider
	SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderTitle.BackgroundTransparency = 1.000
	SliderTitle.Position = UDim2.new(0.0198511165, 0, 0, 0)
	SliderTitle.Size = UDim2.new(0, 192, 0, 28)
	SliderTitle.Font = Enum.Font.Gotham
	SliderTitle.Text = text
	SliderTitle.TextColor3 = getgenv().GUI_Color.TextColor
	SliderTitle.TextSize = 14.000
	SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
	
	SliderFrame.Name = "SliderFrame"
	SliderFrame.Parent = Slider
	SliderFrame.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	SliderFrame.Position = UDim2.new(0.0223324299, 0, 0.563266039, 0)
	SliderFrame.Size = UDim2.new(0, 384, 0, 11)
	
	SliderFrameCorner.Name = "SliderFrameCorner"
	SliderFrameCorner.Parent = SliderFrame
	
	SliderIndicator.Name = "SliderIndicator"
	SliderIndicator.Parent = SliderFrame
	SliderIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderIndicator.BorderSizePixel = 0
	SliderIndicator.Position = UDim2.new(-0.00260400772, 0, 0.0363603085, 0)
	SliderIndicator.Size = UDim2.new((start or 0) / max, 0, 0, 11)
	
	SliderIndicatorCorner.Name = "SliderIndicatorCorner"
	SliderIndicatorCorner.Parent = SliderIndicator
	
	SliderIndicatorGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(236, 136, 36)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 204, 51))}
	SliderIndicatorGradient.Name = "SliderIndicatorGradient"
	SliderIndicatorGradient.Parent = SliderIndicator
	
	SliderCorner.CornerRadius = UDim.new(0, 6)
	SliderCorner.Name = "SliderCorner"
	SliderCorner.Parent = Slider
	
	Value.Name = "Value"
	Value.Parent = Slider
	Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Value.BackgroundTransparency = 1.000
	Value.Position = UDim2.new(0.496277869, 0, 0, 0)
	Value.Size = UDim2.new(0, 192, 0, 28)
	Value.Font = Enum.Font.Gotham
	Value.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
	Value.TextColor3 = getgenv().GUI_Color.TextColor
	Value.TextSize = 14.000
	Value.TextXAlignment = Enum.TextXAlignment.Right
	Value.Visible = false
 
	Value1.Name = "Value1"
	Value1.Parent = Slider
	Value1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Value1.BackgroundTransparency = 1.000
	Value1.Position = UDim2.new(0.795061588, 0, 0, 0)
	Value1.Size = UDim2.new(0, 70, 0, 27)
	Value1.Font = Enum.Font.Gotham
	Value1.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
	Value1.TextColor3 = getgenv().GUI_Color.TextColor
	Value1.TextSize = 14.000
	Value1.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	Value1.TextXAlignment = Enum.TextXAlignment.Right
 
	-- ToolTip(Slider, SliderTitle, tooltiptext or "This is a Slider!", text)
 
	local function slide(input)
	   local pos =
		  UDim2.new(
			 math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
			 0,
			 0,
			 11
		  )
	   SliderIndicator:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
	   local val = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
	   Value1.Text = tostring(val)
	   pcall(callback, val)
	end
 
	SliderFrame.InputBegan:Connect(
	   function(input)
		  if input.UserInputType == Enum.UserInputType.MouseButton1 then
			 slide(input)
			 dragging = true
		  end
	   end
	)
 
	SliderFrame.InputEnded:Connect(
	   function(input)
		  if input.UserInputType == Enum.UserInputType.MouseButton1 then
			 dragging = false
		  end
	   end
	)
 
	UserInputService.InputChanged:Connect(
	   function(input)
		  if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			 slide(input)
		  end
	   end
	)
 
	Value1.FocusLost:Connect(
	   function(ep)
		  if ep then
			 pcall(callback, tostring(Value1.Text))
		  end
	   end)
 
	Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
 
	pcall(callback, tostring(Value1.Text))
 end
 
 
 function ContainerItems:line()
	local line = Instance.new("TextButton")
	local lineCorner = Instance.new("UICorner")
 
	line.Name = "line"
	line.Parent = Container
	line.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	line.Size = UDim2.new(0, 405, 0, 5)
	line.AutoButtonColor = false
	line.Font = Enum.Font.Gotham
	line.Text = ""
	line.TextColor3 = getgenv().GUI_Color.TextColor
	line.TextSize = 17.000
 
	lineCorner.CornerRadius = UDim.new(0, 5)
	lineCorner.Name = "lineCorner"
	lineCorner.Parent = line
 
	Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
 end
 
 
 
 function ContainerItems:Bind(text, keybind_options, callback)
	local keybind_data = {}
 
	local KeyBind = Instance.new("TextButton")
	local Titl = Instance.new("TextLabel")
	local KeybindFrame = Instance.new("Frame")
	local KeybindFrameCorner = Instance.new("UICorner")
	local TextButton = Instance.new("TextButton")
	local KeybindCorner = Instance.new("UICorner")
 
	KeyBind.Name = text
	KeyBind.Parent = Container
	KeyBind.BackgroundColor3 = getgenv().GUI_Color.DarkContrast
	KeyBind.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
	KeyBind.Size = UDim2.new(0, 405, 0, 40)
	KeyBind.AutoButtonColor = false
	KeyBind.Font = Enum.Font.Gotham
	KeyBind.Text = ""
	KeyBind.TextColor3 = Color3.fromRGB(255, 255, 255)
	KeyBind.TextSize = 14.000
 
	-- local KeyBindStroke = Instance.new("UIStroke")
	-- KeyBindStroke.Parent = KeyBind
	-- KeyBindStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	-- KeyBindStroke.Color = Color3.fromRGB(65, 65, 65)
	-- KeyBindStroke.Transparency = 0.6
	
	Titl.Name = "Titl"
	Titl.Parent = KeyBind
	Titl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Titl.BackgroundTransparency = 1.000
	Titl.Position = UDim2.new(0.0198511165, 0, 0, 0)
	Titl.Size = UDim2.new(0, 405, 0, 40)
	Titl.Font = Enum.Font.Gotham
	Titl.Text = text
	Titl.TextColor3 = getgenv().GUI_Color.TextColor
	Titl.TextSize = 15.000
	Titl.TextXAlignment = Enum.TextXAlignment.Left
	
	KeybindFrame.Name = "KeybindFrame"
	KeybindFrame.Parent = KeyBind
	KeybindFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	KeybindFrame.Position = UDim2.new(0.650124013, 0, 0.159999996, 0)
	KeybindFrame.Size = UDim2.new(0, 134, 0, 24)
	
	KeybindFrameCorner.CornerRadius = UDim.new(0, 6)
	KeybindFrameCorner.Name = "KeybindFrameCorner"
	KeybindFrameCorner.Parent = KeybindFrame
	
	TextButton.Parent = KeybindFrame
	TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.BackgroundTransparency = 1.000
	TextButton.Size = UDim2.new(0, 134, 0, 23)
	TextButton.Font = Enum.Font.Gotham
	TextButton.Text = "RightShift"
	TextButton.TextColor3 = Color3.fromRGB(178, 178, 178)
	TextButton.TextSize = 15.000
	
	KeybindCorner.CornerRadius = UDim.new(0, 6)
	KeybindCorner.Name = "KeybindCorner"
	KeybindCorner.Parent = KeyBind
 
	Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
 
	local UIS = game:GetService('UserInputService')
   
   
	keybind_name = tostring(keybind_name or "New Keybind")
	callback = typeof(callback) == "function" and callback or function()end
	keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
	keybind_options = {
	   ["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
	}
 
 
 
	callback = typeof(callback) == "function" and callback or function()end
	keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
	keybind_options = {
	   ["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
	}
 
	local shortkeys = {
	   RightControl = 'RightControl',
	   LeftControl = 'LeftControl',
	   LeftShift = 'LeftShift',
	   RightShift = 'RightShift',
	   MouseButton1 = "MouseButton1",
	   MouseButton2 = "MouseButton2"
	}
	local checks = {
	   binding = false,
 
	}
 
	function keybind_data:SetKeybind(Keybind)
	   local key = shortkeys[Keybind.Name] or Keybind.Name
	   TextButton.Text = key
	   keybind = Keybind
	end
 
	UIS.InputBegan:Connect(function(a, b)
	   if checks.binding then
		  spawn(function()
			 wait()
			 checks.binding = false
		  end)
		  return
	   end
	   if a.KeyCode == keybind and not b then
		  pcall(callback, keybind)
	   end
	end)
 
	keybind_data:SetKeybind(keybind_options.standard)
 
	TextButton.MouseButton1Click:Connect(function()
	   if checks.binding then return end
	   TextButton.Text = "..."
	   checks.binding = true
	   local a, b = UIS.InputBegan:Wait()
	   keybind_data:SetKeybind(a.KeyCode)
	end)
	return keybind_data
 end
 
 
 function ContainerItems:Label(text)
	local Labelfunc = {}
 
	local Label = Instance.new("TextButton")
	local LabelCorner = Instance.new("UICorner")
 
	Label.Name = text
	Label.Parent = Container
	Label.BackgroundColor3 = getgenv().GUI_Color.DarkContrast
	Label.Size = UDim2.new(0, 405, 0, 40)
	Label.AutoButtonColor = false
	Label.Font = Enum.Font.Gotham
	Label.Text = text
	Label.TextColor3 = getgenv().GUI_Color.TextColor
	Label.TextSize = 17.000
 
	-- local LabelStroke = Instance.new("UIStroke")
	-- LabelStroke.Parent = Label
	-- LabelStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	-- LabelStroke.Color = Color3.fromRGB(65, 65, 65)
	-- LabelStroke.Transparency = 0.6
	
	LabelCorner.CornerRadius = UDim.new(0, 5)
	LabelCorner.Name = "LabelCorner"
	LabelCorner.Parent = Label
 
	function Labelfunc:Refresh(hewo)
	   Label.Text = hewo
	end
	Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
	return Labelfunc
 end
 
 
 function ContainerItems:Dropdown(text, list, callback)
	local dropfunc = {}
	local DropToggled = false
	local FrameSize = 0
	local ItemCount = 0
 
	local DropdownFrame = Instance.new("Frame")
	local DropdownFrameCorner = Instance.new("UICorner")
	local DropdownHolder = Instance.new("ScrollingFrame")
	local DropdownItemLayout = Instance.new("UIListLayout")
	local DropdownItemHolder = Instance.new("UIPadding")
	local Item = Instance.new("TextButton")
	local ItemCorner = Instance.new("UICorner")
	local Dropdown = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	local DropdownCorner = Instance.new("UICorner")
	local Arrow = Instance.new("ImageLabel")
	local DropdownSearch = Instance.new("TextBox")
	local DropdownSearchCorner = Instance.new("UICorner")
 
	Dropdown.Name = text
	Dropdown.Parent = Container
	Dropdown.BackgroundColor3 = getgenv().GUI_Color.DarkContrast
	Dropdown.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
	Dropdown.Size = UDim2.new(0, 405, 0, 40)
	Dropdown.AutoButtonColor = false
	Dropdown.Font = Enum.Font.Gotham
	Dropdown.Text = ""
	Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
	Dropdown.TextSize = 15.000
	
	-- local DropdownStroke = Instance.new("UIStroke")
	-- DropdownStroke.Parent = Dropdown
	-- DropdownStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	-- DropdownStroke.Color = Color3.fromRGB(65, 65, 65)
	-- DropdownStroke.Transparency = 0.6
 
	Title.Name = "Title"
	Title.Parent = Dropdown
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0198511165, 0, 0, 0)
	Title.Size = UDim2.new(0, 192, 0, 40)
	Title.Font = Enum.Font.Gotham
	Title.Text = text
	Title.TextColor3 = getgenv().GUI_Color.TextColor
	Title.TextSize = 15.000
	Title.TextXAlignment = Enum.TextXAlignment.Left
	
	DropdownCorner.CornerRadius = UDim.new(0, 6)
	DropdownCorner.Name = "DropdownCorner"
	DropdownCorner.Parent = Dropdown
	
	Arrow.Name = "Arrow"
	Arrow.Parent = Dropdown
	Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Arrow.BackgroundTransparency = 1.000
	Arrow.Position = UDim2.new(0.899999976, 0, 0.200000003, 0)
	Arrow.Size = UDim2.new(0, 27, 0, 27)
	Arrow.Image = "http://www.roblox.com/asset/?id=6034818372"
 
	DropdownFrame.Name = "DropdownFrame"
	DropdownFrame.Parent = Container
	DropdownFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	DropdownFrame.BorderSizePixel = 0
	DropdownFrame.Position = UDim2.new(0.334374994, 0, 0.604166687, 0)
	DropdownFrame.Size = UDim2.new(0, 403, 0, 0)
	-- 0, 403, 0, 100 ^^
	DropdownFrame.Visible = false
	
	DropdownFrameCorner.Name = "DropdownFrameCorner"
	DropdownFrameCorner.Parent = DropdownFrame
	
	DropdownHolder.Name = "DropdownHolder"
	DropdownHolder.Parent = DropdownFrame
	DropdownHolder.Active = true
	DropdownHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DropdownHolder.BackgroundTransparency = 1.000
	DropdownHolder.BorderSizePixel = 0
	DropdownHolder.Position = UDim2.new(0.0263156947, 0, 0.00326599111, 0)
	DropdownHolder.Size = UDim2.new(0, 386, 0, 0)
	-- 0, 386, 0, 100 ^^
	DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, 126)
	DropdownHolder.ScrollBarThickness = 3
	
	DropdownItemLayout.Name = "DropdownItemLayout"
	DropdownItemLayout.Parent = DropdownHolder
	DropdownItemLayout.SortOrder = Enum.SortOrder.LayoutOrder
	DropdownItemLayout.Padding = UDim.new(0, 5)
	
	DropdownItemHolder.Name = "DropdownItemHolder"
	DropdownItemHolder.Parent = DropdownHolder
	DropdownItemHolder.PaddingBottom = UDim.new(0, 5)
	DropdownItemHolder.PaddingTop = UDim.new(0, 5)
 
	DropdownSearch.Name = "DropdownSearch"
	DropdownSearch.Parent = Dropdown
	DropdownSearch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	DropdownSearch.Position = UDim2.new(0.454320967, 0, 0.200000003, 0)
	DropdownSearch.Size = UDim2.new(0, 172, 0, 27)
	DropdownSearch.Font = Enum.Font.Ubuntu
	DropdownSearch.PlaceholderColor3 = Color3.fromRGB(115, 115, 115)
	DropdownSearch.PlaceholderText = "Search"
	DropdownSearch.Text = ""
	DropdownSearch.TextColor3 = Color3.fromRGB(255, 255, 255)
	DropdownSearch.TextSize = 14.000
	
	DropdownSearchCorner.Name = "DropdownSearchCorner"
	DropdownSearchCorner.Parent = DropdownSearch
	
	--[[
	Item.Name = "Item"
	Item.Parent = DropdownHolder
	Item.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	Item.Position = UDim2.new(0, 0, 0.0808080807, 0)
	Item.Size = UDim2.new(0, 405, 0, 24)
	Item.AutoButtonColor = false
	Item.Font = Enum.Font.Gotham
	Item.Text = "Item"
	Item.TextColor3 = Color3.fromRGB(255, 255, 255)
	Item.TextSize = 14.000
	
	ItemCorner.Name = "ItemCorner"
	ItemCorner.Parent = Item
 ]]
 
 -- local Searchbar = DropdownSearch
 
 -- local Items = DropdownHolder
 
 -- function UpdateResoults()
 --       local search = string.lower(Searchbar.Text)
 --       for i,v in pairs(Items:GetChildren()) do
 --          if v.ClassName == "TextButton" then
 --             if search ~= "" then
 --                local item = string.lower(v.Text)
 --                if string.find(item, search) then
				   
 --                else
 --                   v.Visible = false
 --                end
 --             else
 --                v.Visible = true
 --             end
 --          end
 --       end
 --    end
 
 -- DropdownSearch.Changed:Connect(UpdateResoults)
 
 local SearchBox = DropdownSearch
 
 local v2 = {}
 
 function v2.gettext()
	 return SearchBox.Text
 end
 
 function v2.GetItems()
	 return DropdownHolder
 end
 
 SearchBox.Changed:Connect(function()
	local search = string.lower(SearchBox.Text)
	 for i,v in pairs(v2.GetItems():GetChildren()) do
		 if v.ClassName == "TextButton" then
		  local item = string.lower(v.Text)
			 if string.find(item, search) then
				 v.Visible = true
				 -- task.wait()
				 -- TweenService:Create(
				 -- 	v,
				 -- 	TweenInfo.new(.5, Enum.EasingStyle.Quad),
				 -- 	{BackgroundTransparency = 0.95}
				 -- ):Play()
			 else
				 -- TweenService:Create(
				 -- 	v,
				 -- 	TweenInfo.new(.5, Enum.EasingStyle.Quad),
				 -- 	{BackgroundTransparency = 1}
				 -- ):Play()
				 -- repeat task.wait() until v.BackgroundTransparency == 1
				 -- task.wait()
				 v.Visible = false
			 end
		 end
	 end
 end)
 
	Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
   
	Dropdown.MouseEnter:Connect(
	   function()
		  TweenService:Create(
			 Dropdown,
			 TweenInfo.new(.2, Enum.EasingStyle.Quad),
			 {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
		  ):Play()
	   end
	)
	Dropdown.MouseLeave:Connect(
	   function()
		  TweenService:Create(
			 Dropdown,
			 TweenInfo.new(.2, Enum.EasingStyle.Quad),
			 {BackgroundColor3 = getgenv().GUI_Color.DarkContrast}
		  ):Play()
	   end
	)
 
	Dropdown.MouseButton1Click:Connect(
	   function()
		  if DropToggled == false then
			 DropdownFrame.Visible = true
			 DropdownFrame:TweenSize(
				UDim2.new(0, 403, 0, FrameSize),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 DropdownHolder:TweenSize(
				UDim2.new(0, 386, 0, FrameSize),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 TweenService:Create(
				Arrow,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 180}
			 ):Play()
			 repeat
				wait()
			 until DropdownFrame.Size == UDim2.new(0, 403, 0, FrameSize)
			 Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
		  else
			 DropdownFrame:TweenSize(
				UDim2.new(0, 403, 0, 0),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 DropdownHolder:TweenSize(
				UDim2.new(0, 386, 0, 0),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 TweenService:Create(
				Arrow,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 0}
			 ):Play()
			 repeat
				wait()
			 until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
			 DropdownFrame.Visible = false
			 Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
		  end
		  DropToggled = not DropToggled
	   end
	)
 
	for i, v in next, list do
	   ItemCount = ItemCount + 1
 
		  FrameSize = 200
 
	   local Item = Instance.new("TextButton")
	   local ItemCorner = Instance.new("UICorner")
 
	   Item.Name = "Item"
	   Item.Parent = DropdownHolder
	   Item.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	   Item.Position = UDim2.new(0, 0, 0.0808080807, 0)
	   Item.Size = UDim2.new(0, 405, 0, 24)
	   Item.AutoButtonColor = false
	   Item.Font = Enum.Font.Gotham
	   Item.TextColor3 = Color3.fromRGB(255, 255, 255)
	   Item.TextSize = 14.000
	   Item.Text = v
 
	   ItemCorner.Name = "ItemCorner"
	   ItemCorner.Parent = Item
 
	   Item.MouseEnter:Connect(
		  function()
			 TweenService:Create(
				Item,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
			 ):Play()
		  end
	   )
	   Item.MouseLeave:Connect(
		  function()
			 TweenService:Create(
				Item,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
			 ):Play()
		  end
	   )
 
	   Item.MouseButton1Click:Connect(
		  function()
			 Title.Text = text .. " - " .. v
			 pcall(callback, v)
			 DropToggled = false
			 DropdownFrame:TweenSize(
				UDim2.new(0, 403, 0, 0),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 DropdownHolder:TweenSize(
				UDim2.new(0, 386, 0, 0),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 TweenService:Create(
				Arrow,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 0}
			 ):Play()
			 repeat
				wait()
			 until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
			 DropdownFrame.Visible = false
			 Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
		  end
	   )
 
	   DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, DropdownItemLayout.AbsoluteContentSize.Y + 15)
	end
 
	function dropfunc:Refresh(newlist)
	   for i,v in next, DropdownHolder:GetChildren() do
		  if v.ClassName == "TextButton" then
			 v:Destroy()
		  end
	   end
 
	   for i,v in next, newlist do
		  local Item = Instance.new("TextButton")
		  local ItemCorner = Instance.new("UICorner")
	
		  Item.Name = "Item"
		  Item.Parent = DropdownHolder
		  Item.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		  Item.Position = UDim2.new(0, 0, 0.0808080807, 0)
		  Item.Size = UDim2.new(0, 405, 0, 24)
		  Item.AutoButtonColor = false
		  Item.Font = Enum.Font.Gotham
		  Item.TextColor3 = Color3.fromRGB(255, 255, 255)
		  Item.TextSize = 14.000
		  Item.Text = v
	
		  ItemCorner.Name = "ItemCorner"
		  ItemCorner.Parent = Item
	
		  Item.MouseEnter:Connect(
			 function()
				TweenService:Create(
				   Item,
				   TweenInfo.new(.2, Enum.EasingStyle.Quad),
				   {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
				):Play()
			 end
		  )
		  Item.MouseLeave:Connect(
			 function()
				TweenService:Create(
				   Item,
				   TweenInfo.new(.2, Enum.EasingStyle.Quad),
				   {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
				):Play()
			 end
		  )
	
		  Item.MouseButton1Click:Connect(
			 function()
				Title.Text = text .. " - " .. v
				pcall(callback, v)
				DropToggled = false
				DropdownFrame:TweenSize(
				   UDim2.new(0, 403, 0, 0),
				   Enum.EasingDirection.Out,
				   Enum.EasingStyle.Quart,
				   0.1,
				   true
				)
				DropdownHolder:TweenSize(
				   UDim2.new(0, 386, 0, 0),
				   Enum.EasingDirection.Out,
				   Enum.EasingStyle.Quart,
				   0.1,
				   true
				)
				TweenService:Create(
				   Arrow,
				   TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				   {Rotation = 0}
				):Play()
				repeat
				   wait()
				until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
				DropdownFrame.Visible = false
				Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
			 end
		  )
		  DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, DropdownItemLayout.AbsoluteContentSize.Y + 15)
	   end
 
	end
 
	function dropfunc:Clear()
	   Title.Text = text
	   --FrameSize = 0
	   ItemCount = 0
 
	   for i,v in next, DropdownHolder:GetChildren() do
		  if v.Name == "Item" then
			 v:Destroy()
		  end
	   end
 
	   DropdownFrame:TweenSize(
		  UDim2.new(0, 403, 0, 0),
		  Enum.EasingDirection.Out,
		  Enum.EasingStyle.Quart,
		  0.1,
		  true
	   )
	   DropdownHolder:TweenSize(
		  UDim2.new(0, 386, 0, 0),
		  Enum.EasingDirection.Out,
		  Enum.EasingStyle.Quart,
		  0.1,
		  true
	   )
	   TweenService:Create(
		  Arrow,
		  TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		  {Rotation = 0}
	   ):Play()
	   repeat
		  wait()
	   until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
	   DropdownFrame.Visible = false
	   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
	end
 
	function dropfunc:Add(toadd)
	   ItemCount = ItemCount + 1
 
		  FrameSize = 200
 
	   local Item = Instance.new("TextButton")
	   local ItemCorner = Instance.new("UICorner")
 
	   Item.Name = "Item"
	   Item.Parent = DropdownHolder
	   Item.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	   Item.Position = UDim2.new(0, 0, 0.0808080807, 0)
	   Item.Size = UDim2.new(0, 405, 0, 24)
	   Item.AutoButtonColor = false
	   Item.Font = Enum.Font.Gotham
	   Item.TextColor3 = Color3.fromRGB(255, 255, 255)
	   Item.TextSize = 14.000
	   Item.Text = toadd
 
	   ItemCorner.Name = "ItemCorner"
	   ItemCorner.Parent = Item
 
	   Item.MouseEnter:Connect(
		  function()
			 TweenService:Create(
				Item,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
			 ):Play()
		  end
	   )
	   Item.MouseLeave:Connect(
		  function()
			 TweenService:Create(
				Item,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
			 ):Play()
		  end
	   )
 
	   Item.MouseButton1Click:Connect(
		  function()
			 Title.Text = text .. " - " .. toadd
			 pcall(callback, toadd)
			 DropToggled = false
			 DropdownFrame:TweenSize(
				UDim2.new(0, 403, 0, 0),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 DropdownHolder:TweenSize(
				UDim2.new(0, 386, 0, 0),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 TweenService:Create(
				Arrow,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 0}
			 ):Play()
			 repeat
				wait()
			 until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
			 DropdownFrame.Visible = false
			 Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
		  end
	   )
 
	   DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, DropdownItemLayout.AbsoluteContentSize.Y + 15)
	end
 
	return dropfunc
 
 end
 
 
 function ContainerItems:Button(text, callback)
	local Button = Instance.new("TextButton")
	local ButtonCorner = Instance.new("UICorner")
 
	Button.Name = text
	Button.Parent = Container
	Button.BackgroundColor3 = getgenv().GUI_Color.DarkContrast
	Button.Size = UDim2.new(0, 405, 0, 40)
	Button.AutoButtonColor = false
	Button.Font = Enum.Font.Gotham
	Button.Text = text
	Button.TextColor3 = getgenv().GUI_Color.TextColor
	Button.TextSize = 15.000
 
	-- local ButtonStroke = Instance.new("UIStroke")
	-- ButtonStroke.Parent = Button
	-- ButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	-- ButtonStroke.Color = Color3.fromRGB(65, 65, 65)
	-- ButtonStroke.Transparency = 0.6
	
	ButtonCorner.CornerRadius = UDim.new(0, 5)
	ButtonCorner.Name = "ButtonCorner"
	ButtonCorner.Parent = Button
 
	Button.MouseEnter:Connect(function()
	   TweenService:Create(
		  Button,
		  TweenInfo.new(.3, Enum.EasingStyle.Quad),
		  {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
	   ):Play()
	end)
 
	Button.MouseLeave:Connect(function()
	   TweenService:Create(
		  Button,
		  TweenInfo.new(.3, Enum.EasingStyle.Quad),
		  {BackgroundColor3 = getgenv().GUI_Color.DarkContrast}
	   ):Play()
	end)
 
	Button.MouseButton1Click:Connect(function()
	   Button.TextSize = 0
	   TweenService:Create(
		  Button,
		  TweenInfo.new(.3, Enum.EasingStyle.Quad),
		  {TextSize = 20.000}
	   ):Play()
	   TweenService:Create(
		  Button,
		  TweenInfo.new(.3, Enum.EasingStyle.Quad),
		  {TextSize = 15.000}
	   ):Play()
	   pcall(callback)
	end)
	Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
 end
 
 function ContainerItems:Toggle(text, Default, callback)
	local Toggled = Default or false
 
	local Toggle = Instance.new("TextButton")
	local ToggleCorner = Instance.new("UICorner")
	local ToggleTitle = Instance.new("TextLabel")
	local ToggleCheck = Instance.new("Frame")
	local ToggleCheckCorner = Instance.new("UICorner")
	local ToggleCheckCheck = Instance.new("ImageButton")
 
	Toggle.Name = "Toggle"
	Toggle.Parent = Container
	Toggle.BackgroundColor3 = getgenv().GUI_Color.DarkContrast
	Toggle.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
	Toggle.Size = UDim2.new(0, 405, 0, 40)
	Toggle.AutoButtonColor = false
	Toggle.Font = Enum.Font.Gotham
	Toggle.Text = ""
	Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	Toggle.TextSize = 14.000
 
	-- local TextboxStroke = Instance.new("UIStroke")
	-- TextboxStroke.Parent = Toggle
	-- TextboxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	-- TextboxStroke.Color = Color3.fromRGB(65, 65, 65)
	-- TextboxStroke.Transparency = 0.6
	
	ToggleCorner.CornerRadius = UDim.new(0, 5)
	ToggleCorner.Name = "ToggleCorner"
	ToggleCorner.Parent = Toggle
	
	ToggleTitle.Name = "ToggleTitle"
	ToggleTitle.Parent = Toggle
	ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleTitle.BackgroundTransparency = 1.000
	ToggleTitle.Position = UDim2.new(0.0198511165, 0, 0, 0)
	ToggleTitle.Size = UDim2.new(0, 430, 0, 40)
	ToggleTitle.Font = Enum.Font.Gotham
	ToggleTitle.Text = text
	ToggleTitle.TextColor3 = getgenv().GUI_Color.TextColor
	ToggleTitle.TextSize = 15.000
	ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
 
	ToggleCheck.Name = "ToggleCheck"
	ToggleCheck.Parent = Toggle
	ToggleCheck.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ToggleCheck.Position = UDim2.new(0.90149349, 0, 0.21346131, 0)
	ToggleCheck.Size = UDim2.new(0, 26, 0, 24)
	
	ToggleCheckCorner.CornerRadius = UDim.new(0, 5)
	ToggleCheckCorner.Name = "ToggleCheckCorner"
	ToggleCheckCorner.Parent = ToggleCheck
	
	ToggleCheckCheck.Name = "ToggleCheckCheck"
	ToggleCheckCheck.Parent = ToggleCheck
	ToggleCheckCheck.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleCheckCheck.BackgroundTransparency = 1.000
	ToggleCheckCheck.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ToggleCheckCheck.Size = UDim2.new(0, 26, 0, 24)
	ToggleCheckCheck.Image = "rbxassetid://6031094667"
	ToggleCheckCheck.ImageTransparency = 1
 
	-- ToolTip(Toggle, ToggleTitle, tooltiptext or "this will turn on ".. text , text)
 
	Toggle.MouseEnter:Connect(function()
 
	   TweenService:Create(
		  Toggle,
		  TweenInfo.new(.3, Enum.EasingStyle.Quad),
		  {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
	   ):Play()
	end)
 
	Toggle.MouseLeave:Connect(function()
	   TweenService:Create(
		  Toggle,
		  TweenInfo.new(.3, Enum.EasingStyle.Quad),
		  {BackgroundColor3 = getgenv().GUI_Color.DarkContrast}
	   ):Play()
	end)
 
	if Toggled == false then
	   ToggleCheckCheck.ImageTransparency = 1
	else
	   ToggleCheckCheck.ImageTransparency = 0
		  pcall(callback, Toggled)
	end
 
	Toggle.MouseButton1Click:Connect(function()
	   if Toggled == false then
		  TweenService:Create(
			 ToggleCheckCheck,
			 TweenInfo.new(.3, Enum.EasingStyle.Quad),
			 {ImageTransparency = 0}
		  ):Play()
	   else
		  TweenService:Create(
			 ToggleCheckCheck,
			 TweenInfo.new(.3, Enum.EasingStyle.Quad),
			 {ImageTransparency = 1}
		  ):Play()
	   end
	   Toggled = not Toggled
	   
		  pcall(callback, Toggled)
	end)
	ToggleCheckCheck.MouseButton1Click:Connect(function()
	   if Toggled == false then
		  TweenService:Create(
			 ToggleCheckCheck,
			 TweenInfo.new(.3, Enum.EasingStyle.Quad),
			 {ImageTransparency = 0}
		  ):Play()
	   else
		  TweenService:Create(
			 ToggleCheckCheck,
			 TweenInfo.new(.3, Enum.EasingStyle.Quad),
			 {ImageTransparency = 1}
		  ):Play()
	   end
	   Toggled = not Toggled
	   
		  pcall(callback, Toggled)
	end)
	Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
 end
 
 
 function ContainerItems:Checklist(text,glob,list,callback)
	local dropfunc = {}
	local DropToggled = false
	local FrameSize = 0
	local ItemCount = 0
	local info_table = {}
	callback = callback or function() end -- this is some stuff lead made some cool stuff
 
 
	local Checklist = Instance.new("TextButton")
	local ChecklistTitle = Instance.new("TextLabel")
	local ChecklistCorner = Instance.new("UICorner")
	local ChecklistArrow = Instance.new("ImageLabel")
	local ChecklistFrame = Instance.new("Frame")
	local ChecklistFrameCorner = Instance.new("UICorner")
	local ChecklistHolder = Instance.new("ScrollingFrame")
	local ChecklistItemLayout = Instance.new("UIListLayout")
	local ChecklistItemHolder = Instance.new("UIPadding")
	local ChecklistItem = Instance.new("TextButton")
	local ChecklistItemCorner = Instance.new("UICorner")
	local ChecklistItemCheck = Instance.new("ImageLabel")
	local ChecklistSearch = Instance.new("TextBox")
	local ChecklistSearchCorner = Instance.new("UICorner")
 
 
	Checklist.Name = text
	Checklist.Parent = Container
	Checklist.BackgroundColor3 = getgenv().GUI_Color.DarkContrast
	Checklist.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
	Checklist.Size = UDim2.new(0, 405, 0, 40)
	Checklist.AutoButtonColor = false
	Checklist.Font = Enum.Font.Gotham
	Checklist.Text = ""
	Checklist.TextColor3 = Color3.fromRGB(255, 255, 255)
	Checklist.TextSize = 15.000
 
	-- local ChecklistStroke = Instance.new("UIStroke")
	-- ChecklistStroke.Parent = Checklist
	-- ChecklistStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	-- ChecklistStroke.Color = Color3.fromRGB(65, 65, 65)
	-- ChecklistStroke.Transparency = 0.6
 
	ChecklistTitle.Name = "ChecklistTitle"
	ChecklistTitle.Parent = Checklist
	ChecklistTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ChecklistTitle.BackgroundTransparency = 1.000
	ChecklistTitle.Position = UDim2.new(0.0198511165, 0, 0, 0)
	ChecklistTitle.Size = UDim2.new(0, 192, 0, 40)
	ChecklistTitle.Font = Enum.Font.Gotham
	ChecklistTitle.Text = text
	ChecklistTitle.TextColor3 = getgenv().GUI_Color.TextColor
	ChecklistTitle.TextSize = 15.000
	ChecklistTitle.TextXAlignment = Enum.TextXAlignment.Left
 
	ChecklistCorner.CornerRadius = UDim.new(0, 6)
	ChecklistCorner.Name = "ChecklistCorner"
	ChecklistCorner.Parent = Checklist
 
	ChecklistArrow.Name = "ChecklistArrow"
	ChecklistArrow.Parent = Checklist
	ChecklistArrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ChecklistArrow.BackgroundTransparency = 1.000
	ChecklistArrow.Position = UDim2.new(0.899999976, 0, 0.200000003, 0)
	ChecklistArrow.Size = UDim2.new(0, 27, 0, 27)
	ChecklistArrow.Image = "http://www.roblox.com/asset/?id=6034818372"
 
	ChecklistFrame.Name = text
	ChecklistFrame.Parent = Container
	ChecklistFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	ChecklistFrame.BorderSizePixel = 0
	ChecklistFrame.Position = UDim2.new(0, 0, 0.432717681, 0)
	ChecklistFrame.Size = UDim2.new(0, 346, 0, 0)
	-- 0, 346, 0, 100 ^^
	ChecklistFrame.Visible = false
 
	ChecklistFrameCorner.Name = "ChecklistFrameCorner"
	ChecklistFrameCorner.Parent = ChecklistFrame
 
	ChecklistHolder.Name = "ChecklistHolder"
	ChecklistHolder.Parent = ChecklistFrame
	ChecklistHolder.Active = true
	ChecklistHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ChecklistHolder.BackgroundTransparency = 1.000
	ChecklistHolder.BorderSizePixel = 0
	ChecklistHolder.Position = UDim2.new(0.0263156779, 0, 0.00326599111, 0)
	ChecklistHolder.Size = UDim2.new(0, 336, 0, 0)
	-- 0, 336, 0, 100 ^^
	ChecklistHolder.CanvasSize = UDim2.new(0, 0, 0, ChecklistItemLayout.AbsoluteContentSize.Y + 20)
	ChecklistHolder.ScrollBarThickness = 3
 
	ChecklistItemLayout.Name = "ChecklistItemLayout"
	ChecklistItemLayout.Parent = ChecklistHolder
	ChecklistItemLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ChecklistItemLayout.Padding = UDim.new(0, 5)
 
	ChecklistItemHolder.Name = "ChecklistItemHolder"
	ChecklistItemHolder.Parent = ChecklistHolder
	ChecklistItemHolder.PaddingBottom = UDim.new(0, 5)
	ChecklistItemHolder.PaddingTop = UDim.new(0, 5)
 
	ChecklistSearch.Name = "ChecklistSearch"
	ChecklistSearch.Parent = Checklist
	ChecklistSearch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ChecklistSearch.Position = UDim2.new(0.454320967, 0, 0.200000003, 0)
	ChecklistSearch.Size = UDim2.new(0, 172, 0, 27)
	ChecklistSearch.Font = Enum.Font.Ubuntu
	ChecklistSearch.PlaceholderColor3 = Color3.fromRGB(115, 115, 115)
	ChecklistSearch.PlaceholderText = "Search"
	ChecklistSearch.Text = ""
	ChecklistSearch.TextColor3 = Color3.fromRGB(255, 255, 255)
	ChecklistSearch.TextSize = 14.000
	
	ChecklistSearchCorner.Name = "ChecklistSearchCorner"
	ChecklistSearchCorner.Parent = ChecklistSearch
 
 local SearchBox = ChecklistSearch
 
 local v2 = {}
 
 function v2.gettext()
	 return SearchBox.Text
 end
 
 function v2.GetItems()
	 return ChecklistHolder
 end
 
 SearchBox.Changed:Connect(function()
	local search = string.lower(SearchBox.Text)
	 for i,v in pairs(v2.GetItems():GetChildren()) do
		 if v.ClassName == "TextButton" then
		  local item = string.lower(v.Text)
			 if string.find(item, search) then
				 v.Visible = true
			 else
				 v.Visible = false
			 end
		 end
	 end
 end)
 
	Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
 --------------------------------------------------------------------------------------------------
 --[[
	ChecklistSearch.Changed:Connect(function()
 
	ChecklistHolder.Size = UDim2.new(0, 336, 0, ChecklistItemLayout.AbsoluteContentSize.Y + 10)
 
	ChecklistFrame.Size = UDim2.new(0, 346, 0, ChecklistItemLayout.AbsoluteContentSize.Y + 10)
	end)]]
   
	Checklist.MouseEnter:Connect(
	   function()
		  TweenService:Create(
			 Checklist,
			 TweenInfo.new(.2, Enum.EasingStyle.Quad),
			 {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
		  ):Play()
	   end
	)
	Checklist.MouseLeave:Connect(
	   function()
		  TweenService:Create(
			 Checklist,
			 TweenInfo.new(.2, Enum.EasingStyle.Quad),
			 {BackgroundColor3 = getgenv().GUI_Color.DarkContrast}
		  ):Play()
	   end
	)
 
	Checklist.MouseButton1Click:Connect(
	   function()
		  if DropToggled == false then
			 ChecklistFrame.Visible = true
			 ChecklistFrame:TweenSize(
				UDim2.new(0, 346, 0, FrameSize),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 ChecklistHolder:TweenSize(
				UDim2.new(0, 336, 0, FrameSize),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 TweenService:Create(
				ChecklistArrow,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 180}
			 ):Play()
			 repeat
				wait()
			 until ChecklistFrame.Size == UDim2.new(0, 346, 0, FrameSize)
			 Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
		  else
			 ChecklistFrame:TweenSize(
				UDim2.new(0, 346, 0, 0),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 ChecklistHolder:TweenSize(
				UDim2.new(0, 336, 0, 0),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 TweenService:Create(
				ChecklistArrow,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 0}
			 ):Play()
			 repeat
				wait()
			 until ChecklistFrame.Size == UDim2.new(0, 346, 0, 0)
			 ChecklistFrame.Visible = false
			 Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
		  end
		  DropToggled = not DropToggled
	   end
	)
	-- test time
	checklists[glob] = {Value = {}, Toggled = false, Options = list}
	local OptionPreset = {}
 
 
	
	for i, v in next, list do
 
	   FrameSize = 300
 
	   local ChecklistItem = Instance.new("TextButton")
	   local ChecklistItemCorner = Instance.new("UICorner")
	   -- local ChecklistItemCheck = Instance.new("ImageLabel")
	   local CheckFrame = Instance.new("Frame")
	   local CheckFrameCorner = Instance.new("UICorner")
	   local KeyBoxStroke = Instance.new("UIStroke")
 
	   ChecklistItem.Name = v
	   ChecklistItem.Parent = ChecklistHolder
	   ChecklistItem.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	   ChecklistItem.Size = UDim2.new(0, 309, 0, 24)
	   ChecklistItem.AutoButtonColor = false
	   ChecklistItem.Font = Enum.Font.Gotham
	   ChecklistItem.Text = v
	   ChecklistItem.TextColor3 = Color3.fromRGB(255, 255, 255)
	   ChecklistItem.TextSize = 14.000
	
	   ChecklistItemCorner.Name = "ChecklistItemCorner"
	   ChecklistItemCorner.Parent = ChecklistItem
	
	   -- ChecklistItemCheck.Name = "ChecklistItemCheck"
	   -- ChecklistItemCheck.Parent = ChecklistItem
	   -- ChecklistItemCheck.BackgroundColor3 = Color3.fromRGB(16, 192, 255)
	   -- ChecklistItemCheck.BackgroundTransparency = 1.000
	   -- ChecklistItemCheck.Position = UDim2.new(0.898372591, 0, 0.0833333358, 0)
	   -- ChecklistItemCheck.Size = UDim2.new(0, 28, 0, 20)
	   -- ChecklistItemCheck.Image = "rbxassetid://6031068420"
	   -- ChecklistItemCheck.ImageColor3 = Color3.fromRGB(236, 136, 36)
 
	   CheckFrame.Name = "CheckFrame"
	   CheckFrame.Parent = ChecklistItem
	   CheckFrame.BackgroundColor3 = Color3.fromRGB(236, 136, 36)
	   CheckFrame.BackgroundTransparency = 1.000
	   CheckFrame.Position = UDim2.new(0.900849879, 0, 0.120370373, 0)
	   CheckFrame.Size = UDim2.new(0, 22, 0, 20)
	   
	   CheckFrameCorner.CornerRadius = UDim.new(0, 3)
	   CheckFrameCorner.Name = "CheckFrameCorner"
	   CheckFrameCorner.Parent = CheckFrame
 
	   KeyBoxStroke.Parent = CheckFrame
	   KeyBoxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	   KeyBoxStroke.Color = Color3.fromRGB(255,255,255)
	   KeyBoxStroke.Thickness = 1
 
	   ChecklistItem.MouseEnter:Connect(
		  function()
			 TweenService:Create(
				ChecklistItem,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
			 ):Play()
		  end
	   )
	   ChecklistItem.MouseLeave:Connect(
		  function()
			 TweenService:Create(
				ChecklistItem,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
			 ):Play()
		  end
	   )
 
	   ChecklistHolder.CanvasSize = UDim2.new(0, 0, 0, ChecklistItemLayout.AbsoluteContentSize.Y + 20)
 
	   
	   ChecklistItem.MouseButton1Click:Connect(function()
	   if table.find(checklists[glob].Value, v) then
		 table.remove(checklists[glob].Value, table.find(checklists[glob].Value, v))
		 --ChecklistTitle.Text = text .. " - " .. table.concat(checklists[glob].Value, ", ")
		 callback(checklists[glob].Value)
	  else
		 table.insert(checklists[glob].Value, v)
		 --ChecklistTitle.Text = text .. " - " .. table.concat(checklists[glob].Value, ", ")
		 callback(checklists[glob].Value)
	  end
	end)
 
	   local onlol = false
	   ChecklistItem.MouseButton1Click:Connect(function()
		  if onlol == false then
			 TweenService:Create(
				CheckFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 0}
			 ):Play()
			 TweenService:Create(
				KeyBoxStroke,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{Color = Color3.fromRGB(236, 136, 36)}
			 ):Play()
			 
			 onlol = true
 --[[
			 table.foreach(list, function(key, value)
				info_table[ChecklistItem.Text] = onlol
			 end)
 
			 callback(info_table)]]
		  else
			 TweenService:Create(
				CheckFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 1}
			 ):Play()
			 TweenService:Create(
				KeyBoxStroke,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{Color = Color3.fromRGB(255,255,255)}
			 ):Play()
			 onlol = false
 
			 --[[
			 table.foreach(list, function(key, value)
				info_table[ChecklistItem.Text] = onlol
			 end)
 
			 callback(info_table)]]
 
			 --callback(checklists.Value)
		  end
			 Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
		  end)
	end
 
	function dropfunc:Refresh(newlist)
	   for i,v in next, ChecklistHolder:GetChildren() do
		  if v.ClassName == "TextButton" then
			 v:Destroy()
		  end
	   end
 
	   for i,v in next, newlist do
		  local ChecklistItem = Instance.new("TextButton")
		  local ChecklistItemCorner = Instance.new("UICorner")
		  -- local ChecklistItemCheck = Instance.new("ImageLabel")
		  local CheckFrame = Instance.new("Frame")
		  local CheckFrameCorner = Instance.new("UICorner")
		  local KeyBoxStroke = Instance.new("UIStroke")
	
		  ChecklistItem.Name = v
		  ChecklistItem.Parent = ChecklistHolder
		  ChecklistItem.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		  ChecklistItem.Size = UDim2.new(0, 309, 0, 24)
		  ChecklistItem.AutoButtonColor = false
		  ChecklistItem.Font = Enum.Font.Gotham
		  ChecklistItem.Text = v
		  ChecklistItem.TextColor3 = Color3.fromRGB(255, 255, 255)
		  ChecklistItem.TextSize = 14.000
	   
		  ChecklistItemCorner.Name = "ChecklistItemCorner"
		  ChecklistItemCorner.Parent = ChecklistItem
	   
		  -- ChecklistItemCheck.Name = "ChecklistItemCheck"
		  -- ChecklistItemCheck.Parent = ChecklistItem
		  -- ChecklistItemCheck.BackgroundColor3 = Color3.fromRGB(16, 192, 255)
		  -- ChecklistItemCheck.BackgroundTransparency = 1.000
		  -- ChecklistItemCheck.Position = UDim2.new(0.898372591, 0, 0.0833333358, 0)
		  -- ChecklistItemCheck.Size = UDim2.new(0, 28, 0, 20)
		  -- ChecklistItemCheck.Image = "rbxassetid://6031068420"
		  -- ChecklistItemCheck.ImageColor3 = Color3.fromRGB(236, 136, 36)
	
		  CheckFrame.Name = "CheckFrame"
		  CheckFrame.Parent = ChecklistItem
		  CheckFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		  CheckFrame.BackgroundTransparency = 1.000
		  CheckFrame.Position = UDim2.new(0.900849879, 0, 0.120370373, 0)
		  CheckFrame.Size = UDim2.new(0, 22, 0, 20)
		  
		  CheckFrameCorner.CornerRadius = UDim.new(0, 3)
		  CheckFrameCorner.Name = "CheckFrameCorner"
		  CheckFrameCorner.Parent = CheckFrame
	
		  KeyBoxStroke.Parent = CheckFrame
		  KeyBoxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		  KeyBoxStroke.Color = Color3.fromRGB(255,255,255)
		  KeyBoxStroke.Thickness = 1
	
		  ChecklistItem.MouseEnter:Connect(
			 function()
				TweenService:Create(
				   ChecklistItem,
				   TweenInfo.new(.2, Enum.EasingStyle.Quad),
				   {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
				):Play()
			 end
		  )
		  ChecklistItem.MouseLeave:Connect(
			 function()
				TweenService:Create(
				   ChecklistItem,
				   TweenInfo.new(.2, Enum.EasingStyle.Quad),
				   {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
				):Play()
			 end
		  )
	
		  ChecklistItem.MouseButton1Click:Connect(function()
			 if table.find(checklists[glob].Value, v) then
			   table.remove(checklists[glob].Value, table.find(checklists[glob].Value, v))
			 --   ChecklistTitle.Text = text .. " - " .. table.concat(checklists[glob].Value, ", ")
			   callback(checklists[glob].Value)
			else
			   table.insert(checklists[glob].Value, v)
			 --   ChecklistTitle.Text = text .. " - " .. table.concat(checklists[glob].Value, ", ")
			   callback(checklists[glob].Value)
			end
		  end)
 
		  local onlol = false
		  ChecklistItem.MouseButton1Click:Connect(function()
			 if onlol == false then
				TweenService:Create(
				   CheckFrame,
				   TweenInfo.new(.3, Enum.EasingStyle.Quad),
				   {BackgroundTransparency = 0}
				):Play()
				TweenService:Create(
				   KeyBoxStroke,
				   TweenInfo.new(.3, Enum.EasingStyle.Quad),
				   {Color = Color3.fromRGB(236, 136, 36)}
				):Play()
				
				onlol = true
	--[[
				table.foreach(list, function(key, value)
				   info_table[ChecklistItem.Text] = onlol
				end)
	
				callback(info_table)]]
			 else
				TweenService:Create(
				   CheckFrame,
				   TweenInfo.new(.3, Enum.EasingStyle.Quad),
				   {BackgroundTransparency = 1}
				):Play()
				TweenService:Create(
				   KeyBoxStroke,
				   TweenInfo.new(.3, Enum.EasingStyle.Quad),
				   {Color = Color3.fromRGB(255,255,255)}
				):Play()
				onlol = false
	
				--[[
				table.foreach(list, function(key, value)
				   info_table[ChecklistItem.Text] = onlol
				end)
	
				callback(info_table)]]
	
				--callback(checklists.Value)
			 end
				Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
			 end)
	
		  ChecklistHolder.CanvasSize = UDim2.new(0, 0, 0, ChecklistItemLayout.AbsoluteContentSize.Y + 15)
	   end
 
	end
 
 
	function dropfunc:Clear()
	   ChecklistTitle.Text = text
	   FrameSize = 0
	   ItemCount = 0
 
	   for i,v in next, ChecklistHolder:GetChildren() do
		  if v.Name == "Item" then
			 v:Destroy()
		  end
	   end
	   
	   ChecklistFrame:TweenSize(
		  UDim2.new(0, 403, 0, 0),
		  Enum.EasingDirection.Out,
		  Enum.EasingStyle.Quart,
		  0.1,
		  true
	   )
	   ChecklistHolder:TweenSize(
		  UDim2.new(0, 386, 0, 0),
		  Enum.EasingDirection.Out,
		  Enum.EasingStyle.Quart,
		  0.1,
		  true
	   )
	   TweenService:Create(
		  ChecklistArrow,
		  TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		  {Rotation = 0}
	   ):Play()
	   repeat
		  wait()
	   until ChecklistFrame.Size == UDim2.new(0, 403, 0, 0)
	   ChecklistFrame.Visible = false
	   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
	end
 
	function dropfunc:Add(toadd)
	   ItemCount = ItemCount + 1
 
		  FrameSize = 300
 
		  local ChecklistItem = Instance.new("TextButton")
		  local ChecklistItemCorner = Instance.new("UICorner")
		  -- local ChecklistItemCheck = Instance.new("ImageLabel")
		  local CheckFrame = Instance.new("Frame")
		  local CheckFrameCorner = Instance.new("UICorner")
		  local KeyBoxStroke = Instance.new("UIStroke")
	
		  ChecklistItem.Name = toadd
		  ChecklistItem.Parent = ChecklistHolder
		  ChecklistItem.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		  ChecklistItem.Size = UDim2.new(0, 309, 0, 24)
		  ChecklistItem.AutoButtonColor = false
		  ChecklistItem.Font = Enum.Font.Gotham
		  ChecklistItem.Text = toadd
		  ChecklistItem.TextColor3 = Color3.fromRGB(255, 255, 255)
		  ChecklistItem.TextSize = 14.000
	   
		  ChecklistItemCorner.Name = "ChecklistItemCorner"
		  ChecklistItemCorner.Parent = ChecklistItem
	   
		  -- ChecklistItemCheck.Name = "ChecklistItemCheck"
		  -- ChecklistItemCheck.Parent = ChecklistItem
		  -- ChecklistItemCheck.BackgroundColor3 = Color3.fromRGB(16, 192, 255)
		  -- ChecklistItemCheck.BackgroundTransparency = 1.000
		  -- ChecklistItemCheck.Position = UDim2.new(0.898372591, 0, 0.0833333358, 0)
		  -- ChecklistItemCheck.Size = UDim2.new(0, 28, 0, 20)
		  -- ChecklistItemCheck.Image = "rbxassetid://6031068420"
		  -- ChecklistItemCheck.ImageColor3 = Color3.fromRGB(236, 136, 36)
	
		  CheckFrame.Name = "CheckFrame"
		  CheckFrame.Parent = ChecklistItem
		  CheckFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		  CheckFrame.BackgroundTransparency = 1.000
		  CheckFrame.Position = UDim2.new(0.900849879, 0, 0.120370373, 0)
		  CheckFrame.Size = UDim2.new(0, 22, 0, 20)
		  
		  CheckFrameCorner.CornerRadius = UDim.new(0, 3)
		  CheckFrameCorner.Name = "CheckFrameCorner"
		  CheckFrameCorner.Parent = CheckFrame
	
		  KeyBoxStroke.Parent = CheckFrame
		  KeyBoxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		  KeyBoxStroke.Color = Color3.fromRGB(255,255,255)
		  KeyBoxStroke.Thickness = 1
 
	   ChecklistItem.MouseEnter:Connect(
		  function()
			 TweenService:Create(
				ChecklistItem,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
			 ):Play()
		  end
	   )
	   ChecklistItem.MouseLeave:Connect(
		  function()
			 TweenService:Create(
				ChecklistItem,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
			 ):Play()
		  end
	   )
 
	   ChecklistItem.MouseButton1Click:Connect(function()
		  if table.find(checklists[glob].Value, toadd) then
			table.remove(checklists[glob].Value, table.find(checklists[glob].Value, toadd))
		  --   ChecklistTitle.Text = text .. " - " .. table.concat(checklists[glob].Value, ", ")
			callback(checklists[glob].Value)
		 else
			table.insert(checklists[glob].Value, toadd)
		  --   ChecklistTitle.Text = text .. " - " .. table.concat(checklists[glob].Value, ", ")
			callback(checklists[glob].Value)
		 end
	   end)
 
	   local onlol = false
	   ChecklistItem.MouseButton1Click:Connect(function()
		  if onlol == false then
			 TweenService:Create(
				CheckFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 0}
			 ):Play()
			 TweenService:Create(
				KeyBoxStroke,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{Color = Color3.fromRGB(236, 136, 36)}
			 ):Play()
			 
			 onlol = true
 --[[
			 table.foreach(list, function(key, value)
				info_table[ChecklistItem.Text] = onlol
			 end)
 
			 callback(info_table)]]
		  else
			 TweenService:Create(
				CheckFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 1}
			 ):Play()
			 TweenService:Create(
				KeyBoxStroke,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{Color = Color3.fromRGB(255,255,255)}
			 ):Play()
			 onlol = false
 
			 --[[
			 table.foreach(list, function(key, value)
				info_table[ChecklistItem.Text] = onlol
			 end)
 
			 callback(info_table)]]
 
			 --callback(checklists.Value)
		  end
			 Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
		  end)
 
	   ChecklistHolder.CanvasSize = UDim2.new(0, 0, 0, ChecklistItemLayout.AbsoluteContentSize.Y + 20)
	   return checklists[glob]
	end
 
	return dropfunc
 end
 
 
 
 
 
 function ContainerItems:Colorpicker(text, preset, callback)
	local ColorPickerToggled = false
	local OldToggleColor = Color3.fromRGB(0, 0, 0)
	local OldColor = Color3.fromRGB(0, 0, 0)
	local OldColorSelectionPosition = nil
	local OldHueSelectionPosition = nil
	local ColorH, ColorS, ColorV = 1, 1, 1
	local RainbowColorPicker = false
	local ColorPickerInput = nil
	local ColorInput = nil
	local HueInput = nil
 
	local Colorpicker = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	local BoxColor = Instance.new("Frame")
	local BoxcolorCorner = Instance.new("UICorner")
	local ColorpickerCorner = Instance.new("UICorner")
 
	Colorpicker.Name = text
	Colorpicker.Parent = Container
	Colorpicker.BackgroundColor3 = getgenv().GUI_Color.DarkContrast
	Colorpicker.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
	Colorpicker.Size = UDim2.new(0, 405, 0, 40)
	Colorpicker.AutoButtonColor = false
	Colorpicker.Font = Enum.Font.Gotham
	Colorpicker.Text = ""
	Colorpicker.TextColor3 = Color3.fromRGB(255, 255, 255)
	Colorpicker.TextSize = 14.000
 
	-- local ColorpickerStroke = Instance.new("UIStroke")
	-- ColorpickerStroke.Parent = Colorpicker
	-- ColorpickerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	-- ColorpickerStroke.Color = Color3.fromRGB(65, 65, 65)
	-- ColorpickerStroke.Transparency = 0.6
 
	Title.Name = "Title"
	Title.Parent = Colorpicker
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0198511165, 0, 0, 0)
	Title.Size = UDim2.new(0, 405, 0, 40)
	Title.Font = Enum.Font.Gotham
	Title.Text = text
	Title.TextColor3 = getgenv().GUI_Color.TextColor
	Title.TextSize = 15.000
	Title.TextXAlignment = Enum.TextXAlignment.Left
 
	BoxColor.Name = "Boxcolor"
	BoxColor.Parent = Colorpicker
	BoxColor.BackgroundColor3 = preset
	BoxColor.Position = UDim2.new(0.88, 0, 0.3, 0)
	BoxColor.Size = UDim2.new(0, 36, 0, 19)
 
	BoxcolorCorner.CornerRadius = UDim.new(0, 6)
	BoxcolorCorner.Name = "BoxcolorCorner"
	BoxcolorCorner.Parent = BoxColor
 
	ColorpickerCorner.CornerRadius = UDim.new(0, 4)
	ColorpickerCorner.Name = "ColorpickerCorner"
	ColorpickerCorner.Parent = Colorpicker
 
	local ColorpickerFrame = Instance.new("Frame")
	local DropdownFrameCorner = Instance.new("UICorner")
	local Hue = Instance.new("ImageLabel")
	local HueCorner = Instance.new("UICorner")
	local HueGradient = Instance.new("UIGradient")
	local HueSelection = Instance.new("ImageLabel")
	local Color = Instance.new("ImageLabel")
	local ColorCorner = Instance.new("UICorner")
	local ColorSelection = Instance.new("ImageLabel")
	local Confirm = Instance.new("TextButton")
	local ButtonCorner = Instance.new("UICorner")
	local RainbowToggle = Instance.new("TextButton")
	local RainbowToggleCorner = Instance.new("UICorner")
	local RainbowTitle = Instance.new("TextLabel")
	local RainbowToggleFrame = Instance.new("Frame")
	local RainbowToggleFrameCorner = Instance.new("UICorner")
	local RainbowToggleFrameRainbow = Instance.new("Frame")
	local RainbowToggleFrameRainbowCorner = Instance.new("UICorner")
	local RainbowToggleDot = Instance.new("Frame")
	local RainbowToggleDotCorner = Instance.new("UICorner")
	local RainbowToggleDotGradient = Instance.new("UIGradient")
 
	ColorpickerFrame.Name = "ColorpickerFrame"
	ColorpickerFrame.Parent = Container
	ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	ColorpickerFrame.BorderSizePixel = 0
	ColorpickerFrame.Position = UDim2.new(0.165624991, 0, 0.671052635, 0)
	ColorpickerFrame.Size = UDim2.new(0, 403, 0, 0)
	ColorpickerFrame.Visible = false
	ColorpickerFrame.ClipsDescendants = true
 
	DropdownFrameCorner.Name = "DropdownFrameCorner"
	DropdownFrameCorner.Parent = ColorpickerFrame
 
	Hue.Name = "Hue"
	Hue.Parent = ColorpickerFrame
	Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Hue.Position = UDim2.new(0, 209, 0, 9)
	Hue.Size = UDim2.new(0, 25, 0, 80)
 
	HueCorner.CornerRadius = UDim.new(0, 3)
	HueCorner.Name = "HueCorner"
	HueCorner.Parent = Hue
 
	HueGradient.Color =
	   ColorSequence.new {
		  ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
		  ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
		  ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
		  ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
		  ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
		  ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
		  ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
	   }
	HueGradient.Rotation = 270
	HueGradient.Name = "HueGradient"
	HueGradient.Parent = Hue
 
	HueSelection.Name = "HueSelection"
	HueSelection.Parent = Hue
	HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
	HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HueSelection.BackgroundTransparency = 1.000
	HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
	HueSelection.Size = UDim2.new(0, 18, 0, 18)
	HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
 
	Color.Name = "Color"
	Color.Parent = ColorpickerFrame
	Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
	Color.Position = UDim2.new(0, 9, 0, 9)
	Color.Size = UDim2.new(0, 194, 0, 80)
	Color.ZIndex = 10
	Color.Image = "rbxassetid://4155801252"
 
	ColorCorner.CornerRadius = UDim.new(0, 3)
	ColorCorner.Name = "ColorCorner"
	ColorCorner.Parent = Color
 
	ColorSelection.Name = "ColorSelection"
	ColorSelection.Parent = Color
	ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
	ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorSelection.BackgroundTransparency = 1.000
	ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
	ColorSelection.Size = UDim2.new(0, 18, 0, 18)
	ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
	ColorSelection.ScaleType = Enum.ScaleType.Fit
 
	Confirm.Name = "Confirm"
	Confirm.Parent = ColorpickerFrame
	Confirm.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Confirm.BackgroundTransparency = 0.010
	Confirm.Position = UDim2.new(0.612244904, 0, 0.0900000036, 0)
	Confirm.Size = UDim2.new(0, 145, 0, 27)
	Confirm.AutoButtonColor = false
	Confirm.Font = Enum.Font.Gotham
	Confirm.Text = "Confirm"
	Confirm.TextColor3 = Color3.fromRGB(255, 255, 255)
	Confirm.TextSize = 14.000
 
	ButtonCorner.Name = "ButtonCorner"
	ButtonCorner.Parent = Confirm
 
	RainbowToggle.Name = "RainbowToggle"
	RainbowToggle.Parent = ColorpickerFrame
	RainbowToggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	RainbowToggle.Position = UDim2.new(0.610732794, 0, 0.431324542, 0)
	RainbowToggle.Size = UDim2.new(0, 145, 0, 27)
	RainbowToggle.AutoButtonColor = false
	RainbowToggle.Font = Enum.Font.Gotham
	RainbowToggle.Text = ""
	RainbowToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	RainbowToggle.TextSize = 14.000
 
	RainbowToggleCorner.Name = "RainbowToggleCorner"
	RainbowToggleCorner.Parent = RainbowToggle
 
	RainbowTitle.Name = "RainbowTitle"
	RainbowTitle.Parent = RainbowToggle
	RainbowTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RainbowTitle.BackgroundTransparency = 1.000
	RainbowTitle.Position = UDim2.new(0.0204080511, 0, 0, 0)
	RainbowTitle.Size = UDim2.new(0, 29, 0, 27)
	RainbowTitle.Font = Enum.Font.Gotham
	RainbowTitle.Text = "Rainbow"
	RainbowTitle.TextColor3 = getgenv().GUI_Color.TextColor
	RainbowTitle.TextSize = 14.000
	RainbowTitle.TextXAlignment = Enum.TextXAlignment.Left
 
	RainbowToggleFrame.Name = "RainbowToggleFrame"
	RainbowToggleFrame.Parent = RainbowToggle
	RainbowToggleFrame.BackgroundColor3 = Color3.fromRGB(22, 23, 27)
	RainbowToggleFrame.Position = UDim2.new(0.693, 0, 0.142857149, 0)
	RainbowToggleFrame.Size = UDim2.new(0, 36, 0, 19)
 
	RainbowToggleFrameCorner.CornerRadius = UDim.new(1, 0)
	RainbowToggleFrameCorner.Name = "RainbowToggleFrameCorner"
	RainbowToggleFrameCorner.Parent = RainbowToggleFrame
 
	RainbowToggleFrameRainbow.Name = "RainbowToggleFrameRainbow"
	RainbowToggleFrameRainbow.Parent = RainbowToggleFrame
	RainbowToggleFrameRainbow.BackgroundColor3 = Color3.fromRGB(67,136,246)
	RainbowToggleFrameRainbow.BackgroundTransparency = 1.000
	RainbowToggleFrameRainbow.Position = UDim2.new(-0.0198377371, 0, 0.00601506233, 0)
	RainbowToggleFrameRainbow.Size = UDim2.new(0, 36, 0, 19)
 
	RainbowToggleFrameRainbowCorner.CornerRadius = UDim.new(1, 0)
	RainbowToggleFrameRainbowCorner.Name = "RainbowToggleFrameRainbowCorner"
	RainbowToggleFrameRainbowCorner.Parent = RainbowToggleFrameRainbow
 
	RainbowToggleDot.Name = "RainbowToggleDot"
	RainbowToggleDot.Parent = RainbowToggleFrameRainbow
	RainbowToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RainbowToggleDot.Position = UDim2.new(0.104999997, -3, 0.289000005, -4)
	RainbowToggleDot.Size = UDim2.new(0, 18, 0, 16)
 
	RainbowToggleDotCorner.CornerRadius = UDim.new(1, 0)
	RainbowToggleDotCorner.Name = "RainbowToggleDotCorner"
	RainbowToggleDotCorner.Parent = RainbowToggleDot
 
	RainbowToggleDotGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(236, 136, 36)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 204, 51))}
	RainbowToggleDotGradient.Name = "RainbowToggleDotGradient"
	RainbowToggleDotGradient.Parent = RainbowToggleDot
 
	Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
 
	Colorpicker.MouseEnter:Connect(
	   function()
		  TweenService:Create(
			 Colorpicker,
			 TweenInfo.new(.2, Enum.EasingStyle.Quad),
			 {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
		  ):Play()
	   end
	)
	Colorpicker.MouseLeave:Connect(
	   function()
		  TweenService:Create(
			 Colorpicker,
			 TweenInfo.new(.2, Enum.EasingStyle.Quad),
			 {BackgroundColor3 = getgenv().GUI_Color.DarkContrast}
		  ):Play()
	   end
	)
 
	local function UpdateColorPicker(nope)
	   BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
	   Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
 
	   pcall(callback, BoxColor.BackgroundColor3)
	end
 
	ColorH =
	   1 -
	   (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
		  Hue.AbsoluteSize.Y)
	ColorS =
	   (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
		  Color.AbsoluteSize.X)
	ColorV =
	   1 -
	   (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
		  Color.AbsoluteSize.Y)
 
	BoxColor.BackgroundColor3 = preset
	Color.BackgroundColor3 = preset
	pcall(callback, BoxColor.BackgroundColor3)
 
	Color.InputBegan:Connect(
	   function(input)
		  if input.UserInputType == Enum.UserInputType.MouseButton1 then
			 if RainbowColorPicker then
				return
			 end
 
			 if ColorInput then
				ColorInput:Disconnect()
			 end
 
			 ColorInput =
				RunService.RenderStepped:Connect(
				   function()
				   local ColorX =
					  (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						 Color.AbsoluteSize.X)
				   local ColorY =
					  (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						 Color.AbsoluteSize.Y)
 
				   ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
				   ColorS = ColorX
				   ColorV = 1 - ColorY
 
				   UpdateColorPicker(true)
				end
				)
		  end
	   end
	)
 
	Color.InputEnded:Connect(
	   function(input)
		  if input.UserInputType == Enum.UserInputType.MouseButton1 then
			 if ColorInput then
				ColorInput:Disconnect()
			 end
		  end
	   end
	)
 
	Hue.InputBegan:Connect(
	   function(input)
		  if input.UserInputType == Enum.UserInputType.MouseButton1 then
			 if RainbowColorPicker then
				return
			 end
 
			 if HueInput then
				HueInput:Disconnect()
			 end
 
			 HueInput =
				RunService.RenderStepped:Connect(
				   function()
				   local HueY =
					  (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
						 Hue.AbsoluteSize.Y)
 
				   HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
				   ColorH = 1 - HueY
 
				   UpdateColorPicker(true)
				end
				)
		  end
	   end
	)
 
	Hue.InputEnded:Connect(
	   function(input)
		  if input.UserInputType == Enum.UserInputType.MouseButton1 then
			 if HueInput then
				HueInput:Disconnect()
			 end
		  end
	   end
	)
 
	RainbowToggle.MouseButton1Down:Connect(
	   function()
		  RainbowColorPicker = not RainbowColorPicker
 
		  if ColorInput then
			 ColorInput:Disconnect()
		  end
 
		  if HueInput then
			 HueInput:Disconnect()
		  end
 
		  if RainbowColorPicker then
			 TweenService:Create(
				RainbowToggleFrameRainbow,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 1}
			 ):Play()
			 TweenService:Create(
				RainbowToggleDot,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{Position = UDim2.new(0.595, -3, 0.289000005, -4)}
			 ):Play()
 
			 OldToggleColor = BoxColor.BackgroundColor3
			 OldColor = Color.BackgroundColor3
			 OldColorSelectionPosition = ColorSelection.Position
			 OldHueSelectionPosition = HueSelection.Position
 
			 while RainbowColorPicker do
				BoxColor.BackgroundColor3 = Color3.fromHSV(Mainholder.RainbowColorValue, 1, 1)
				Color.BackgroundColor3 = Color3.fromHSV(Mainholder.RainbowColorValue, 1, 1)
 
				ColorSelection.Position = UDim2.new(1, 0, 0, 0)
				HueSelection.Position = UDim2.new(0.48, 0, 0, Mainholder.HueSelectionPosition)
 
				pcall(callback, BoxColor.BackgroundColor3)
				wait()
			 end
		  elseif not RainbowColorPicker then
			 TweenService:Create(
				RainbowToggleFrameRainbow,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 1}
			 ):Play()
			 TweenService:Create(
				RainbowToggleDot,
				TweenInfo.new(.2, Enum.EasingStyle.Quad),
				{Position = UDim2.new(0.104999997, -3, 0.289000005, -4)}
			 ):Play()
 
			 BoxColor.BackgroundColor3 = OldToggleColor
			 Color.BackgroundColor3 = OldColor
 
			 ColorSelection.Position = OldColorSelectionPosition
			 HueSelection.Position = OldHueSelectionPosition
 
			 pcall(callback, BoxColor.BackgroundColor3)
		  end
	   end
	)
 
	Colorpicker.MouseButton1Click:Connect(
	   function()
		  if ColorPickerToggled == false then
			 ColorPickerToggled = not ColorPickerToggled
			 ColorpickerFrame.Visible = true
			 ColorpickerFrame:TweenSize(
				UDim2.new(0, 403, 0, 100),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 repeat
				wait()
			 until ColorpickerFrame.Size == UDim2.new(0, 403, 0, 100)
			 Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
		  else
			 ColorPickerToggled = not ColorPickerToggled
			 ColorpickerFrame:TweenSize(
				UDim2.new(0, 403, 0, 0),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				0.1,
				true
			 )
			 repeat
				wait()
			 until ColorpickerFrame.Size == UDim2.new(0, 403, 0, 0)
			 ColorpickerFrame.Visible = false
			 Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
		  end
	   end
	)
 
	Confirm.MouseButton1Click:Connect(
	   function()
		Confirm.TextSize = 0
		TweenService:Create(
			Confirm,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{TextSize = 14.000}
		):Play()
		wait(.1)
		  ColorPickerToggled = not ColorPickerToggled
		  ColorpickerFrame:TweenSize(
			 UDim2.new(0, 403, 0, 0),
			 Enum.EasingDirection.Out,
			 Enum.EasingStyle.Quart,
			 0.1,
			 true
		  )
		  repeat
			 wait()
		  until ColorpickerFrame.Size == UDim2.new(0, 403, 0, 0)
		  ColorpickerFrame.Visible = false
		  Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 5)
	   end)
 
	coroutine.wrap(
	   function()
		  while wait() do
 
		  end
	   end
	)()
 end
 
 function Mainholder:setTheme(Tab)
	Tab:Colorpicker("DarkContrast", Color3.fromRGB(35, 35, 35), function(t)
	   for i,v in pairs(game:GetService("CoreGui").woof.MainFrame.ContainerHold:GetDescendants()) do
		  if v.ClassName == "TextButton" then
			 v.BackgroundColor3 = t
		  end
	   end
	   getgenv().GUI_Color.DarkContrast = t
	end)
	Tab:Colorpicker("Background Color", Color3.fromRGB(27, 27, 27), function(t)
	   game:GetService("CoreGui").woof.MainFrame.BackgroundColor3 = t
	   getgenv().GUI_Color.Bacground = t
	end)
	Tab:Colorpicker("TextColor", Color3.fromRGB(255, 255, 255), function(t)
	   for i,v in pairs(game:GetService("CoreGui").woof.MainFrame.ContainerHold:GetDescendants()) do
		  if string.find(v.Name, "Title") or v.ClassName == "TextButton" then
			 v.TextColor3 = t
		  end
	   end
	   getgenv().GUI_Color.TextColor = t
	end)
 end
 
 return ContainerItems
 end
 return Tabs
 end
 
   return Mainholder

   --[[
	How to use example:
local VLib = loadstring(game:HttpGet("https://gitlab.com/L1ZOT/test-project/-/raw/main/PJM-GUI"))()
local Win = VLib:Window("Project Meow", "Speed of Legends")
local Main = Win:Tab("Main")
local Autofarm = Win:Tab("Autofarm")
local Credits = Win:Tab("Credits")

if game.workspace:FindFirstChild("ManahubPart") then
    
else
    local ManahubPart = Instance.new("Part")
    ManahubPart.Name = "ManahubPart"
    ManahubPart.Parent = game.Workspace
    ManahubPart.Anchored = true
    ManahubPart.Transparency = 0
    ManahubPart.Size = Vector3.new(30,-0.5,30)
    ManahubPart.Position = Vector3.new(-543.452, 2873.2, 324.647)
end

Main:Slider("WalkSpeed", 0, 250, 16, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

Main:Slider("JumpPower", 0, 250, 50, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)


Autofarm:Toggle("Auto Steps", false, function (t)
    getgenv().Autostep = t
    while wait() do
        if getgenv().Autostep == true then
                    pcall(function ()
                        for i = 1,20 do
                            local args = {
                                [1] = "collectOrb",
                                [2] = "Red Orb",
                                [3] = "City"
                            }
                            
                            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                            local args = {
                                [1] = "collectOrb",
                                [2] = "Blue Orb",
                                [3] = "City"
                            }
                            
                            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                        end
                end)
             end
        end
end)

Autofarm:Toggle("Auto collect gems", false, function(t)
spawn(function()
    getgenv().AutocollectDiamonds = t
    while task.wait() do
    if getgenv().AutocollectDiamonds == true then
pcall(function()
    for i = 1,10 do
        local args = {
            [1] = "collectOrb",
            [2] = "Gem",
            [3] = "City"
            }
            
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            
            local args = {
            [1] = "collectOrb",
            [2] = "Gem",
            [3] = "Desert"
            }
            
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            
            local args = {
            [1] = "collectOrb",
            [2] = "Gem",
            [3] = "Magma City"
            }
            
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
    end
end)
end
end
end)
end)

Autofarm:Toggle("Hops Farm", false, function(t)
    getgenv().Autohops = t
    while task.wait() do
if getgenv().Autohops == true then
        for i,v in pairs(game:GetService("Workspace").Hoops:GetChildren()) do
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end
end)

Autofarm:Toggle("Safe Hops Farm", false, function(t)
    HoopsFarm = t
end)

spawn(function()
    while task.wait() do
        if HoopsFarm then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Hoops:GetChildren()) do
                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    wait(.3)
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(.3) do
        if HoopsFarm then
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-547.52026, 2893.19995, 327.647003)
            end)
        end
    end
end)


Autofarm:Toggle("AutoRebirth", false, function(t)
spawn(function()
    getgenv().AutoRebirth = t
    while wait() do
    if getgenv().AutoRebirth == true then
        pcall(function ()
            local args = {
                [1] = "rebirthRequest"
            }
            
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))
            local args = {
                [1] = "rebirthRequest"
            }
            
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))
        end)
        end
    end
end)
end)

Autofarm:Button("Collect Chests", false, function(t)

    local args = {
        [1] = "groupRewards"
    }
    game:GetService("ReplicatedStorage").rEvents.groupRemote:InvokeServer(unpack(args))

    local args = {
        [1] = "Enchanted Chest"
    }
    
    game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(unpack(args))
    wait()
    local args = {
        [1] = workspace.rewardChests.rewardChest
    }
    
    game:GetService("ReplicatedStorage").rEvents.collectCourseChestRemote:InvokeServer(unpack(args))
end)




Credits:Button("LeadMarker#1219 & Karma#9368", function()
   
    setclipboard("https://discord.gg/97anmxFpkU")
    
end) 

Credits:Button("Mana#9724 & Septex#9788 (he is very hot)", function()
    setclipboard("https://discord.gg/97anmxFpkU")
end)

Credits:Button("UI Designer: Luke Marcus#4347", function()
    setclipboard("https://discord.gg/97anmxFpkU")
end)

Credits:Button("Project Meow Discord Server", function()
    setclipboard("https://discord.gg/97anmxFpkU")
        local req = (syn and syn.request) or (http and http.request) or http_request
        if req then
            req({
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    Origin = 'https://discord.com'
                },
                Body = game:GetService('HttpService'):JSONEncode({
                    cmd = 'INVITE_BROWSER',
                    nonce = game:GetService('HttpService'):GenerateGUID(false),
                    args = {code = '97anmxFpkU'}
                })
            })
        end
end)

Credits:line()
Credits:Button("Destroy Gui", function()
    game.CoreGui:FindFirstChild("woof"):Destroy()
end)

Credits:Button("Rejoin", function()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)

   ]]