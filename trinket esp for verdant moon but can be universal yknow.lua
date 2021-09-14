function WTS(part) --https://v3rmillion.net/member.php?action=profile&uid=2340391 for this ur so cute owo
local screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
return Vector2.new(screen.x, screen.y)
end

function ESP(part, text, color)
local name = Drawing.new("Text")
name.Text = text
name.Color = color
name.Position = WTS(part)
name.Size = 20.0
name.Outline = true
name.Center = true
name.Visible = true

game:GetService("RunService").Stepped:connect(function()
pcall(function()
game:GetService("RunService").Heartbeat:wait()
local destroyed = not part:IsDescendantOf(workspace)
if destroyed and name ~= nil then
name:Remove()
end
if part ~= nil then
name.Position = WTS(part)
end
local _, screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
if screen then
name.Visible = true
else
name.Visible = false
end
end)
end)
end -- ^ https://v3rmillion.net/member.php?action=profile&uid=2340391 for this ur so cute owo ^ 

for i,v in pairs(workspace.AmbientAreas:GetDescendants()) do -- get every thing in ambientareas
    if v:IsA("Model") and v.Name == "Model" and v.Parent.Name == "TrinketSpawn" and v:FindFirstChild("ClickDetector") then -- see if its a model and basiclly if its a trinket
        ESP(v:FindFirstChild("Handle"), "Trinket", Color3.new(255/255,0/255,0/255)) -- colorblind (red) (still colorblind) -- set esp on it (who to set esp on, name, color)
            game:GetService("RunService").Heartbeat:wait() --loop
        end 
    end
