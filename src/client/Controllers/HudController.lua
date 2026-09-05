--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local GameConfig = require(Shared.Config.GameConfig)

local HudController = {}

function HudController.Start()
	local player = Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "WorldHud"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = playerGui

	local title = Instance.new("TextLabel")
	title.Name = "WelcomeLabel"
	title.AnchorPoint = Vector2.new(0.5, 0)
	title.Position = UDim2.fromScale(0.5, 0.05)
	title.Size = UDim2.fromOffset(460, 56)
	title.BackgroundTransparency = 1
	title.Font = Enum.Font.FredokaOne
	title.Text = GameConfig.WelcomeMessage
	title.TextColor3 = Color3.fromRGB(255, 221, 126)
	title.TextScaled = true
	title.TextStrokeTransparency = 0.5
	title.Parent = screenGui
end

return HudController
