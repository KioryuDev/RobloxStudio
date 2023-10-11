local players = game:GetService("Players")
local player = players.LocalPlayer
-- PlayerScripts 폴더의 PlayerModule 모듈 가져오기
local m_plr = require(player:WaitForChild("PlayerScripts").PlayerModule)
-- 플레이어 컨트롤러 가져오기
local c_plr = m_plr:GetControls()

local screenGui = script.Parent

-- 플레이어 캐릭터 생성을 기다림
repeat task.wait() until player.Character

local function On()
	c_plr:Enable() -- 플레이어 컨트롤 권한 켜기
	
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	
end

local function Off()
	c_plr:Disable() -- 플레이어 컨트롤 권한 끄기
	
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
end

local function InitEnableDisable()
	if screenGui.Enabled then
		Off()
	else
		On()
	end
end

screenGui:GetPropertyChangedSignal("Enabled"):Connect(function()
	InitEnableDisable()
end)
