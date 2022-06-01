----
local soundId = "rbxassetid://6670282148"
----

local parent = script.Parent
local sound = Instance.new("Sound", parent)

sound.SoundId = soundId
sound.Looped = true
sound.Volume = .5

-- https://developer.roblox.com/en-us/api-reference/property/Sound/RollOffMode
sound.RollOffMode = Enum.RollOffMode.Linear
sound.RollOffMaxDistance = 50
sound.RollOffMinDistance = 10

sound:play()
