-- 스크린GUI 구조 [ ScreenGui/Frame/TextLabel ]
-- 스크립트 위치 [ ScreenGui/AutoSizeTxtAndFrame ]

local root = script.Parent
local frame = root.Frame
local textLabel = frame.TextLabel

frame.AutomaticSize = Enum.AutomaticSize.Y -- X / Y / XY

textLabel.AutomaticSize = Enum.AutomaticSize.Y
textLabel.TextWrapped = true
textLabel.Font = Enum.Font.SciFi
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.TextYAlignment = Enum.TextYAlignment.Center

local txt = "안녕하세요."
	.. "\n오늘은 텍스트 양에 따라서 자동적으로 배경의 크기가 변경되는 부분에 대해서 알려드리겠습니다."
	.. "\n보이시나요 배경 이미지가 자동적으로 사이즈를 조절하는 이 웅장함!"

for i = 1, #txt do
	textLabel.Text = string.sub(txt, 1, i)
	wait(0.04)
end
