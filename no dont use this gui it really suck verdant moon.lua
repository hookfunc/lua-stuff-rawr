local Config = {
    WindowName = "Vanilla drip #SHEEEEEEEEESH",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightBracket
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Verdant Moon") -- yeah gl i suck at doing something great with ui lib
local Tab2 = Window:CreateTab("UI Settings")

local Section2 = Tab1:CreateSection("Trinket")
local Section5 = Tab1:CreateSection("Character")

local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();

local Notify = AkaliNotif.Notify;

Notify({
Description = "wanted to add way more thing but got lazy";
Duration = 5;
});

--trinket stuff

local Button1 = Section2:CreateButton("Trinket ESP", function() -- couldve made it so colors change and stuff but lazy + game trash
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
    end) 

    local Button5456443415 = Section2:CreateButton("Trinket AutoPickup", function()
        Notify({
Description = "enjoy ur 5fps";
Duration = 5;
});
        while wait(1) do -- why (yes enjoy memory leaks iguess)
    for i,v in pairs(workspace.AmbientAreas:GetDescendants()) do -- get every thing in ambientareas
        if v:IsA("ClickDetector") and v.Name == "ClickDetector"  then -- see if its a clickdetector
                fireclickdetector(v, 10) -- click on them with a max range of 10
          end 
    end
  end
    end)





--char
local Button2 = Section5:CreateButton("Fly", function()
Notify({
Description = "Double space to fly, ctrl + shift + wheel up to fly faster, there still aa gun so touch ground sometime";
Title = "ic3 made it";
Duration = 5;
});-- ic3 made it yes backup cuz new version doent work sad
if not bind then loadstring(game:HttpGet'https://ic3w0lf.xyz/cloud/t/ABBVe6rcECIP1Aw04mm')(); end
if not input then loadstring(game:HttpGet'https://ic3w0lf.xyz/cloud/t/FKyC0IcUfeS1TR')(); end

local player = game:GetService'Players'.LocalPlayer;
local mouse = player:GetMouse();
local camera = workspace.CurrentCamera;
local runservice = game:GetService'RunService';
local uis = game:GetService'UserInputService';

local fly = true;
local flySpeed = 100;
local maxSpeed = 800;
local disp;

local gayGames = {
    3016661674; -- rogue lineage checks falling humanoid state lmao
};

for i, v in ipairs(gayGames) do
    gayGames[v] = true;
    gayGames[i] = false;
end

local gay = gayGames[game.PlaceId];

shared.sfls = script;

if Drawing then
    disp = shared.fdisp or Drawing.new'Text';
    disp.Text = 'FlySpeed: ' .. flySpeed;
    disp.Size = 18;
    disp.Center = false;
    disp.Outline = true;
    disp.Visible = true;
    disp.Color = Color3.new(1, 1, 1);
    disp.Position = Vector2.new(150, 7);

    shared.fdisp = disp;
end

function IsInZone(Object1, Object2, YCheck) -- broken 2 lazy 2 fix
    if (typeof(Object1) ~= 'Instance' and typeof(Object1) ~= 'table') or (typeof(Object2) ~= 'Instance' and typeof(Object2) ~= 'table') then return 'NIGGER'; end
    if YCheck ~= nil and typeof(YCheck) ~= 'boolean' then return end

    YCheck = (YCheck ~= nil and YCheck or false);

    local RYCheck = true;

    local Object = Object1;
    
    local Positive = (Object2.CFrame * CFrame.new(Object2.Size.X / 2, Object2.Size.Y / 2, Object2.Size.Z / 2));
    local Negative = (Object2.CFrame * CFrame.new(-Object2.Size.X / 2, -Object2.Size.Y / 2, -Object2.Size.Z / 2));

    if YCheck then
        RYCheck = (YCheck == true and
            (Object.Position.Y > Positive.Y) and
            (Object.Position.Y < Negative.Y));
    end

    -- print(1, (Object.Position.X < Positive.X), Object.Position.X, Positive.X)
    -- print(2, (Object.Position.X > Negative.X), Object.Position.X, Negative.X)
    -- print(3, (Object.Position.Z > Positive.Z), Object.Position.Z, Positive.Z)
    -- print(4, (Object.Position.Z < Negative.Z), Object.Position.Z, Negative.Z)
    -- print(5, RYCheck);

    return (Object.Position.X < Positive.X) and
        (Object.Position.X > Negative.X) and
        (Object.Position.Z > Positive.Z) and
        (Object.Position.Z < Negative.Z) and
        (RYCheck);
end

function GetIndex(Table, Value)
    for i, v in pairs(Table) do
        if v == Value then
            return i;
        end
    end

    return -1;
end

local PartIgnore = {};

function DisableClip(Part)
    if Part:IsA'BasePart' and Part.CanCollide then
        local Start = tick();
        local OldTransparency = Part.Transparency;
        
        table.insert(PartIgnore, Part);

        while tick() - Start < 300 and player.Character and player.Character:FindFirstChild'HumanoidRootPart' and not input.down.f4 do
            if tick() - Start > 1 and not IsInZone(player.Character.HumanoidRootPart, Part, true) and not IsInZone({Position = camera.CFrame.p}, Part, true) then
                break;
            end

            Part.CanCollide = false;
            if not gay then Part.Transparency = 0.75; end

            wait(1 / 8);
        end

        table.remove(PartIgnore, GetIndex(PartIgnore, Part));

        Part.Transparency = OldTransparency;
        Part.CanCollide = true;
    end
end

local lastDC = 0;

uis.InputChanged:Connect(function(Input)
    if script ~= shared.sfls then return; end

    if Input.UserInputType == Enum.UserInputType.MouseWheel then
        if input.down.leftcontrol then
            local inc = Input.Position.Z > 0 and 25 or -25;

            flySpeed = math.clamp(flySpeed + (inc * (input.down.leftshift and 2 or 1)), 0, maxSpeed);
            lastDC = tick();
        end
    end

    if disp then -- too lazy to make a loop or some bullshit to update this text so i just made it update .
        disp.Text = 'FlySpeed: ' .. flySpeed;
        disp.Position = Vector2.new(150, tick() - lastDC < 5 and 7 or -100);
    end
end);

bind('f', function()
    if input.down.leftcontrol then
        fly = not fly;
    end
end)

local lastSpace = 0;

bind_first('space', function()
    if fly and tick() - lastSpace < 0.3 and player.Character and player.Character:FindFirstChild'HumanoidRootPart' and player.Character:FindFirstChildOfClass'Humanoid' then
        local root = player.Character.HumanoidRootPart;
        local hum = player.Character:FindFirstChildOfClass'Humanoid';
        
        while input.down.space and fly do
            if not gay then hum.PlatformStand = true; end
            local start = mouse.Hit.p;
            local dir = (start - camera.CFrame.p);

            root.Velocity = dir.unit * (math.random((flySpeed - 1) * 1000, (flySpeed + 2.5) * 1000) / 1000); -- adds random speed so the velocity doesn't always measure to a certain amount (prevents detection)

            local ray = Ray.new(root.Position, dir.unit * 50);
            local hit, pos = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, camera, unpack(PartIgnore)});

            if hit and input.down.leftshift then
                spawn(function() DisableClip(hit); end);
            end

            runservice.RenderStepped:wait();
        end
        
        if not gay then
            hum.PlatformStand = false;
            root.Velocity = Vector3.new();
            hum:SetStateEnabled(0, false);
        end
    end

    lastSpace = tick();
end)
end) 

local Slider1 = Section5:CreateSlider("WalkSpeed", 16,50,nil,true, function(Value)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)
Slider1:SetValue(16)

local Button47 = Section5:CreateButton("NoFall", function()
    game:GetService("ReplicatedStorage").Events.fall:Destroy() -- shouldve namecall it 
end)
--idk what else to add but its enought for that awful game imo

--ui settings
-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)
