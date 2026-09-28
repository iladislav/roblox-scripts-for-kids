-- Moving Platform: slides back and forth forever
-- Put this Script inside an ANCHORED Part.
-- Change DISTANCE and TIME to make it harder or easier.
-- More lessons: https://en.excklusiveit.com/roblox/

local TweenService = game:GetService("TweenService")

local platform = script.Parent
local DISTANCE = 20 -- studs to move
local TIME = 3 -- seconds for one way

local startPosition = platform.Position
local endPosition = startPosition + Vector3.new(DISTANCE, 0, 0) -- move along X

local info = TweenInfo.new(
	TIME,
	Enum.EasingStyle.Sine, -- smooth start and stop
	Enum.EasingDirection.InOut,
	-1, -- repeat forever
	true -- go back after reaching the end
)

local tween = TweenService:Create(platform, info, { Position = endPosition })
tween:Play()
