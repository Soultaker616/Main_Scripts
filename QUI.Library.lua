local QUILibrary = {}

local QUI_Settings = {
	Obfuscation = true
}



local UserInputService 		= game:GetService("UserInputService")
local TweenService 			= game:GetService("TweenService")
local Players 				= game:GetService("Players")
local StarterGui			= game:GetService("StarterGui")
local CoreGui				= game:GetService("CoreGui")



local function randomString()
	if QUI_Settings.Obfuscation then
		local length = math.random(10, 20)
		local array = {}
		for i = 1, length do
			array[i] = string.char(math.random(32, 126))
		end
		return table.concat(array)
	else
		local text = "https://discord.gg/c3pHW9VX3D"
		return text
	end
end

local function MakeDraggable(Main)
	pcall(function()
		local Camera = workspace:FindFirstChild("Camera")
		if not Camera then
			return
		end

		local DragMousePosition
		local FramePosition
		local Draggable = false

		Main.InputBegan:Connect(function(input, GameProcessedEvent)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and not GameProcessedEvent then
				Draggable = true
				DragMousePosition = Vector2.new(input.Position.X, input.Position.Y)
				FramePosition = Vector2.new(Main.Position.X.Scale, Main.Position.Y.Scale)
			end
		end)

		UserInputService.InputChanged:Connect(function(input, GameProcessedEvent)
			if Draggable and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and not GameProcessedEvent then
				local NewPosition = FramePosition + ((Vector2.new(input.Position.X, input.Position.Y) - DragMousePosition) / Camera.ViewportSize)
				TweenService:Create(Main, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(NewPosition.X, 0, NewPosition.Y, 0)}):Play()
			end
		end)

		UserInputService.InputEnded:Connect(function(input, GameProcessedEvent)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and not GameProcessedEvent then
				Draggable = false
			end
		end)
	end)
end

local function MakeCorner(UI,Radius1,Radius2)
	local New 			= Instance.new("UICorner",UI)
	New.CornerRadius 	= UDim.new(Radius1,Radius2)
	New.Name			= randomString()
end

local function MakeStroke(StrokeOptions)
	local UIStroke				= Instance.new("UIStroke", StrokeOptions.UI)
	UIStroke.ApplyStrokeMode 	= StrokeOptions.StrokeMode 		or Enum.ApplyStrokeMode.Contextual
	UIStroke.Color				= StrokeOptions.Color 			or Color3.fromRGB(255, 255, 255)
	UIStroke.LineJoinMode		= StrokeOptions.LineJoinMode 	or Enum.LineJoinMode.Round
	UIStroke.Thickness			= StrokeOptions.Thickness		or 1
	UIStroke.Transparency		= StrokeOptions.Transparency	or 0
	UIStroke.Name				= randomString()
end

local view = game:GetService("Workspace").CurrentCamera.ViewportSize

local float = randomString()

