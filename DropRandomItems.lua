----
local dropY = 4
----

local rs = game:GetService("ReplicatedStorage")
local itemsFolder = rs:WaitForChild("DropItems")
local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")

humanoid.Died:Connect(function()
	local items = itemsFolder:GetChildren()
	local item = items[math.random(1, #items)]:Clone()
	local dropPosition = character.PrimaryPart.Position + Vector3.new(0, dropY, 0)
	
	item.Position = dropPosition	
	item.Parent = workspace
end)
