local parent = script.Parent

-- 부모 객체의 Touched 이벤트에 연결합니다.
parent.Touched:Connect(function(otherPart)
    -- 충돌한 다른 파트의 부모 객체를 가져옵니다.
    local char = otherPart.Parent
    
    -- 만약 충돌한 파트의 부모 객체가 플레이어의 캐릭터인 경우 실행합니다.
    if game.Players:GetPlayerFromCharacter(char) then
        -- 해당 캐릭터에서 Humanoid를 찾습니다.
        local huma = char:FindFirstChildOfClass("Humanoid")
        
        -- 만약 Humanoid가 존재하고, 상태가 사망 상태가 아니며 액세서리 개수가 1개 이상인 경우 실행합니다.
        if huma and huma:GetState() ~= Enum.HumanoidStateType.Dead and #huma:GetAccessories() > 0 then
            -- 모든 액세서리를 제거합니다.
            huma:RemoveAccessories()
        end
    end 
end)
