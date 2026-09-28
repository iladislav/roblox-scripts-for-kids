-- Kill Brick: resets any player who touches this part (lava, spikes, laser)
-- Put this Script inside a Part.
-- Tip: make the part red and set Material to Neon so players see the danger!
-- More lessons: https://en.excklusiveit.com/roblox/

local brick = script.Parent

local function onTouched(otherPart)
	-- The part that touched us belongs to a character (a model)
	local character = otherPart.Parent
	-- Characters have a Humanoid; ordinary parts don't
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.Health = 0 -- reset the player
	end
end

brick.Touched:Connect(onTouched)
