local NotificationTypes = {
    ["alert"] = {["Image"] = "rbxassetid://ImageIdAlert", ["Color"] = Color3.fromRGB(255, 0, 0)},
    ["analysis"] = {["Image"] = "rbxassetid://ImageIdAnalysis", ["Color"] = Color3.fromRGB(255, 165, 0)},
    ["success"] = {["Image"] = "rbxassetid://ImageIdSuccess", ["Color"] = Color3.fromRGB(0, 255, 0)},
    ["rgb"] = {["Image"] = "rbxassetid://ImageIdRgb", ["Color"] = "RGB"}
}

local function DoorsStyleNotification(options)
    local notifyType = options.type:lower()
    local title = options.Title or "Sem Título"
    local description = options.Description or "Sem Descrição"
    local duration = options.time or 5
    local typeData = NotificationTypes[notifyType]
    
    if not typeData then return end
    
    local image = typeData.Image
    local color = typeData.Color

    local function applyRGBEffect(uiElement)
        spawn(function()
            while uiElement and uiElement.Parent and color == "RGB" do
                for i = 0, 1, 0.01 do
                    uiElement.BackgroundColor3 = Color3.fromHSV(i, 1, 1)
                    wait(0.05)
                end
            end
        end)
    end
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local mainUI = playerGui:FindFirstChild("MainUI") or Instance.new("ScreenGui", playerGui)
    mainUI.Name = "MainUI"
    mainUI.ResetOnSpawn = false

    local notification = Instance.new("Frame", mainUI)
    notification.BackgroundTransparency = 0.2
    notification.Size = UDim2.new(0, 0, 0, 0)
    notification.Position = UDim2.new(1.1, 0, 0.8, 0)
    notification.AnchorPoint = Vector2.new(0.5, 0.5)
    notification.BackgroundColor3 = typeof(color) == "Color3" and color or Color3.new(1, 1, 1)
    notification.ClipsDescendants = true
    
    local icon = Instance.new("ImageLabel", notification)
    icon.Image = image
    icon.Size = UDim2.new(0, 60, 0, 60)
    icon.Position = UDim2.new(0, 10, 0.5, -30)
    icon.BackgroundTransparency = 1

    local titleLabel = Instance.new("TextLabel", notification)
    titleLabel.Text = title
    titleLabel.Position = UDim2.new(0, 80, 0, 10)
    titleLabel.Size = UDim2.new(1, -90, 0, 25)
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.BackgroundTransparency = 1

    local descLabel = Instance.new("TextLabel", notification)
    descLabel.Text = description
    descLabel.Position = UDim2.new(0, 80, 0, 40)
    descLabel.Size = UDim2.new(1, -90, 0, 25)
    descLabel.TextColor3 = Color3.new(1, 1, 1)
    descLabel.TextScaled = true
    descLabel.Font = Enum.Font.Gotham
    descLabel.BackgroundTransparency = 1

    if color == "RGB" then
        applyRGBEffect(notification)
    else
        notification.BackgroundColor3 = color
    end

    notification:TweenSizeAndPosition(
        UDim2.new(0, 400, 0, 100), 
        UDim2.new(0.5, -200, 0.75, 0),
        Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 1, true
    )

    game:GetService("Debris"):AddItem(notification, duration + 1)
    delay(duration, function()
        notification:TweenSizeAndPosition(
            UDim2.new(0, 0, 0, 0), 
            UDim2.new(1.1, 0, 0.8, 0),
            Enum.EasingDirection.In, Enum.EasingStyle.Quad, 1, true,
            function() notification:Destroy() end
        )
    end)
end
