local function MsdoorsNotify(title, description, reason, image, color, time)
    title = title or "Sem Título"
    description = description or "Sem Descrição"
    reason = reason or ""
    image = image or "rbxassetid://133997875469993"
    color = color or Color3.new(1, 1, 1)
    time = time or 5

    local mainUI = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainUI", 2.5)
    if mainUI then
        local achievement = mainUI.AchievementsHolder.Achievement:Clone()
        achievement.Size = UDim2.new(0, 0, 0, 0)
        achievement.Frame.Position = UDim2.new(1.1, 0, 0, 0)
        achievement.Name = "LiveAchievement"
        achievement.Visible = true

        achievement.Frame.TextLabel.Text = "Notification"
        achievement.Frame.Details.Title.Text = title
        achievement.Frame.Details.Desc.Text = description
        achievement.Frame.Details.Reason.Text = reason
        
        if image:match("rbxthumb://") or image:match("rbxassetid://") then
            achievement.Frame.ImageLabel.Image = image
        else
            achievement.Frame.ImageLabel.Image = "rbxassetid://" .. image
        end

        if color then
            achievement.Frame.TextLabel.TextColor3 = color
            achievement.Frame.UIStroke.Color = color
            achievement.Frame.Glow.ImageColor3 = color
        end

        achievement.Parent = mainUI.AchievementsHolder
        achievement.Sound.SoundId = "rbxassetid://10469938989"
        achievement.Sound.Volume = 1
        achievement.Sound:Play()

        task.spawn(function()
            achievement:TweenSize(UDim2.new(1, 0, 0.2, 0), "In", "Quad", 0.8, true)
            
            task.wait(0.8)
            
            achievement.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)
            
            game:GetService("TweenService"):Create(achievement.Frame.Glow, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                ImageTransparency = 1
            }):Play()
            
            task.wait(time)
            
            achievement.Frame:TweenPosition(UDim2.new(1.1, 0, 0, 0), "In", "Quad", 0.5, true)
            task.wait(0.5)
            achievement:TweenSize(UDim2.new(1, 0, -0.1, 0), "InOut", "Quad", 0.5, true)
            task.wait(0.5)
            achievement:Destroy()
        end)
    end
end

return MsdoorsNotify
