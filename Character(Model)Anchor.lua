local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

if not character.PrimaryPart then
	character:GetPropertyChangedSignal("PrimaryPart"):Wait()
end

character.PrimaryPart.Anchored = true 
