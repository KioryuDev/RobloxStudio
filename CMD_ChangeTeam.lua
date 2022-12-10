local cmd = "/changeTeam "
game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		if string.sub(message, 1, #cmd) == cmd then
			local msg = string.sub(message, #cmd + 1):split(" ")
			local playerName = msg[1]
			local teamName = msg[2]
			
			local player = game.Players:FindFirstChild(playerName)
			if player then
				local team = game.Teams:FindFirstChild(teamName)
				if team then
					print(player, player:GetChildren())
					player.Team = team	
				else
					warn(teamName, ": 해당 Team이 없습니다.")
				end
			else
				warn(playerName, ": 해당 player가 없습니다.")
			end
		end
	end)
end)
