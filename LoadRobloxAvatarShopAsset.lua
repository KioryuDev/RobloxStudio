local assetId = 8648380153

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		local model = game.InsertService:LoadAsset(assetId)
		local asset = model:GetChildren()[1]
		--asset.Parent = workspace
		char.Humanoid:AddAccessory(asset)		
	end)
end)
