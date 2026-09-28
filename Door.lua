-- Click Door: opens when clicked, closes again after 3 seconds
-- Put this Script inside an anchored Part (the door).
-- The script adds a ClickDetector automatically if there isn't one.
-- More lessons: https://en.excklusiveit.com/roblox/

local door = script.Parent
local OPEN_TIME = 3 -- seconds the door stays open

local clickDetector = door:FindFirstChildOfClass("ClickDetector") or Instance.new("ClickDetector", door)
local isOpen = false

local function open()
	if isOpen then return end -- already open, do nothing
	isOpen = true
	door.Transparency = 0.8 -- almost invisible
	door.CanCollide = false -- players can walk through
	task.wait(OPEN_TIME)
	door.Transparency = 0
	door.CanCollide = true
	isOpen = false
end

clickDetector.MouseClick:Connect(open)
