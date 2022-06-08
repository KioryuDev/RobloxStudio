local debris = game:GetService("Debris")
local tween = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(.25)

function Damage(parent, damage)
	local gui = Instance.new("BillboardGui")
	gui.Name = "damageGui"
	gui.AlwaysOnTop = true
	gui.StudsOffsetWorldSpace = Vector3.new(0, 1, 0)

	local txt = Instance.new("TextLabel", gui)
	txt.Size = UDim2.new(1,0,1,0)
	txt.Font = Enum.Font.Code
	txt.BackgroundTransparency = 1
	txt.TextStrokeTransparency = 0
	txt.TextColor3 = Color3.new(1, 0, 0)
	txt.TextStrokeColor3 = Color3.new(1, 1, 1)
	txt.TextScaled = true
	txt.Text = damage

	gui.Parent = parent

	debris:AddItem(gui, .5)

	tween:Create(gui, tweenInfo, {Size = UDim2.new(1,0,.6,0)}):Play()
	wait(.25)
	tween:Create(txt, tweenInfo, {TextTransparency = 1}):Play()
	wait(.25)
end
