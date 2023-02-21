local SECOND = 1 -- 1초
local MINUTE = SECOND * 60 -- 60초 1분
local HOUR = MINUTE * 60 -- 3600초 1시간
local DAY = HOUR * 24 -- 86400초 하루

print("--- timestamp ---")
local utc = os.time()
local kst = os.time() + (HOUR * 9) -- 한국 UTC/GMT + 9

print("UTC/GMT : ", utc)
print("KST : ", kst)

print("--- timestamp2table ---")
local t_utc_00 = os.date("!*t")
--local t_utc_01 = os.date("!*t", utc) -- 위와 동일한 결과 값

local t_kst = os.date("!*t", kst)

-- [팁] !를 제거하면 os 로컬 타임에서 해당 초를 계산
-- 이에 한국이라면 로컬 타임 + 9시간이 되어버림
-- local t_kst = os.date("*t", kst) 

print("UTC/GMT(Table)_00 : ", t_utc_00)
--print("UTC/GMT(Table)_01 : ", t_utc_01)
print("KST(Table) : ", t_kst)

print("--- roblox 활용 ---")
local hours = t_kst.hour
local mins = t_kst.min
local secs = t_kst.sec

local timeString = hours..":"..mins..":"..secs
game.Lighting.TimeOfDay = timeString

print("game.Lighting.TimeOfDay : ", game.Lighting.TimeOfDay)
