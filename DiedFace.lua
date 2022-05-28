----

local diedFaceTexture = "rbxassetid://7163209709"

----

local players = game:GetService('Players')

players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
		humanoid.Died:Connect(function()
			
			character.Head.face.Texture = diedFaceTexture
			
		end)
	end)	
end)
