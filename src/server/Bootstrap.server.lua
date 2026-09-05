--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local RemoteNames = require(Shared.Networking.RemoteNames)
local PlayerService = require(script.Parent.Services.PlayerService)

local function createRemoteEvent(name: string): RemoteEvent
	local existing = ReplicatedStorage:FindFirstChild(name)
	if existing then
		assert(existing:IsA("RemoteEvent"), (`{name} debe ser un RemoteEvent.`))
		return existing
	end

	local remote = Instance.new("RemoteEvent")
	remote.Name = name
	remote.Parent = ReplicatedStorage
	return remote
end

local function initializeRemotes(): RemoteEvent
	local remotesFolder = ReplicatedStorage:FindFirstChild(RemoteNames.Folder)
	if not remotesFolder then
		remotesFolder = Instance.new("Folder")
		remotesFolder.Name = RemoteNames.Folder
		remotesFolder.Parent = ReplicatedStorage
	end

	local playerReady = createRemoteEvent(RemoteNames.PlayerReady)
	playerReady.Parent = remotesFolder
	return playerReady
end

local playerReady = initializeRemotes()
PlayerService.Start(playerReady)
