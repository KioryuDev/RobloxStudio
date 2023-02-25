local lighting = game.Lighting

-- 현재 시간이 지정된 시간인지 체크 후 bool 반환
local function IsBetween(currHour, startHour, endHour)
	if startHour <= endHour then
		-- 끝나는 시간이 0시를 넘지 않는 경우
		-- [ex] 시작 18시, 끝 22시의 경우 : 18시부터 22시까지 true
		return currHour >= startHour and currHour <= endHour
	else
		-- 끝나는 시간이 0시를 넘는 경우
		-- [ex] 시작 18시, 끝 6시의 경우 : 18시부터 23시59분59초까지와 0시부터 6시까지 true
		return currHour >= startHour or currHour <= endHour
	end
end

local function on(self)
	if self.onFunc then
		self.onFunc()
	end
end

local function off(self)
	if self.offFunc then
		self.offFunc()
	end
end

local function update(self)
	local currHour = lighting.ClockTime
	if IsBetween(currHour, self.startHour, self.endHour) then
		on(self)
	else
		off(self)
	end
end

local function initialize(self)
	update(self)
	lighting:GetPropertyChangedSignal("ClockTime"):Connect(function()
		update(self)
	end)
end

local function constructor(self, startHour, endHour, onFunc, offFunc)
	self.startHour = startHour
	self.endHour = endHour
	self.onFunc = onFunc
	self.offFunc = offFunc
	initialize(self)
end

local ClockTimeTracker = {}
ClockTimeTracker.__index = ClockTimeTracker

function ClockTimeTracker.new(startHour, endHour, onFunc, offFunc)
	local self = setmetatable({}, ClockTimeTracker)
	constructor(self, startHour, endHour, onFunc, offFunc)
	return self
end

return ClockTimeTracker
