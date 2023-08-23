local parent = script.Parent

parent.Touched:Connect(function(otherPart)
	local char = otherPart.Parent
	if game.Players:GetPlayerFromCharacter(char) then
		local huma = char:FindFirstChildOfClass("Humanoid")
		if huma and huma:GetState() ~= Enum.HumanoidStateType.Dead and #huma:GetAccessories() > 0 then
			huma:RemoveAccessories()
		end
	end 
end)
