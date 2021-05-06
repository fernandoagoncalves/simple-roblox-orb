--[[
name: roblox-simple-orb
author: Aldanium/recursion/Fernando Goncalves
]]--

local orbsettings = {Size = Vector3.new(0.7, 0.7, 0.7), Color = Color3.new(1, 1, 1), FacingCamera = true, Distance = -5}
local rotation = 0 

local character = owner.Character
local rootPart = character['HumanoidRootPart']

local new = function(object, ...)
	local Object = Instance.new(object)
	for i,v in pairs(...) do
		Object[i] = v
	end
	return Object
end

local orb = new("Part", {
	Anchored = true,
	CanCollide = false,
	Material = "SmoothPlastic",
	Shape = Enum.PartType.Ball,
	Size = orbsettings.Size,
	Color = orbsettings.Color,
	Parent = script
})

local att0 = new("Attachment", {
	Parent = orb,
	Position = Vector3.new(0, 0, -0.3)
})

local att1 = new("Attachment", {
	Parent = orb,
	Position = Vector3.new(0, 0, 0.3)
})

local orbTrail = new("Trail", {
	Parent = orb,
	Attachment0 = att0,
	Attachment1 = att1,
	WidthScale = NumberSequence.new(1, 0),
	FaceCamera = orbsettings.FacingCamera,
	Lifetime = 1
})

game:GetService("RunService").Heartbeat:Connect(function()
	rotation = rotation + 1.5
	orb.CFrame = CFrame.new(rootPart.CFrame.p) * CFrame.Angles(math.sin(math.rad(rotation)), math.rad(rotation), math.cos(math.rad(rotation))) * CFrame.new(0, 0, orbsettings.Distance)
end)