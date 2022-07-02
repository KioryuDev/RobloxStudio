-- 게임메인화면의 흐름을 관리

-- 유저 캐릭터 제어권 제거
local players = game.Players
local player = players.LocalPlayer

local playerScripts = player:WaitForChild("PlayerScripts")
local playerModule = require(playerScripts:WaitForChild("PlayerModule"))

local control = playerModule:GetControls()
control:Disable()

-- 캐릭터 카메라 -> 메인카메라로 
local cameraFolder = workspace:WaitForChild("mCamera")
local mc = cameraFolder.MainCamera

local currentCamera = workspace.CurrentCamera
local offset = CFrame.new(0,0,0) -- 1인칭

currentCamera.CameraType = Enum.CameraType.Scriptable
currentCamera.CameraSubject = mc
currentCamera.CFrame = mc.CFrame * offset

-- 다른 카메라로 바로 변경
wait(3)
local fc1 = cameraFolder.FaceCamera1
currentCamera.CameraSubject = fc1
currentCamera.CFrame = fc1.CFrame * offset

wait(3)
local fc2 = cameraFolder.FaceCamera2
currentCamera.CameraSubject = fc2
currentCamera.CFrame = fc2.CFrame * offset

wait(3)
local fc3 = cameraFolder.FaceCamera3
currentCamera.CameraSubject = fc3
currentCamera.CFrame = fc3.CFrame * offset

-- weenservice를 이용한 이동
wait(3)
currentCamera.CameraSubject = mc
currentCamera.CFrame = mc.CFrame * offset

wait(1)
local tweenService = game:GetService("TweenService")
local ts = tweenService:Create(currentCamera, TweenInfo.new(3), {CFrame = fc3.CFrame})
ts:Play()
ts.Completed:Wait()

wait(3)
local ts2 = tweenService:Create(currentCamera, TweenInfo.new(3), {CFrame = fc1.CFrame})
ts2:Play()
ts2.Completed:Wait()

wait(3)
local ts3 = tweenService:Create(currentCamera, TweenInfo.new(3), {CFrame = fc2.CFrame})
ts3:Play()
ts3.Completed:Wait()

wait(3)
local ts4 = tweenService:Create(currentCamera, TweenInfo.new(3), {CFrame = mc.CFrame})
ts4:Play()
ts4.Completed:Wait()
