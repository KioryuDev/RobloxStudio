-- 로블록스 채팅 서비스와 현재 스크립트의 부모(캐릭터)를 변수에 저장합니다.
local chatService = game.Chat
local char = script.Parent
local charHead = char:WaitForChild("Head")

-- 무한 루프를 시작합니다. 스크립트가 종료되지 않고 계속해서 실행됩니다.
while true do
    -- 3초 동안 대기합니다.
    wait(3)
    
    -- 로블록스 채팅 서비스를 사용하여 캐릭터의 머리 부분에 대화를 추가합니다.
    chatService:Chat(charHead, "응~")
    
    -- 다시 3초 동안 대기합니다.
    wait(3)
    
    -- 캐릭터의 머리 부분에 다른 대화를 추가합니다.
    chatService:Chat(charHead, "어쩔티미~ 저쩔티비~")
    
    -- 다시 3초 동안 대기합니다.
    wait(3)
    
    -- 캐릭터의 머리 부분에 다른 대화를 추가합니다.
    chatService:Chat(charHead, "안물티비~ 안궁티비~")
    
    -- 다시 3초 동안 대기합니다.
    wait(3)
    
    -- 캐릭터의 머리 부분에 다른 대화를 추가합니다.
    chatService:Chat(charHead, "뇌절티비~ 우짤래미~")	
end
