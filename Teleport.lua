-- Teleport Pad: step on this pad and appear on another one
-- 1) Make two Parts: name the first "PadA" and the second "PadB".
-- 2) Put this Script inside PadA.
-- More lessons: https://en.excklusiveit.com/roblox/

local padA = script.Parent
local padB = workspace:WaitForChild("PadB")
local COOLDOWN = 1 -- seconds, so players don't teleport again and again

local busy = {}

padA.Touched:Connect(function(otherPart)
	local character = otherPart.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart")
	if humanoid and root and not busy[character] then
		busy[character] = true
		-- appear 3 studs above PadB so we don't get stuck inside it
		root.CFrame = padB.CFrame + Vector3.new(0, 3, 0)
		task.wait(COOLDOWN)
		busy[character] = nil
	end
end)
