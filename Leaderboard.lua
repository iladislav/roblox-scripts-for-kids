-- Leaderboard: shows "Coins" next to every player's name (top right corner)
-- and gives each player 1 coin every 10 seconds.
-- Put this Script in ServerScriptService.
-- More lessons: https://en.excklusiveit.com/roblox/

local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	-- The folder MUST be called "leaderstats" (small letters) for Roblox to show it
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = 0
	coins.Parent = leaderstats

	-- Give a coin every 10 seconds while the player is in the game
	while player.Parent do
		task.wait(10)
		coins.Value += 1
	end
end)
