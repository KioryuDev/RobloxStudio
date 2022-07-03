local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local mouse = player:GetMouse()

local RS = CFrame.new(1,0.5,0) * CFrame.Angles(0,1.55,0)
local LS = CFrame.new(-1,0.5,0) * CFrame.Angles(0,-1.55,0)
local H = char.Torso["Neck"].C0
local yOffset = char.Torso["Neck"].C0.Y

game:GetService("RunService").RenderStepped:Connect(function()
	local torso = char:FindFirstChild("Torso")
	if torso ~= nil then
		if char.Humanoid.Health ~= 0 then
			if char:FindFirstChildOfClass("Tool") then
				torso["Neck"].C0 = CFrame.new(0, yOffset, 0) * CFrame.Angles(3 * math.pi/2, 0, math.pi) * CFrame.Angles(math.asin((mouse.Origin.p - mouse.Hit.p).unit.y),0,0)
				torso["Right Shoulder"].C0 = CFrame.new(1,0.5,0) * CFrame.Angles(-math.asin((mouse.Origin.p - mouse.Hit.p).unit.y),1.55,0)
				torso["Left Shoulder"].C0 = CFrame.new(-1,0.5,0) * CFrame.Angles(-math.asin((mouse.Origin.p - mouse.Hit.p).unit.y),-1.55,0)
			else
				torso["Right Shoulder"].C0 = RS
				torso["Left Shoulder"].C0 = LS
				torso["Neck"].C0 = H
			end
		end	
	end
end)
