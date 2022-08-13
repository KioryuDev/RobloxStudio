local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

function TweenModelSize(model, duration, increment, easingStyle, easingDirection)
	local s = increment - 1
	local i = 0
	local oldAlpha = 0
	while i < 1 do
		local dt = RunService.Heartbeat:Wait()
		i = math.min(i + dt/duration, 1)
		local alpha = TweenService:GetValue(i, easingStyle, easingDirection)
		ResizeModel(model, (alpha*s + 1)/(oldAlpha*s + 1))
		oldAlpha = alpha
	end
end

function ResizeModel(model, a)
	local base = model.PrimaryPart.Position
	for _, part in pairs(model:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Position = base:Lerp(part.Position, a)
			part.Size *= a
		end
	end
end

TweenModelSize( !!!타켓 모델!!! , 1, 2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
