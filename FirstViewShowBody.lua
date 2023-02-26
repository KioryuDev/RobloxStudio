local runService = game:GetService("RunService")
local character:Model = script.Parent

local offset = Vector3.new(0,0,-.5)

local head = character:WaitForChild("Head")

if not character.PrimaryPart then
	character:GetPropertyChangedSignal("PrimaryPart"):Wait()
end

runService.RenderStepped:Connect(function()
	local primaryPart = character.PrimaryPart
	if not primaryPart then return end
	if primaryPart.LocalTransparencyModifier < 1 then return end
	
	for i, v in pairs(character:GetChildren()) do
		if (v:IsA("BasePart")) then
			v.LocalTransparencyModifier = 0;
		end
	end
	
	head.LocalTransparencyModifier = 1
	character.Humanoid.CameraOffset = offset
end)
