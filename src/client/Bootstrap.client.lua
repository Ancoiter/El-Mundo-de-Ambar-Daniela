--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Client = script.Parent
local RemoteNames = require(ReplicatedStorage.Shared.Networking.RemoteNames)
local HudController = require(Client.Controllers.HudController)

local remotes = ReplicatedStorage:WaitForChild(RemoteNames.Folder)
local playerReady = remotes:WaitForChild(RemoteNames.PlayerReady)

HudController.Start()
(playerReady :: RemoteEvent):FireServer()
