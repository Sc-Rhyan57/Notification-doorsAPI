local NotificationTypes = {
    ["alert"] = {["Image"] = "rbxassetid://ImageIdAlert", ["Color"] = Color3.fromRGB(255, 0, 0)},
    ["analysis"] = {["Image"] = "rbxassetid://ImageIdAnalysis", ["Color"] = Color3.fromRGB(255, 165, 0)},
    ["success"] = {["Image"] = "rbxassetid://ImageIdSuccess", ["Color"] = Color3.fromRGB(0, 255, 0)},
    ["rgb"] = {["Image"] = "rbxassetid://ImageIdRgb", ["Color"] = "RGB"}
}

local function DoorsEmblem(options)
    local notifyType = options.type:lower()
    local title = options.Title or "No Title"
    local description = options.Description or "No Text"
    local time = options.time or 5

    local typeData = NotificationTypes[notifyType]
    if not typeData then return end

    local image = typeData.Image
    local color = typeData.Color

    local function applyRGBColor(uiElement)
        if color == "RGB" then
            spawn(function()
                while uiElement and uiElement.Parent do
                    for i = 0, 1, 0.01 do
                        uiElement.BackgroundColor3 = Color3.fromHSV(i, 1, 1)
                        wait(0.05)
                    end
                end
            end)
        else
            uiElement.BackgroundColor3 = color
        end
    end

    local mainUI = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainUI", 2.5)
    if mainUI then
        local achievement = mainUI.AchievementsHolder.Achievement:Clone()
        achievement.Size = UDim2.new(0, 0, 0, 0)
        achievement.Frame.Position = UDim2.new(1.1, 0, 0, 0)
        achievement.Name = "LiveAchievement"
        achievement.Visible = true

        achievement.Frame.Details.Desc.Text = description
        achievement.Frame.Details.Title.Text = title
        achievement.Frame.ImageLabel.Image = image
        applyRGBColor(achievement.Frame)

        achievement.Parent = mainUI.AchievementsHolder
        achievement.Size = UDim2.new(0, 400, 0, 100)
        achievement.Frame:TweenPosition(UDim2.new(0.5, -200, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 1, true)
        game:GetService("Debris"):AddItem(achievement, time)
    end
end

local function NotifyEntity(entityName, notifyType)
    if EntityTable.NotifyReason[entityName] then
        local notificationData = EntityTable.NotifyReason[entityName]

        DoorsEmblem({
            type = notifyType,
            Title = notificationData.Title,
            Description = notificationData.Description,
            Image = "rbxassetid://" .. notificationData.Image,
            Time = 5
        })
    end
end
