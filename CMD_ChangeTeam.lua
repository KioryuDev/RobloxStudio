local cmd = "/changeTeam "
local root = "kioryuDev"
game.Players.PlayerAdded:Connect(function(player)
	if player.Name == root then
	player.Chatted:Connect(function(message)
			if string.sub(message, 1, #cmd) == cmd then
				local msg = string.sub(message, #cmd + 1):split(" ")
				local targetPlayerName = msg[1]
				local teamName = msg[2]

				local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
				if targetPlayer then
					local team = game.Teams:FindFirstChild(teamName)
					if team then
						targetPlayer.Team = team	
					else
						warn(teamName, ": 해당 Team이 없습니다.")
					end
				else
					warn(targetPlayerName, ": 해당 player가 없습니다.")
				end
			end	
		
		end)
	end
end)
