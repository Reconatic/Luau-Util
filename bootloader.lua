local frame = Instance.new("Frame")
local uicorner = Instance.new("UICorner")
local imagelabel = Instance.new("ImageLabel")
local uigradient = Instance.new("UIGradient")
local textlabel = Instance.new("TextLabel")
local textbutton = Instance.new("TextButton")
local screengui = Instance.new("ScreenGui")
local uiratio = Instance.new("UIAspectRatioConstraint")

local img = "https://github.com/NotConqr/Luau-Util/blob/main/icon.png?raw=true"

local colorpreset = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 0)), -- Yellow at 0
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))    -- Red at 1
}

screengui.Parent = game.StarterGui and game.Players.LocalPlayer.PlayerGui
screengui.Name = "Util"
screengui.IgnoreGuiInset = true
screengui.ResetOnSpawn = false
frame.Parent = screengui
frame.Position = UDim2.new(0.346, 0,0.07, 0)
frame.Size = UDim2.new(0.308, 0,0.86, 0)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
uicorner.Parent = frame
uicorner.CornerRadius = UDim.new(0, 8)
uigradient.Parent = frame 
uigradient.Rotation = 45
uigradient.Color = colorpreset
textbutton.Parent = frame
textbutton.Position = UDim2.new(0.016, 0,0.868, 0)
textbutton.Size = UDim2.new(0.968, 0,0.118, 0)
textbutton.Text = "Start Unnamed Util"
textbutton.Font = Enum.Font.Ubuntu
textbutton.TextScaled = true
textbutton.BackgroundTransparency = 1
textbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
imagelabel.Parent = frame
imagelabel.Size = UDim2.new(0.191, 0,0.164, 0)
imagelabel.Image = img
imagelabel.BackgroundTransparency = 1
uiratio.Parent = frame
uiratio.AspectRatio = 0.859

textbutton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/NotConqr/Luau-Util/refs/heads/main/main.lua"))()
	screengui:Destroy()
end)

local function drag_element(element)
	local UIS = game:GetService('UserInputService')
	local frame = element
	local dragToggle = nil
	local dragSpeed = 0.01
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end

drag_element(frame)
