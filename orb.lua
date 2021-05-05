--[[
name: roblox-simple-orb
author: Aldanium/recursion/Fernando Goncalves
]]--

local orbsettings = {Size = Vector3.new(0.5, 0.5, 0.5), Color = Color3.new(1, 1, 1), FacingCamera = true, Distance = -5, beamEnabled = true}
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
	Parent = orb
})

local att1 = new("Attachment", {
	Parent = rootPart
})

game:GetService("RunService").Heartbeat:Connect(function()
	rotation = rotation + 1.5
	orb.CFrame = CFrame.new(rootPart.CFrame.p) * CFrame.Angles(math.sin(math.rad(rotation)), math.rad(rotation), math.cos(math.rad(rotation))) * CFrame.new(0, 0, orbsettings.Distance)
	
	if orbsettings.beamEnabled then
		local connector = new("Beam", {
			Parent = rootPart,
			Color = ColorSequence.new(orbsettings.Color),
			FaceCamera = orbsettings.FacingCamera,
			Transparency = NumberSequence.new(0, 0);
			Attachment0 = att0,
			Attachment1 = att1,
			Width0 = 0.05,
			Width1 = 0.05,
		})
	else
		-- ignore
	end
end)