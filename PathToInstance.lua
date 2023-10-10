-- 출처 : https://devforum.roblox.com/t/get-instance-from-path/2423987

local fullPath = script:GetFullName()

-- 함수 선언: 문자열 경로(`path`)를 이용해 인스턴스를 반환하거나 `nil` 반환 가능
function PathToInstance(path: string): Instance?
	-- 문자열 경로를 `.`(점)을 기준으로 분할하여 배열 `names`에 저장
	local names = path:split(".")
	-- 경로의 첫 요소가 "game"이라면 제거 (일반적으로 생략 가능한 부분)
	if names[1] == "game" then table.remove(names, 1) end
	-- 경로가 비어있다면 함수 종료 후 `nil` 반환 (잘못된 입력 처리)
	if #names == 0 then return nil end
	-- 경로의 첫 요소가 "workspace"라면 "Workspace"로 변환
	if names[1] == "workspace" then names[1] = "Workspace" end
	-- `game:GetService` 호출 시도, 성공하면 서비스를 `inst` 변수에 저장, 실패하면 `nil`
	local success, inst = pcall(function()
		return game:GetService(names[1])
	end)
	
	if not success then 
		-- `game:GetService` 호출 실패 시 `game:FindFirstChild`로 자식 인스턴스 찾기 시도
		inst = game:FindFirstChild(names[1])
		-- 자식 인스턴스를 찾지 못하면 함수 종료 후 `nil` 반환
		if not inst then return nil end
	end 
	
	for i = 2, #names do
		-- 나머지 경로 요소에 대해 `inst:FindFirstChild` 함수로 찾아가기
		inst = inst:FindFirstChild(names[i])
		-- 인스턴스를 찾지 못하면 반복문 종료
		if inst == nil then break end
	end
	-- 최종적으로 찾은 인스턴스 `inst` 반환, 경로에 해당하는 인스턴스 또는 `nil`
	return inst 
end

local inst = PathToInstance(fullPath)
if inst then
	print(inst.Name, inst.ClassName, inst:GetFullName())
else
	print(nil)
end
