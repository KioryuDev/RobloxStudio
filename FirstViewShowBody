local runService = game:GetService("RunService")
local character = script.Parent

local head = character:WaitForChild("Head")

if not character.PrimaryPart then
	character:GetPropertyChangedSignal("PrimaryPart"):Wait()
end

runService.RenderStepped:Connect(function()
	if  character.PrimaryPart.LocalTransparencyModifier < 1 then return end
	for i, v in pairs(character:GetChildren()) do
		if (v:IsA("BasePart")) then
			v.LocalTransparencyModifier = 0;
		end
	end
	head.LocalTransparencyModifier = 1
	character.Humanoid.CameraOffset = Vector3.new(0,0,-1.125)
end)
