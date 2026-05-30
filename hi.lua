game.StarterGui:SetCore("SendNotification", {
    Title = "HDZonetop",
    Text = "script này ngon không nếu không tao địt",
    Duration = 10,

    Button1 = "có",
    Button2 = "không",

    Callback = function(button)
        if button == "có" then
            setclipboard("tốt")
        elseif button == "không" then
        end
    end
})
