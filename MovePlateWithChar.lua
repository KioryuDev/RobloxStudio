local run = game:GetService('RunService')

local plr = game.Players.LocalPlayer
local char = script.Parent

local lastCFrame

local func
local func2

local KEY = "MovePlate"

func = run.Heartbeat:Connect(function()

	--------------------------------------------------------------- CHECK PLATFORM BELOW

	local RootPart = char.LowerTorso

	local Ignore = char

	local ray = Ray.new(RootPart.CFrame.p,Vector3.new(0,-50,0))

	local Hit, Position, Normal, Material = workspace:FindPartOnRay(ray,Ignore)
	
	if Hit and  Hit:GetAttribute(KEY) ~= nil and  Hit:GetAttribute(KEY) then -- Change "key" to whatever the moving part's name is
		--------------------------------------------------------------- MOVE PLAYER TO NEW POSITON FROM OLD POSITION

		local Train = Hit
		if lastCFrame == nil then -- If no LastTrainCFrame exists, make one!
			lastCFrame = Train.CFrame -- This is updated later.
		end
		local TrainCF = Train.CFrame 

		local Rel = TrainCF * lastCFrame:inverse()

		lastCFrame = Train.CFrame -- Updated here.

		RootPart.CFrame = Rel * RootPart.CFrame -- Set the player's CFrame
	else
		lastCFrame = nil -- Clear the value when the player gets off.
	end

	func2 = char.Humanoid.Died:Connect(function()
		func:Disconnect() -- Stop memory leaks
		func2:Disconnect() -- Stop memory leaks
	end)
end)
