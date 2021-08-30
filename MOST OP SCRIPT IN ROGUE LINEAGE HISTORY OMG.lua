local players = game:GetService("Players")
GrabItemFolder = function()
                    for i, v in next, game.workspace:GetChildren() do
                        if v:FindFirstChild('UnionOperation') then
                            return v 
                        end
                    end
                end;

local ItemFolder = GrabItemFolder() -- why code look bad pls i wanna die

ItemFolder.ChildAdded:connect(function(child)
            if child.Transparency == 0 and Variables.AutoPickup.Enabled then 
                repeat wait() until child:FindFirstChildOfClass('ClickDetector') 
                local Click = child:FindFirstChildOfClass('ClickDetector')
                spawn(function()
                    repeat wait() until not child:FindFirstChildOfClass('ClickDetector') or player:DistanceFromCharacter(child.Position) <= Click.MaxActivationDistance or child.Transparency ~= 0 
                    if player:DistanceFromCharacter(child.Position) <= Click.MaxActivationDistance and child:FindFirstChildOfClass('ClickDetector') and child.Transparency == 0 then
                        fireclickdetector(Click)
                    end
                end)
            end 
        end)