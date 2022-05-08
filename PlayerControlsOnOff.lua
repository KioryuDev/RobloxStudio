local players = game:GetService("Players")
local player = players.LocalPlayer
local module = require(player:WaitForChild("PlayerScripts").PlayerModule)
local control = module:GetControls()

--control:Disable() -- 컨트롤 권한 끄기
--control:Enable() -- 컨트롤 권한 켜기