function QUILibrary:Window(opt)
	local Elements 		= {}
	local QUILibrary 	= Instance.new("ScreenGui")
	local Generall 		= Instance.new("TextLabel")
	local Phon			= Instance.new("Frame")
	local Name 			= Instance.new("TextLabel")
	local UICorner_2 	= Instance.new("UICorner")
	local Tabs 			= Instance.new("Frame")
	local UICorner_3 	= Instance.new("UICorner")
	local infovalue 	= Instance.new("StringValue")
	local UIPadding 	= Instance.new("UIPadding")
	local UIListLayout 	= Instance.new("UIListLayout")
	local Generall2 	= Instance.new("Frame")
	MakeCorner(Generall,0, 20)
	MakeCorner(Name,0, 20)
	MakeCorner(Tabs,0, 20)
	MakeCorner(Generall2,0, 20)
	MakeCorner(Phon,0, 20)
	MakeDraggable(Generall)
	
	if CoreGui:FindFirstChild(QUILibrary.Name) then
		CoreGui:FindFirstChild(QUILibrary.Name):Destroy()
	end
	
	QUILibrary.Name 			= "QUI.Library"
	QUILibrary.Parent 			= CoreGui
	QUILibrary.ZIndexBehavior 	= Enum.ZIndexBehavior.Sibling
	QUILibrary.ResetOnSpawn 	= false
	
	infovalue.Value 			= "By Qwar1e"
	infovalue.Name 				= "LibV1.0"
	infovalue.Parent			= QUILibrary
	
	Generall.Name 					= randomString()
	Generall.Parent 				= QUILibrary
	Generall.BackgroundColor3 		= Color3.fromRGB(0, 107, 156)
	Generall.BackgroundTransparency = 1
	Generall.BorderColor3 			= Color3.fromRGB(0, 0, 0)
	Generall.BorderSizePixel 		= 0
	Generall.Position 				= UDim2.new(0.426, 0,0.288, 0)
	Generall.Size 					= UDim2.new(0, 355,0, 21)
	Generall.ZIndex					= 5
	Generall.Text					= ""
	
	Phon.Name 					= randomString()
	Phon.Parent 				= Generall
	Phon.BackgroundColor3 		= Color3.fromRGB(0, 107, 156)
	Phon.BackgroundTransparency = 0
	Phon.BorderColor3 			= Color3.fromRGB(0, 0, 0)
	Phon.BorderSizePixel 		= 0
	Phon.Position 				= UDim2.new(-0.51, 0,-0.455, 0)
	Phon.Size 					= UDim2.new(0, 548,0, 303)
	Phon.ZIndex					= -1
	
	Generall2.Name 				= randomString()
	Generall2.Parent 			= Generall
	Generall2.BackgroundColor3 	= Color3.fromRGB(0, 92, 132)
	Generall2.BorderColor3 		= Color3.fromRGB(0, 0, 0)
	Generall2.BorderSizePixel 	= 0
	Generall2.Position 			= UDim2.new(-0.001, 0,1.295, 0)
	Generall2.Size 				= UDim2.new(0, 355,0, 256)
	Generall2.ZIndex			= 2

	Name.Name 					= randomString()
	Name.Parent 				= Generall
	Name.BackgroundColor3 		= Color3.fromRGB(0, 92, 132)
	Name.BorderColor3 			= Color3.fromRGB(0, 0, 0)
	Name.BorderSizePixel 		= 0
	Name.Position 				= UDim2.new(-0.002, 0,-0.046, 0)
	Name.Size 					= UDim2.new(0, 355,0, 21)
	Name.ZIndex 				= 2
	Name.Font 					= Enum.Font.SourceSans
	Name.Text 					= opt.Name
	Name.TextColor3 			= Color3.fromRGB(255, 255, 255)
	Name.TextSize 				= 16.000
	Name.ZIndex					= 3

	Tabs.Name 					= randomString()
	Tabs.Parent 				= Generall
	Tabs.BackgroundColor3 		= Color3.fromRGB(0, 92, 132)
	Tabs.BorderColor3 			= Color3.fromRGB(0, 0, 0)
	Tabs.BorderSizePixel 		= 0
	Tabs.Position 				= UDim2.new(-0.491, 0,-0.06, 0)
	Tabs.Size 					= UDim2.new(0, 168,0, 288)
	
	UIPadding.Parent 			= Tabs
	UIPadding.PaddingLeft 		= UDim.new(0, 8)
	UIPadding.PaddingTop 		= UDim.new(0, 10)
	UIPadding.Name				= randomString()

	UIListLayout.Parent 		= Tabs
	UIListLayout.SortOrder 		= Enum.SortOrder.LayoutOrder
	UIListLayout.Padding 		= UDim.new(0, 8)
	UIListLayout.Name			= randomString()
	local currenttab 			= nil
	
	function Elements:MakeTab(TabOptions)
		local TabsTable = {}
		
		local UIPadding_2		= Instance.new("UIPadding")
		local UIListLayout_2	= Instance.new("UIListLayout")
		
		local Tab 				= Instance.new("TextButton")
		Tab.Name 				= randomString()
		Tab.Parent 				= Tabs
		Tab.BackgroundColor3 	= Color3.fromRGB(0, 85, 121)
		Tab.BorderColor3 		= Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel 	= 0
		Tab.Position 			= UDim2.new(0.0476190485, 0, 0.03125, 0)
		Tab.Size 				= UDim2.new(0, 153, 0, 28)
		Tab.AutoButtonColor 	= false
		Tab.Font 				= Enum.Font.SourceSans
		Tab.Text 				= TabOptions.Text or "Tab"
		Tab.TextColor3 			= Color3.fromRGB(255, 255, 255)
		Tab.TextSize 			= 16.000
		
		local TabFrame 					= Instance.new("ScrollingFrame")
		TabFrame.Name 					= randomString()
		TabFrame.Parent 				= Generall2
		TabFrame.Active 				= true
		TabFrame.BackgroundColor3 		= Color3.fromRGB(255, 255, 255)
		TabFrame.BackgroundTransparency = 1.000
		TabFrame.BorderColor3 			= Color3.fromRGB(0, 0, 0)
		TabFrame.BorderSizePixel 		= 0
		TabFrame.Size 					= UDim2.new(0, 355, 0, 256)
		TabFrame.BottomImage 			= ""
		TabFrame.MidImage 				= ""
		TabFrame.TopImage 				= ""
		
		UIPadding_2.Parent 				= TabFrame
		UIPadding_2.PaddingLeft 		= UDim.new(0, 20)
		UIPadding_2.PaddingTop 			= UDim.new(0, 10)

		UIListLayout_2.Parent 			= TabFrame
		UIListLayout_2.SortOrder 		= Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding 			= UDim.new(0, 8)
		
		MakeCorner(Tab,0,20)
		MakeStroke({
			UI 			= Tab,
			Color 		= Color3.fromRGB(255,255,255),
			StrokeMode 	= Enum.ApplyStrokeMode.Border,
			Thickness	= 0.6
		})
		
		if currenttab == nil then
			currenttab = TabFrame
		end
		
		for _, ff in pairs(Generall2:GetChildren()) do
			if ff:IsA("ScrollingFrame") then
				ff.Visible = false
			end
		end
		
		currenttab.Visible = true
		
		Tab.MouseButton1Click:Connect(function()
			for _, ff in pairs(Generall2:GetChildren()) do
				if ff:IsA("ScrollingFrame") then
					ff.Visible = false
				end
			end
			TabFrame.Visible = true
		end)
		
		Tab.MouseEnter:Connect(function()
			TweenService:Create(Tab, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 110, 154)}):Play()
		end)
		
		Tab.MouseLeave:Connect(function()
			TweenService:Create(Tab, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 85, 121)}):Play()
		end)
		
		function TabsTable:MakeButton(ButtonOptions)
			local Buttons 			= {}
			ButtonOptions.callback 	= ButtonOptions.callback or function() end
			local Button 			= Instance.new("TextButton")
			Button.Name 			= randomString()
			Button.Parent 			= TabFrame
			Button.BackgroundColor3 = Color3.fromRGB(0, 85, 121)
			Button.BorderColor3 	= Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel 	= 0
			Button.Size 			= UDim2.new(0, 315, 0, 26)
			Button.AutoButtonColor 	= false
			Button.Font 			= Enum.Font.SourceSans
			Button.TextColor3 		= Color3.fromRGB(255, 255, 255)
			Button.TextSize 		= 16.000
			Button.Text 			= ButtonOptions.Name
			MakeCorner(Button,0,20)
			MakeStroke({
				UI 			= Button,
				Color 		= Color3.fromRGB(255,255,255),
				StrokeMode 	= Enum.ApplyStrokeMode.Border,
				Thickness	= 0.6
			})
			
			Button.MouseButton1Click:Connect(function()
				ButtonOptions.callback()
			end)
			
			Button.MouseEnter:Connect(function()
				TweenService:Create(Button, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 110, 154)}):Play()
			end)

			Button.MouseLeave:Connect(function()
				TweenService:Create(Button, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 85, 121)}):Play()
			end)
			
			return Buttons
		end
		
		function TabsTable:MakeToggle(ToggleOptions)
			local Toggles 				= {}
			local bool					= false
			ToggleOptions.callback 		= ToggleOptions.callback or function(bool) end
			local Toggle 				= Instance.new("TextButton")
			Toggle.Name 				= randomString()
			Toggle.Parent 				= TabFrame
			Toggle.BackgroundColor3 	= Color3.fromRGB(0, 85, 121)
			Toggle.BorderColor3 		= Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel 		= 0
			Toggle.Position 			= UDim2.new(0.0732394382, 0, 0.0237364769, 0)
			Toggle.Size 				= UDim2.new(0, 315, 0, 26)
			Toggle.AutoButtonColor 		= false
			Toggle.Font 				= Enum.Font.SourceSans
			Toggle.Text 				= ToggleOptions.Text
			Toggle.TextColor3 			= Color3.fromRGB(255, 255, 255)
			Toggle.TextSize 			= 16.000
			
			local Frame 				= Instance.new("Frame")
			Frame.Name					= randomString()
			Frame.Parent 				= Toggle
			Frame.BackgroundColor3 		= Color3.fromRGB(255, 0, 0)
			Frame.BorderColor3 			= Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel 		= 0
			Frame.Position 				= UDim2.new(0.917460322, 0, 0.115384616, 0)
			Frame.Size 					= UDim2.new(0, 20, 0, 20)

			MakeCorner(Frame,0,8)
			MakeCorner(Toggle,0,20)
			MakeStroke({
				UI 			= Toggle,
				Color 		= Color3.fromRGB(255,255,255),
				StrokeMode 	= Enum.ApplyStrokeMode.Border,
				Thickness	= 0.6
			})
			
			Toggle.MouseButton1Click:Connect(function()
				bool = not bool
				if bool then
					TweenService:Create(Frame, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
				else
					TweenService:Create(Frame, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
				end
				ToggleOptions.callback(bool)
			end)

			Toggle.MouseEnter:Connect(function()
				TweenService:Create(Toggle, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 110, 154)}):Play()
			end)

			Toggle.MouseLeave:Connect(function()
				TweenService:Create(Toggle, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 85, 121)}):Play()
			end)
			
			return Toggles
		end
		
		function TabsTable:MakeLabel(LabelOptions)
			local Labels = {}
			
			local Label = Instance.new("TextLabel", TabFrame)
			Label.Name				= randomString()
			Label.TextColor3 		= Color3.fromRGB(255,255,255)
			Label.BackgroundColor3	= Color3.fromRGB(0, 113, 158)
			Label.TextSize 			= 18
			Label.Size				= UDim2.new(0, 315,0, 26)
			Label.Text				= LabelOptions.Text
			Label.Font 				= Enum.Font.SourceSans
			
			MakeCorner(Label,0,20)
			MakeStroke({
				UI 			= Label,
				Color 		= Color3.fromRGB(255,255,255),
				StrokeMode 	= Enum.ApplyStrokeMode.Border,
				Thickness	= 0.6
			})
			
			return Labels
		end
		
		function TabsTable:MakeTextBox(TextBoxOptions)
			local TextBoxs = {}
			
			TextBoxOptions.callback = TextBoxOptions.callback or function(value) end
			
			local TextBox = Instance.new("TextBox")
			TextBox.Name				= randomString()
			TextBox.Parent 				= TabFrame
			TextBox.BackgroundColor3 	= Color3.fromRGB(0, 85, 121)
			TextBox.BorderColor3 		= Color3.fromRGB(0, 0, 0)
			TextBox.BorderSizePixel 	= 0
			TextBox.Position 			= UDim2.new(0, 0, 0.276422769, 0)
			TextBox.Size 				= UDim2.new(0, 315, 0, 26)
			TextBox.Font 				= Enum.Font.SourceSans
			TextBox.PlaceholderText 	= TextBoxOptions.PlaceholderText
			TextBox.PlaceholderColor3	= Color3.fromRGB(255,255,255)
			TextBox.Text 				= ""
			TextBox.TextColor3 			= Color3.fromRGB(255,255,255)
			TextBox.TextSize 			= 16.000

			MakeCorner(TextBox,0,20)
			MakeStroke({
				UI 			= TextBox,
				Color 		= Color3.fromRGB(255,255,255),
				StrokeMode 	= Enum.ApplyStrokeMode.Border,
				Thickness	= 0.6
			})
			
			TextBox.FocusLost:Connect(function()
				local Value = tostring(TextBox.Text)
				TextBoxOptions.callback(Value)
			end)
			
			return TextBoxs
		end
		

		function TabsTable:MakeSlider(SliderOptions)
			local Sliders = {}

			local value = SliderOptions.Min
			SliderOptions.callback = SliderOptions.callback or function() end

			local Slider 	= Instance.new("Frame")
			local Slide 	= Instance.new("Frame")
			local SlideName = Instance.new("TextLabel")

			Slider.Name = randomString()
			Slider.Parent = TabFrame
			Slider.BackgroundColor3 = Color3.fromRGB(0, 85, 121)
			Slider.Position = UDim2.new(0, 0, 0.414634138, 0)
			Slider.Size = UDim2.new(0, 315, 0, 26)
			Slider.ZIndex = 5

			Slide.Name = randomString()
			Slide.Parent = Slider
			Slide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Slide.BackgroundTransparency = 0.350
			Slide.Size = UDim2.new(0.063, 0, 0, 26)
			Slide.ZIndex = 5

			SlideName.Name = randomString()
			SlideName.Parent = Slider
			SlideName.BackgroundTransparency = 1.000
			SlideName.Size = UDim2.new(0, 315, 0, 26)
			SlideName.Text = SliderOptions.Text .. ": " .. SliderOptions.Min .. "/" .. SliderOptions.Max
			SlideName.TextColor3 = Color3.fromRGB(255, 255, 255)
			SlideName.TextSize = 12.000
			SlideName.ZIndex = 5

			MakeCorner(Slider,0,20)
			MakeCorner(Slide,0,20)
			MakeStroke({
				UI 			= Slider,
				Color 		= Color3.fromRGB(255,255,255),
				StrokeMode 	= Enum.ApplyStrokeMode.Border,
				Thickness	= 0.6
			})


			local function Round(Number, Factor)
				local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
				if Result < 0 then Result = Result + Factor end
				return Result
			end


			local Dragging1 = false

			Slider.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					Dragging1 = true
				end
			end)

			Slider.InputEnded:Connect(function(Input) 
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					Dragging1 = false
				end
			end)

			UserInputService.InputChanged:Connect(function(Input, GameProcessedEvent)
				if Dragging1 and Input.UserInputType == Enum.UserInputType.MouseMovement and GameProcessedEvent then
					local SizeScale = math.clamp((Input.Position.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1)
					Sliders:Set(SliderOptions.Min + ((SliderOptions.Max - SliderOptions.Min) * SizeScale))
				end
			end)
			
			UserInputService.InputChanged:Connect(function(Input, GameProcessedEvent)
				if Dragging1 and Input.UserInputType == Enum.UserInputType.Touch and GameProcessedEvent then
					local SizeScale = math.clamp((Input.Position.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1)
					Sliders:Set(SliderOptions.Min + ((SliderOptions.Max - SliderOptions.Min) * SizeScale))
				end
			end)


			function Sliders:Set(Value)
				self.Value = math.clamp(Round(Value, 1), SliderOptions.Min, SliderOptions.Max)
				TweenService:Create(Slide,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.fromScale((self.Value - SliderOptions.Min) / (SliderOptions.Max - SliderOptions.Min), 1)}):Play()
				SlideName.Text = SliderOptions.Text .. tostring(self.Value) .. "/" .. SliderOptions.Max
				SlideName.Text = SliderOptions.Text .. tostring(self.Value) .. "/" .. SliderOptions.Max
				if self.Value <= SliderOptions.Max then
					SliderOptions.callback(self.Value)
				end
			end

			return Sliders
		end
		
		return TabsTable
	end
	return Elements
end
return QUILibrary
