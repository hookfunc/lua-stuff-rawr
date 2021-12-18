-- U MUST BE LVL 10 
wait(3)
pcall(function()
local args = {
    [1] = "Super Takedown",
    [2] = workspace.Map.MiniQuests:FindFirstChild("Vulcan Defect")
}

game:GetService("ReplicatedStorage").Events.StartMiniQuest:FireServer(unpack(args))
wait(0.5)
local args = {
    [1] = {
        [1] = "dungeontime",
        [2] = workspace.Map.Dungeons:FindFirstChild("Steel Dungeon").Area
    }
}

game:GetService("ReplicatedStorage").Events.ME:FireServer(unpack(args))
end)
game:GetService("RunService").RenderStepped:Connect(function()
local AIPath = game.workspace.Bots.AI:GetDescendants()
for i,v in pairs(AIPath) do
    if v:IsA("MeshPart") and v.Name == "UpperTorso" then 
local args = {
    [1] = {
    [1] = "damage",
    [2] = v,
    [3] = Vector3.new(-11.271492958069, 79.86417388916, -520.60479736328),
    [4] = game:GetService("ReplicatedFirst").Moves.BAttack4,
    [5] = "Rush", -- Brawler  Beast  Rush
    [6] = 3.0183152380838
    }
}

game:GetService("ReplicatedStorage").Events.ME:FireServer(unpack(args))
end
end
end)
