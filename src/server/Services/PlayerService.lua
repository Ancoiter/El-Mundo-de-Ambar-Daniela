--!strict

local Players = game:GetService("Players")

local PlayerService = {}

local function onPlayerAdded(player: Player)
	-- El perfil persistente se cargará aquí cuando se implemente el sistema de datos.
	print(("[PlayerService] %s entró al mundo."):format(player.Name))
end

local function onPlayerRemoving(player: Player)
	-- Guarda el perfil del jugador aquí antes de desconectarlo.
	print(("[PlayerService] %s salió del mundo."):format(player.Name))
end

function PlayerService.Start(playerReady: RemoteEvent)
	playerReady.OnServerEvent:Connect(function(player: Player)
		-- Este remoto no concede recompensas; solo confirma que el cliente terminó de iniciar.
		print(("[PlayerService] Cliente listo: %s"):format(player.Name))
	end)

	Players.PlayerAdded:Connect(onPlayerAdded)
	Players.PlayerRemoving:Connect(onPlayerRemoving)

	for _, player in Players:GetPlayers() do
		onPlayerAdded(player)
	end
end

return PlayerService
