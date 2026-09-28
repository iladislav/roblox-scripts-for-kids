-- Coin Pickup: +1 coin on touch, then the coin respawns after 5 seconds
-- Needs Leaderboard.lua in ServerScriptService (it creates "Coins").
-- Put this Script inside a coin Part (yellow cylinder looks great!).
-- More lessons: https://en.excklusiveit.com/roblox/

local Players = game:GetService("Players")

local coin = script.Parent
local RESPAWN_TIME = 5
local collected = false

coin.Touched:Connect(function(otherPart)
	if collected then return end
	local player = Players:GetPlayerFromCharacter(otherPart.Parent)
	if not player then return end

	local stats = player:FindFirstChild("leaderstats")
	local coins = stats and stats:FindFirstChild("Coins")
	if coins then
		collected = true
		coins.Value += 1
		-- hide the coin
		coin.Transparency = 1
		coin.CanTouch = false
		task.wait(RESPAWN_TIME)
		-- bring it back
		coin.Transparency = 0
		coin.CanTouch = true
		collected = false
	end
end)
