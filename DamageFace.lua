----
local originTexture = "rbxassetid://275614649"
local damageTexture = "rbxassetid://7293683132"
----

local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")

local currentHp = humanoid.Health

local inUse = false

local function ChangeFace(char)
	if inUse then return end
	inUse = true
	
	char.Head.face.Texture = damageTexture
	wait(1)
	char.Head.face.Texture = originTexture
	
	inUse = false
end

humanoid.HealthChanged:Connect(function(hp)
	if humanoid:GetState() == Enum.HumanoidStateType.Dead then return end
	
	local change = hp - currentHp
	print(change)
	if change < 0 and inUse == false then
		coroutine.resume(coroutine.create(ChangeFace), character)	
	end
	
	currentHp = hp
end)
