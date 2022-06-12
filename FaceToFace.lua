-- server script
local rs = game:GetService("ReplicatedStorage")
local remote = rs:WaitForChild("Remote").CustomCharacter

local folder = script.Parent
local prompt = folder.Prompt.ProximityPrompt

local camera = folder.Camera

prompt.Triggered:Connect(function(player)
	remote:FireClient(player, camera)
end)

-- local script
local rs = game:GetService("ReplicatedStorage")
local remote = rs:WaitForChild("Remote").CustomCharacter

remote.OnClientEvent:Connect(function(camera)
	local character = game.Players.LocalPlayer.Character
	local head = character.Head
	
	--camera.Position = Vector3.new(camera.Position.x, head.Position.y, camera.Position.z)
	camera.Position = Vector3.new(camera.Position.x + 10, head.Position.y, camera.Position.z)
	
	camera.CFrame = CFrame.new(camera.Position, head.Position)
	
	camera.Parent = workspace
	
	character.PrimaryPart.CFrame = CFrame.new(character.PrimaryPart.Position, camera.Position)
	
	game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	game.Workspace.CurrentCamera.CFrame = camera.CFrame
end)
