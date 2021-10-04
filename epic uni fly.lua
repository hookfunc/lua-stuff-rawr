--[[
MADE BY IC3 BACKUP'D CAUSE NEW ONE DOESNT WORK ON EVERY GAME!!!!!!!!!!!!!!!!!!!!!!!!!!!!
https://v3rmillion.net/member.php?action=profile&uid=209
controls: 
double tap space to fly, flies towards your mouse relative to the camera, not directly at your mouse position like shitty fly scripts
control+f to disable or enable the keybind
control+scrollwheel forward - fly+
control+shift+scrollwheel forward - fly++
control+scrollwheel backward - fly-
control+shift+scrollwheel backward- fly--
--]]


if not bind then loadstring(
[[local binds = {}
local binds_first = {}
local forcebinds = {}
local uis = game:GetService'UserInputService';

function bind(key, func)
	binds[key] = func;
end
function bind_first(key, func)
	binds_first[key] = func;
end
function forcebind(key, func)
	forcebinds[key] = func;
end
function unbind(key)
	binds[key] = nil;
	binds_first[key] = nil;
end

uis.InputBegan:Connect(function(key)
	key = key.KeyCode.Name:lower();
	local inChat = uis:GetFocusedTextBox() and true or false;
	if not inChat then
		if binds_first[key] and typeof(binds_first[key]) == 'function' then
			binds_first[key]();
		end
	end
end)

uis.InputEnded:Connect(function(input)
	key = input.KeyCode.Name:lower();
	local inChat = uis:GetFocusedTextBox();
	if not inChat then
		if binds[key] and typeof(binds[key]) == 'function' and input.UserInputType.Name == 'Keyboard' then
			binds[key]();
		end
		if input.UserInputType.Name == 'MouseButton1' and binds.mouse1 ~= nil then
			binds.mouse1();
		end
		if input.UserInputType.Name == 'MouseButton2' and binds.mouse2 ~= nil then
			binds.mouse2();
		end
	else
		if forcebinds[key] and typeof(binds[key]) == 'function' then
			forcebinds[key]();
		end
	end
end)

getgenv().bind = bind;
getgenv().bind_first = bind_first;
getgenv().forcebind = forcebind;
getgenv().unbind = unbind;]])(); end
if not input then loadstring(
    [[local input = {}
local uis = game:service'UserInputService'

input.mouse = game:GetService'Players'.LocalPlayer:GetMouse();

input.down = setmetatable({}, {
	__index = function(i, v)
		local isDown = false;
		v = v:lower();
		for _, key in pairs(Enum.UserInputType:GetEnumItems()) do
			if (key.Name:lower() == v and uis:IsMouseButtonPressed(key.Name)) then
				isDown = true;
			end
		end
		for _, key in pairs(Enum.KeyCode:GetEnumItems()) do
			if (key.Name:lower() == v and uis:IsKeyDown(key.Name)) then
				isDown = true;
			end
		end
		return isDown
	end
})

getgenv().input = input; ]])(); end
    
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
