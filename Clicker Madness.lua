local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Game Dominator","Ocean")
local ClickTab = Window:NewTab("AutoClick")
local Section = ClickTab:NewSection("AutoClick")
local MoveTab = Window:NewTab("Movement")
local MoveSection = MoveTab:NewSection("Movement")
local YieldTab = Window:NewTab("Yield")
local YieldSection = YieldTab:NewSection("Yield")
getgenv().going = false
getgenv().speed = 1

--Clicker
Section:NewButton("Simple Click", "Click One Time", function()
    click()
    wait()
end)
Section:NewToggle("Toggle AutoClick", "Toggle The AutoClicker", function(state)
    if state then
        getgenv().going = true
    else 
        getgenv().going = false
    end
end)

Section:NewSlider("ClickSpeed", "Change AutoClicker Speed", 100, 1, function(s) 
    getgenv().speed = s
end)

--MoveMent

MoveSection:NewSlider("MoveSpeed", "Change Movement Speed", 150, 16, function(s) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
MoveSection:NewSlider("JumpHeight", "Change Jump Heaight", 150, 50, function(s) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

YieldSection:NewButton("Infinite Yield", "Admin Commands", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'), true))()
end)
--Processing
spawn(function ()
    while true do
        if getgenv().going then
            click()
        end
        wait( 1 /getgenv().speed)
    end
end)

--Functions

function click()
    local args = {
        [1] = 1
    }
    game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.ClickService.Click:FireServer(unpack(args))
end