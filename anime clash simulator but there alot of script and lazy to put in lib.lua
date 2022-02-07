game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(205.063461, 986.525391, 707.80957, -0.858550668, -7.76312703e-09, 0.512728751, 5.00438091e-08, 1, 9.89378321e-08, -0.512728751, 1.10602038e-07, -0.858550668)
--1st island
--205.063461, 986.525391, 707.80957, -0.858550668, -7.76312703e-09, 0.512728751, 5.00438091e-08, 1, 9.89378321e-08, -0.512728751, 1.10602038e-07, -0.858550668
--2nd island
--189.2173, 3043.43726, 684.914307, -0.433759958, -9.49056167e-10, -0.901028454, 1.42607937e-09, 1, -1.73982551e-09, 0.901028454, -2.03960471e-09, -0.433759958
--3 island
--208.098251, 6101.36133, 732.862122, 0.541672826, 3.84303505e-08, -0.840589404, 4.20264996e-08, 1, 7.28000629e-08, 0.840589404, -7.47608482e-08, 0.541672826
--4 island
--192.507248, 9541.90137, 748.966614, -0.305115074, -3.10117052e-08, 0.952315509, 7.61222978e-08, 1, 5.69535672e-08, -0.952315509, 8.98698289e-08, -0.305115074

--remove popup
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CurrencyPopUp:Destroy()

--auto sell 
while wait(1) do
for i,v in pairs(game:GetService("Workspace").Scriptable.Pads.SellPads:GetChildren()) do
   if v:FindFirstChild("TouchInterest") then
       firetouchinterest(v,game.Players.LocalPlayer.Character.HumanoidRootPart,0)
       wait(0.1)
       firetouchinterest(v,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
   end
end
end

--autofarm
while wait() do 
local args = {
    [1] = "Stats",
    [2] = "TrainStat",
    [3] = "Chakra"
}
game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end

--farm loop rings
while true do 
    wait(1)
for i,v in pairs(game:GetService("Workspace").Scriptable.CurrencyRings:GetDescendants()) do
   if v.Name == "Ring" and v:FindFirstChild("TouchInterest") then
       firetouchinterest(v,game.Players.LocalPlayer.Character.HumanoidRootPart,0)
       wait(0.1)
       firetouchinterest(v,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
   end
end
end
