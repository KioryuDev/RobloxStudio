-- https://developer.roblox.com/en-us/articles/Disabling-Parts-of-Game-Interface

local StarterGui = game:GetService("StarterGui")
--StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
