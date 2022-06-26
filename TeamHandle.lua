local Teams = game:GetService("Teams")

local alphaTeam = Instance.new("Team", Teams)
alphaTeam.TeamColor = BrickColor.new("Bright red")
alphaTeam.AutoAssignable = false
alphaTeam.Name = "Alpha Team"

local betaTeam = Instance.new("Team", Teams)
betaTeam.TeamColor = BrickColor.new("Bright blue")
betaTeam.AutoAssignable = false
betaTeam.Name = "Beta Team"

local gammaTeam = Instance.new("Team", Teams)
gammaTeam.TeamColor = BrickColor.new("Brick yellow")
gammaTeam.AutoAssignable = false
gammaTeam.Name = "Gamma Team"  

------

local numberPlayer = 0

local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	numberPlayer += 1
	
	if numberPlayer == 1  then
		player.Team = alphaTeam
	elseif numberPlayer % 2 == 0 then
		player.Team = betaTeam
	else
		player.Team = gammaTeam
	end
	
end)

Players.PlayerRemoving:Connect(function(player)
	numberPlayer -= 1
end)
