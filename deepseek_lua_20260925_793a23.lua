-- Ninja Hub | Steal An Egg Auto Script v12 (Full - All Features)
-- Palofsc

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Camera = Workspace.CurrentCamera

local LP = Players.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()
local HRP = Char:WaitForChild("HumanoidRootPart")
local Hum = Char:WaitForChild("Humanoid")

LP.CharacterAdded:Connect(function(c)
    Char = c
    HRP = c:WaitForChild("HumanoidRootPart")
    Hum = c:WaitForChild("Humanoid")
    if Hum then Hum.WalkSpeed = CONFIG.Speed end
end)

-- ===== TỪ ĐIỂN DỊCH ANH -> VIỆT =====
local TRANSLATE = {
    ["steal"]="trộm",["egg"]="trứng",["hatch"]="ấp",["sell"]="bán",["buy"]="mua",
    ["pet"]="thú cưng",["pets"]="thú cưng",["treadmill"]="máy chạy bộ",["safe"]="an toàn",
    ["safezone"]="vùng an toàn",["zone"]="khu vực",["base"]="căn cứ",["home"]="nhà",
    ["shop"]="cửa hàng",["store"]="cửa hàng",["inventory"]="túi đồ",["backpack"]="ba lô",
    ["equip"]="trang bị",["unequip"]="tháo",["lock"]="khóa",["unlock"]="mở khóa",
    ["open"]="mở",["close"]="đóng",["start"]="bắt đầu",["stop"]="dừng",
    ["join"]="tham gia",["leave"]="rời",["enter"]="vào",["exit"]="thoát",
    ["play"]="chơi",["ready"]="sẵn sàng",["wait"]="chờ",["waiting"]="đang chờ",
    ["loading"]="đang tải",["complete"]="hoàn thành",["finish"]="kết thúc",
    ["reward"]="phần thưởng",["prize"]="giải thưởng",["gift"]="quà",
    ["coin"]="xu",["coins"]="xu",["money"]="tiền",["cash"]="tiền mặt",
    ["gem"]="đá quý",["gems"]="đá quý",["level"]="cấp độ",["exp"]="kinh nghiệm",
    ["rank"]="xếp hạng",["score"]="điểm",["points"]="điểm",["time"]="thời gian",
    ["timer"]="đồng hồ",["countdown"]="đếm ngược",["second"]="giây",["seconds"]="giây",
    ["minute"]="phút",["minutes"]="phút",["hour"]="giờ",["hours"]="giờ",
    ["common"]="phổ thông",["uncommon"]="ít gặp",["rare"]="hiếm",["epic"]="sử thi",
    ["legendary"]="huyền thoại",["mythic"]="thần thoại",["secret"]="bí mật",
    ["exclusive"]="độc quyền",["limited"]="giới hạn",["event"]="sự kiện",
    ["special"]="đặc biệt",["normal"]="thường",["basic"]="cơ bản",["premium"]="cao cấp",
    ["dog"]="chó",["cat"]="mèo",["dragon"]="rồng",["phoenix"]="phượng hoàng",
    ["griffin"]="sư tử đầu đại bàng",["unicorn"]="kỳ lân",["dinosaur"]="khủng long",
    ["tiger"]="hổ",["lion"]="sư tử",["wolf"]="sói",["fox"]="cáo",["bear"]="gấu",
    ["panda"]="gấu trúc",["rabbit"]="thỏ",["bunny"]="thỏ con",["mouse"]="chuột",
    ["monkey"]="khỉ",["elephant"]="voi",["giraffe"]="hươu cao cổ",["zebra"]="ngựa vằn",
    ["horse"]="ngựa",["cow"]="bò",["pig"]="heo",["chicken"]="gà",["duck"]="vịt",
    ["bird"]="chim",["eagle"]="đại bàng",["owl"]="cú mèo",["penguin"]="chim cánh cụt",
    ["shark"]="cá mập",["whale"]="cá voi",["dolphin"]="cá heo",["fish"]="cá",
    ["octopus"]="bạch tuộc",["crab"]="cua",["turtle"]="rùa",["frog"]="ếch",
    ["snake"]="rắn",["lizard"]="thằn lằn",["crocodile"]="cá sấu",
    ["monster"]="quái vật",["guard"]="người canh gác",["enemy"]="kẻ địch",
    ["red"]="đỏ",["blue"]="xanh dương",["green"]="xanh lá",["yellow"]="vàng",
    ["orange"]="cam",["purple"]="tím",["pink"]="hồng",["black"]="đen",
    ["white"]="trắng",["gray"]="xám",["grey"]="xám",["brown"]="nâu",
    ["gold"]="vàng kim",["golden"]="vàng kim",["silver"]="bạc",["rainbow"]="cầu vồng",
    ["neon"]="phát sáng",["glowing"]="phát sáng",["dark"]="tối",["light"]="sáng",
    ["attack"]="tấn công",["defend"]="phòng thủ",["dodge"]="né",["run"]="chạy",
    ["walk"]="đi bộ",["jump"]="nhảy",["fly"]="bay",["swim"]="bơi",
    ["climb"]="leo",["hide"]="ẩn",["seek"]="tìm",["chase"]="đuổi",
    ["escape"]="trốn thoát",["catch"]="bắt",["throw"]="ném",["hit"]="đánh",
    ["kill"]="giết",["die"]="chết",["respawn"]="hồi sinh",["heal"]="hồi máu",
    ["revive"]="hồi sinh",["on"]="bật",["off"]="tắt",["enabled"]="đã bật",
    ["disabled"]="đã tắt",["active"]="hoạt động",["inactive"]="không hoạt động",
    ["busy"]="đang bận",["free"]="rảnh",["full"]="đầy",["empty"]="trống",
    ["locked"]="đã khóa",["unlocked"]="đã mở",["auto"]="tự động",["farm"]="cày",
    ["grind"]="cày",["afk"]="treo máy",["bot"]="bot",["script"]="script",
    ["hub"]="hub",["gui"]="giao diện",["menu"]="menu",["button"]="nút",
    ["toggle"]="bật/tắt",["slider"]="thanh trượt",["dropdown"]="danh sách",
    ["textbox"]="ô nhập",["setting"]="cài đặt",["settings"]="cài đặt",
    ["option"]="tùy chọn",["options"]="tùy chọn",["config"]="cấu hình",
    ["save"]="lưu",["load"]="tải",["reset"]="đặt lại",["clear"]="xóa",
    ["delete"]="xóa",["add"]="thêm",["remove"]="bỏ",["edit"]="sửa",
    ["copy"]="sao chép",["paste"]="dán",["warning"]="cảnh báo",["error"]="lỗi",
    ["success"]="thành công",["failed"]="thất bại",["danger"]="nguy hiểm",
    ["caution"]="chú ý",["notice"]="thông báo",["info"]="thông tin",
    ["saving"]="đang lưu",["island"]="đảo",["sea"]="biển",["ocean"]="đại dương",
    ["forest"]="rừng",["desert"]="sa mạc",["cave"]="hang",["mountain"]="núi",
    ["volcano"]="núi lửa",["city"]="thành phố",["village"]="làng",["town"]="thị trấn",
    ["castle"]="lâu đài",["temple"]="đền",["ruins"]="tàn tích",["beach"]="bãi biển",
    ["sky"]="trời",["underwater"]="dưới nước",["space"]="vũ trụ",
    ["item"]="vật phẩm",["items"]="vật phẩm",["weapon"]="vũ khí",["sword"]="kiếm",
    ["gun"]="súng",["bow"]="cung",["arrow"]="mũi tên",["shield"]="khiên",
    ["armor"]="giáp",["helmet"]="mũ",["potion"]="thuốc",["food"]="thức ăn",
    ["drink"]="đồ uống",["key"]="chìa khóa",["chest"]="rương",["box"]="hộp",
    ["bag"]="túi",["crate"]="thùng",["barrel"]="thùng phuy",
    ["day"]="ngày",["night"]="đêm",["sun"]="mặt trời",["moon"]="mặt trăng",
    ["star"]="ngôi sao",["stars"]="các ngôi sao",["rain"]="mưa",["snow"]="tuyết",
    ["wind"]="gió",["storm"]="bão",["thunder"]="sấm",["lightning"]="chớp",
    ["player"]="người chơi",["players"]="người chơi",["server"]="máy chủ",
    ["map"]="bản đồ",["world"]="thế giới",["game"]="trò chơi",["boss"]="trùm",
    ["freeze"]="đóng băng",["slow"]="làm chậm",["speed"]="tốc độ",
    ["fast"]="nhanh",["anti"]="chống",["garden"]="khu vườn",["plot"]="ô đất",
    ["slot"]="ô",["place"]="đặt",["drop"]="thả",["deposit"]="gửi",
    ["collect"]="thu thập",["grab"]="lấy",["take"]="lấy",["put"]="đặt",
    ["teleport"]="dịch chuyển",["travel"]="di chuyển",["mode"]="chế độ",
    ["instant"]="tức thì",["smooth"]="mượt",["glide"]="lướt",
}

local function translateText(text)
    if not text or text == "" then return text end
    local result = text
    for en, vi in pairs(TRANSLATE) do
        result = string.gsub(result, "(%f[%a])" .. en .. "(%f[%A])", vi)
        local enCap = en:sub(1,1):upper() .. en:sub(2)
        local viCap = vi:sub(1,1):upper() .. vi:sub(2)
        result = string.gsub(result, "(%f[%a])" .. enCap .. "(%f[%A])", viCap)
        local enUp = en:upper()
        local viUp = vi:upper()
        result = string.gsub(result, "(%f[%a])" .. enUp .. "(%f[%A])", viUp)
    end
    return result
end

local function translateAllUI(root)
    if not root then return end
    for _, obj in pairs(root:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            if obj.Text and obj.Text ~= "" then obj.Text = translateText(obj.Text) end
        elseif obj:IsA("ProximityPrompt") then
            if obj.ActionText and obj.ActionText ~= "" then obj.ActionText = translateText(obj.ActionText) end
            if obj.ObjectText and obj.ObjectText ~= "" then obj.ObjectText = translateText(obj.ObjectText) end
        end
    end
end

local CONFIG_TRANSLATE = {
    AutoTranslateGame = false,
    TranslateGUI = true,
    TranslatePrompts = true,
}

local function translateGameUI()
    if not CONFIG_TRANSLATE.AutoTranslateGame then return end
    pcall(function()
        translateAllUI(LP:FindFirstChild("PlayerGui"))
        translateAllUI(CoreGui)
        translateAllUI(Workspace)
    end)
end

local function translateGamePrompts()
    if not CONFIG_TRANSLATE.TranslatePrompts then return end
    pcall(function()
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then
                if obj.ActionText and obj.ActionText ~= "" then obj.ActionText = translateText(obj.ActionText) end
                if obj.ObjectText and obj.ObjectText ~= "" then obj.ObjectText = translateText(obj.ObjectText) end
            end
        end
    end)
end

-- ===== THEME =====
local Theme = {
    Bg = Color3.fromRGB(22, 24, 30),
    Sidebar = Color3.fromRGB(16, 18, 24),
    Card = Color3.fromRGB(38, 40, 48),
    CardHover = Color3.fromRGB(50, 52, 60),
    Text = Color3.fromRGB(240, 240, 245),
    SubText = Color3.fromRGB(150, 155, 165),
    Accent = Color3.fromRGB(255, 60, 60),
    AccentDark = Color3.fromRGB(180, 30, 30),
    ToggleOn = Color3.fromRGB(255, 60, 60),
    ToggleOff = Color3.fromRGB(70, 72, 80),
    Danger = Color3.fromRGB(220, 70, 70),
    Success = Color3.fromRGB(70, 200, 120),
    Warning = Color3.fromRGB(230, 160, 60),
    Blue = Color3.fromRGB(60, 140, 255),
    Purple = Color3.fromRGB(170, 80, 255),
}

local RARITY = {
    Common = {Color = Color3.fromRGB(180, 180, 180), Value = 1},
    Uncommon = {Color = Color3.fromRGB(80, 200, 80), Value = 2},
    Rare = {Color = Color3.fromRGB(60, 140, 255), Value = 3},
    Epic = {Color = Color3.fromRGB(170, 80, 255), Value = 4},
    Legendary = {Color = Color3.fromRGB(255, 180, 40), Value = 5},
    Mythic = {Color = Color3.fromRGB(255, 60, 60), Value = 6},
    Secret = {Color = Color3.fromRGB(255, 255, 255), Value = 7},
}

local CONFIG = {
    AutoSteal = true, AutoHatch = true, AutoTreadmill = true, AutoEvent = true,
    AutoRobPlayer = true, Aimbot = true, AutoClick = true,
    ESPPet = true, ESPEgg = true, ESPPlayer = true, ESPMonster = true,
    Speed = 120, TreadmillDelay = 300, EventScanDelay = 5, RobScanDelay = 1,
    ClickDelay = 0.08, AimSmoothness = 0.3, RobMinRarity = "Rare",
    EggFolder = "Eggs", PetFolder = "Pets", SafeZoneName = "SafeZone",
    FilterRarity = "All", ToolName = nil,
    AntiMonster = true, AntiMode = "Freeze",
    MonsterDetectRange = 60, SpeedMargin = 50, MaxSpeed = 500,
    HatchSlotKeyword = "slot", HatchZoneKeyword = "garden",
    TravelMode = "Instant", GlideSpeed = 200, RunSpeed = 250,
    AutoReturnSafe = true,
}

local EVENT_KEYWORDS = {"event","boss","raid","dungeon","portal","meteor","ship","island","chest","reward","quest","mission","tournament","arena","wave","invasion","spawn"}
local PROMPT_KEYWORDS = {"start","join","enter","begin","activate","launch","summon","spawn","trigger","ready","play","accept","steal","take","grab","place","drop","put"}

-- ===== MAIN GUI =====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NinjaHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
ToggleBtn.BackgroundColor3 = Theme.Sidebar
ToggleBtn.Text = "忍"
ToggleBtn.TextColor3 = Theme.Accent
ToggleBtn.TextScaled = true
ToggleBtn.Font = Enum.Font.GothamBlack
ToggleBtn.Parent = ScreenGui
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 12)
local toggleStroke = Instance.new("UIStroke", ToggleBtn)
toggleStroke.Color = Theme.Accent
toggleStroke.Thickness = 2

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 540, 0, 360)
MainFrame.Position = UDim2.new(0.5, -270, 0.5, -180)
MainFrame.BackgroundColor3 = Theme.Bg
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local mainStroke = Instance.new("UIStroke", MainFrame)
mainStroke.Color = Color3.fromRGB(60, 62, 72)
mainStroke.Thickness = 1

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 34)
TitleBar.BackgroundColor3 = Theme.Sidebar
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 12)

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -80, 1, 0)
TitleText.Position = UDim2.new(0, 12, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Ninja Hub [ Trộm Trứng ] v12"
TitleText.TextColor3 = Theme.SubText
TitleText.TextSize = 13
TitleText.Font = Enum.Font.GothamMedium
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 24, 0, 24)
MinBtn.Position = UDim2.new(1, -60, 0, 5)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "—"
MinBtn.TextColor3 = Theme.SubText
MinBtn.TextSize = 16
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Parent = TitleBar
MinBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -32, 0, 5)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Theme.SubText
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TitleBar
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 130, 1, -34)
Sidebar.Position = UDim2.new(0, 0, 0, 34)
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local LogoFrame = Instance.new("Frame")
LogoFrame.Size = UDim2.new(1, -20, 0, 60)
LogoFrame.Position = UDim2.new(0, 10, 0, 10)
LogoFrame.BackgroundTransparency = 1
LogoFrame.Parent = Sidebar

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.new(1, 0, 1, 0)
Logo.BackgroundTransparency = 1
Logo.Text = "NINJA\nHUB"
Logo.TextColor3 = Theme.Accent
Logo.TextScaled = true
Logo.Font = Enum.Font.GothamBlack
Logo.Parent = LogoFrame

local SideLayout = Instance.new("UIListLayout")
SideLayout.Padding = UDim.new(0, 4)
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Parent = Sidebar

local SidePad = Instance.new("UIPadding")
SidePad.PaddingTop = UDim.new(0, 80)
SidePad.PaddingLeft = UDim.new(0, 8)
SidePad.PaddingRight = UDim.new(0, 8)
SidePad.Parent = Sidebar

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -130, 1, -34)
Content.Position = UDim2.new(0, 130, 0, 34)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local pages = {}
local currentPage = nil

local function switchPage(name)
    for n, p in pairs(pages) do p.Visible = (n == name) end
    currentPage = name
end

local function sideButton(text, order, pageName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = Theme.Sidebar
    btn.Text = "  " .. text
    btn.TextColor3 = Theme.SubText
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamMedium
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.LayoutOrder = order
    btn.Parent = Sidebar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 3, 0.6, 0)
    indicator.Position = UDim2.new(0, 0, 0.2, 0)
    indicator.BackgroundColor3 = Theme.Accent
    indicator.BorderSizePixel = 0
    indicator.Visible = false
    indicator.Parent = btn
    Instance.new("UICorner", indicator).CornerRadius = UDim.new(1, 0)

    btn.MouseEnter:Connect(function()
        if currentPage ~= pageName then btn.BackgroundColor3 = Theme.Card end
    end)
    btn.MouseLeave:Connect(function()
        if currentPage ~= pageName then btn.BackgroundColor3 = Theme.Sidebar end
    end)
    btn.MouseButton1Click:Connect(function()
        switchPage(pageName)
        for _, b in pairs(Sidebar:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundColor3 = Theme.Sidebar
                b.TextColor3 = Theme.SubText
                local ind = b:FindFirstChildOfClass("Frame")
                if ind then ind.Visible = false end
            end
        end
        btn.BackgroundColor3 = Theme.Card
        btn.TextColor3 = Theme.Text
        indicator.Visible = true
    end)
    return btn
end

local function createPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, -20, 1, -10)
    page.Position = UDim2.new(0, 10, 0, 5)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 4
    page.ScrollBarImageColor3 = Theme.Accent
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Visible = false
    page.Parent = Content
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page
    pages[name] = page
    return page
end

local function sectionTitle(parent, text, order)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 26)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Theme.Text
    lbl.TextSize = 15
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = order
    lbl.Parent = parent
end

local function toggleRow(parent, text, default, order, onChange)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 38)
    row.BackgroundColor3 = Theme.Card
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    row.Parent = parent
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -70, 1, 0)
    lbl.Position = UDim2.new(0, 14, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Theme.Text
    lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local switchBg = Instance.new("Frame")
    switchBg.Size = UDim2.new(0, 44, 0, 22)
    switchBg.Position = UDim2.new(1, -56, 0.5, -11)
    switchBg.BackgroundColor3 = default and Theme.ToggleOn or Theme.ToggleOff
    switchBg.BorderSizePixel = 0
    switchBg.Parent = row
    Instance.new("UICorner", switchBg).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.Position = default and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.Parent = switchBg
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local state = default
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = row
    btn.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(switchBg, TweenInfo.new(0.15), {
            BackgroundColor3 = state and Theme.ToggleOn or Theme.ToggleOff
        }):Play()
        TweenService:Create(knob, TweenInfo.new(0.15), {
            Position = state and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        }):Play()
        onChange(state)
    end)
end

local function buttonRow(parent, text, color, order, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = color or Theme.Card
    btn.Text = text
    btn.TextColor3 = Theme.Text
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamMedium
    btn.LayoutOrder = order
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Theme.CardHover}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = color or Theme.Card}):Play()
    end)
    btn.MouseButton1Click:Connect(callback)
end

-- ===== PAGES =====
local pageFarm = createPage("Farm")
local pageCombat = createPage("Combat")
local pageAnti = createPage("Anti")
local pageTravel = createPage("Travel")
local pageESP = createPage("ESP")
local pageFilter = createPage("Filter")
local pageTranslate = createPage("Translate")
local pageMisc = createPage("Misc")
local pageLog = createPage("Log")

sideButton("Cày", 1, "Farm")
sideButton("Chiến đấu", 2, "Combat")
sideButton("Chống quái", 3, "Anti")
sideButton("Di chuyển", 4, "Travel")
sideButton("ESP", 5, "ESP")
sideButton("Lọc trứng", 6, "Filter")
sideButton("Dịch", 7, "Translate")
sideButton("Khác", 8, "Misc")
sideButton("Log", 9, "Log")

-- PAGE FARM
do
    local o = 0
    sectionTitle(pageFarm, "Cài đặt cày", o); o = o + 1
    toggleRow(pageFarm, "Tự động trộm trứng", CONFIG.AutoSteal, o, function(s) CONFIG.AutoSteal = s; log("Tự trộm: "..tostring(s)) end); o = o + 1
    toggleRow(pageFarm, "Tự động ấp trứng", CONFIG.AutoHatch, o, function(s) CONFIG.AutoHatch = s end); o = o + 1
    toggleRow(pageFarm, "Tự động máy chạy bộ", CONFIG.AutoTreadmill, o, function(s) CONFIG.AutoTreadmill = s end); o = o + 1
    toggleRow(pageFarm, "Tự động sự kiện", CONFIG.AutoEvent, o, function(s) CONFIG.AutoEvent = s end); o = o + 1
    buttonRow(pageFarm, "Tìm vườn ấp", Theme.AccentDark, o, function()
        local garden = findHatchGarden()
        if garden then log("vườn: "..garden.Name) else log("không tìm thấy vườn") end
    end); o = o + 1
    buttonRow(pageFarm, "Ấp trứng ngay", Theme.Success, o, function() doHatch(); log("đang ấp...") end); o = o + 1
end

-- PAGE COMBAT
do
    local o = 0
    sectionTitle(pageCombat, "Cài đặt chiến đấu", o); o = o + 1
    toggleRow(pageCombat, "Tự động cướp người chơi", CONFIG.AutoRobPlayer, o, function(s) CONFIG.AutoRobPlayer = s end); o = o + 1
    toggleRow(pageCombat, "Tự động ngắm", CONFIG.Aimbot, o, function(s) CONFIG.Aimbot = s end); o = o + 1
    toggleRow(pageCombat, "Tự động click", CONFIG.AutoClick, o, function(s) CONFIG.AutoClick = s end); o = o + 1
    sectionTitle(pageCombat, "Tốc độ", o); o = o + 1
    buttonRow(pageCombat, "Tốc độ: 120", Theme.Card, o, function() CONFIG.Speed = 120; setSpeed(120); log("Tốc độ 120") end); o = o + 1
    buttonRow(pageCombat, "Tốc độ: 200", Theme.Card, o, function() CONFIG.Speed = 200; setSpeed(200); log("Tốc độ 200") end); o = o + 1
    buttonRow(pageCombat, "Tốc độ: 350", Theme.Card, o, function() CONFIG.Speed = 350; setSpeed(350); log("Tốc độ 350") end); o = o + 1
end

-- PAGE ANTI MONSTER
do
    local o = 0
    sectionTitle(pageAnti, "Chống quái vật đuổi", o); o = o + 1
    toggleRow(pageAnti, "Bật chống quái", CONFIG.AntiMonster, o, function(s) CONFIG.AntiMonster = s; log("Chống quái: "..tostring(s)) end); o = o + 1
    toggleRow(pageAnti, "ESP quái vật", CONFIG.ESPMonster, o, function(s) CONFIG.ESPMonster = s end); o = o + 1
    sectionTitle(pageAnti, "Chế độ chống", o); o = o + 1
    buttonRow(pageAnti, "Đóng băng quái", Theme.Blue, o, function() CONFIG.AntiMode = "Freeze"; log("Chế độ: Đóng băng") end); o = o + 1
    buttonRow(pageAnti, "Tăng tốc chạy", Color3.fromRGB(255, 180, 40), o, function() CONFIG.AntiMode = "Speed"; log("Chế độ: Tăng tốc") end); o = o + 1
    sectionTitle(pageAnti, "Phạm vi phát hiện", o); o = o + 1
    buttonRow(pageAnti, "Phạm vi: 40", Theme.Card, o, function() CONFIG.MonsterDetectRange = 40; log("Phạm vi 40") end); o = o + 1
    buttonRow(pageAnti, "Phạm vi: 60", Theme.Card, o, function() CONFIG.MonsterDetectRange = 60; log("Phạm vi 60") end); o = o + 1
    buttonRow(pageAnti, "Phạm vi: 100", Theme.Card, o, function() CONFIG.MonsterDetectRange = 100; log("Phạm vi 100") end); o = o + 1
    sectionTitle(pageAnti, "Hành động", o); o = o + 1
    buttonRow(pageAnti, "Đóng băng tất cả quái", Theme.Blue, o, function() freezeAllMonsters(); log("đã đóng băng quái") end); o = o + 1
    buttonRow(pageAnti, "Mở khóa tất cả quái", Theme.Danger, o, function() unfreezeAllMonsters(); log("đã mở khóa quái") end); o = o + 1
end

-- PAGE TRAVEL
do
    local o = 0
    sectionTitle(pageTravel, "Chế độ di chuyển tới vùng an toàn", o); o = o + 1
    toggleRow(pageTravel, "Tự động về an toàn khi cướp được", true, o, function(s) CONFIG.AutoReturnSafe = s end); o = o + 1
    sectionTitle(pageTravel, "Chọn chế độ", o); o = o + 1
    buttonRow(pageTravel, "Dịch chuyển tức thì (Instant)", Theme.Accent, o, function()
        CONFIG.TravelMode = "Instant"; log("Chế độ: Dịch chuyển tức thì")
    end); o = o + 1
    buttonRow(pageTravel, "Bay lướt (Glide)", Theme.Blue, o, function()
        CONFIG.TravelMode = "Glide"; log("Chế độ: Bay lướt")
    end); o = o + 1
    buttonRow(pageTravel, "Chạy nhanh (Run)", Theme.Success, o, function()
        CONFIG.TravelMode = "Run"; log("Chế độ: Chạy nhanh")
    end); o = o + 1
    sectionTitle(pageTravel, "Cấu hình tốc độ", o); o = o + 1
    buttonRow(pageTravel, "Bay lướt: 150", Theme.Card, o, function() CONFIG.GlideSpeed = 150; log("Bay lướt 150") end); o = o + 1
    buttonRow(pageTravel, "Bay lướt: 200", Theme.Card, o, function() CONFIG.GlideSpeed = 200; log("Bay lướt 200") end); o = o + 1
    buttonRow(pageTravel, "Bay lướt: 300", Theme.Card, o, function() CONFIG.GlideSpeed = 300; log("Bay lướt 300") end); o = o + 1
    buttonRow(pageTravel, "Chạy nhanh: 200", Theme.Card, o, function() CONFIG.RunSpeed = 200; log("Chạy 200") end); o = o + 1
    buttonRow(pageTravel, "Chạy nhanh: 300", Theme.Card, o, function() CONFIG.RunSpeed = 300; log("Chạy 300") end); o = o + 1
    buttonRow(pageTravel, "Chạy nhanh: 500", Theme.Card, o, function() CONFIG.RunSpeed = 500; log("Chạy 500") end); o = o + 1
    sectionTitle(pageTravel, "Hành động", o); o = o + 1
    buttonRow(pageTravel, "Về vùng an toàn ngay", Theme.Success, o, function() goToSafeZone(); log("đang về vùng an toàn") end); o = o + 1
    buttonRow(pageTravel, "Test chế độ hiện tại", Theme.Warning, o, function()
        log("Đang test chế độ: " .. CONFIG.TravelMode); goToSafeZone()
    end); o = o + 1
end

-- PAGE ESP
do
    local o = 0
    sectionTitle(pageESP, "Cài đặt ESP", o); o = o + 1
    toggleRow(pageESP, "ESP thú cưng", CONFIG.ESPPet, o, function(s) CONFIG.ESPPet = s end); o = o + 1
    toggleRow(pageESP, "ESP trứng", CONFIG.ESPEgg, o, function(s) CONFIG.ESPEgg = s end); o = o + 1
    toggleRow(pageESP, "ESP người chơi", CONFIG.ESPPlayer, o, function(s) CONFIG.ESPPlayer = s end); o = o + 1
    toggleRow(pageESP, "ESP quái vật", CONFIG.ESPMonster, o, function(s) CONFIG.ESPMonster = s end); o = o + 1
    buttonRow(pageESP, "Đặt lại ESP", Theme.Danger, o, function() clearESP(); log("đã đặt lại ESP") end); o = o + 1
end

-- PAGE FILTER
do
    local o = 0
    sectionTitle(pageFilter, "Lọc độ hiếm (trứng cần trộm)", o); o = o + 1
    buttonRow(pageFilter, "TẤT CẢ", Theme.AccentDark, o, function() CONFIG.FilterRarity = "All"; log("Lọc: Tất cả") end); o = o + 1
    for name, data in pairs(RARITY) do
        local viName = translateText(name)
        buttonRow(pageFilter, viName, data.Color, o, function() CONFIG.FilterRarity = name; log("Lọc: "..viName) end); o = o + 1
    end
    sectionTitle(pageFilter, "Mức tối thiểu để cướp", o); o = o + 1
    for name, data in pairs(RARITY) do
        local viName = translateText(name)
        buttonRow(pageFilter, viName, data.Color, o, function() CONFIG.RobMinRarity = name; log("Cướp từ: "..viName) end); o = o + 1
    end
end

-- PAGE TRANSLATE
do
    local o = 0
    sectionTitle(pageTranslate, "Dịch tiếng Anh -> Tiếng Việt", o); o = o + 1
    toggleRow(pageTranslate, "Dịch toàn bộ GUI game", CONFIG_TRANSLATE.AutoTranslateGame, o, function(s)
        CONFIG_TRANSLATE.AutoTranslateGame = s
        log("Dịch GUI game: "..tostring(s))
        if s then translateGameUI() end
    end); o = o + 1
    toggleRow(pageTranslate, "Dịch ProximityPrompt", CONFIG_TRANSLATE.TranslatePrompts, o, function(s)
        CONFIG_TRANSLATE.TranslatePrompts = s
        log("Dịch prompt: "..tostring(s))
    end); o = o + 1
    buttonRow(pageTranslate, "Dịch ngay GUI game", Theme.AccentDark, o, function() translateGameUI(); log("đã dịch GUI game") end); o = o + 1
    buttonRow(pageTranslate, "Dịch ngay Prompt", Theme.AccentDark, o, function() translateGamePrompts(); log("đã dịch prompt") end); o = o + 1
    buttonRow(pageTranslate, "Dịch tất cả", Theme.Success, o, function() translateGameUI(); translateGamePrompts(); log("đã dịch tất cả") end); o = o + 1
    buttonRow(pageTranslate, "Xem từ điển (log)", Theme.Warning, o, function()
        local count = 0
        for _ in pairs(TRANSLATE) do count = count + 1 end
        log("Từ điển có "..count.." từ")
    end); o = o + 1
end

-- PAGE MISC
do
    local o = 0
    sectionTitle(pageMisc, "Hành động", o); o = o + 1
    buttonRow(pageMisc, "Bay về vùng an toàn", Theme.Success, o, function() goToSafeZone(); log("đang về vùng an toàn") end); o = o + 1
    buttonRow(pageMisc, "Trộm ngay", Theme.Danger, o, function() stealEgg(); log("trộm thủ công") end); o = o + 1
    buttonRow(pageMisc, "Cướp ngay", Color3.fromRGB(200, 40, 130), o, function() autoRobPlayer(); log("cướp thủ công") end); o = o + 1
    buttonRow(pageMisc, "Bật tool đánh", Color3.fromRGB(100, 100, 200), o, function() equipTool(); log("đã bật tool đánh") end); o = o + 1
    buttonRow(pageMisc, "Bay tới vườn ấp", Color3.fromRGB(50, 180, 200), o, function()
        local g = findHatchGarden()
        if g then
            local pos = g:IsA("Model") and g.PrimaryPart and g.PrimaryPart.Position or g.Position
            if pos then travelTo(pos); log("đã tới vườn ấp") end
        else
            log("không tìm thấy vườn ấp")
        end
    end); o = o + 1
end

-- PAGE LOG
do
    sectionTitle(pageLog, "Log", 0)
    LogLabel = Instance.new("TextLabel")
    LogLabel.Size = UDim2.new(1, 0, 0, 100)
    LogLabel.BackgroundColor3 = Color3.fromRGB(18, 20, 25)
    LogLabel.Text = "Log: chờ..."
    LogLabel.TextColor3 = Theme.Success
    LogLabel.TextSize = 11
    LogLabel.TextWrapped = true
    LogLabel.TextYAlignment = Enum.TextYAlignment.Top
    LogLabel.Font = Enum.Font.Code
    LogLabel.LayoutOrder = 1
    LogLabel.Parent = pageLog
    Instance.new("UICorner", LogLabel).CornerRadius = UDim.new(0, 8)
    local pl = Instance.new("UIPadding", LogLabel)
    pl.PaddingTop = UDim.new(0, 6)
    pl.PaddingLeft = UDim.new(0, 8)
    pl.PaddingRight = UDim.new(0, 8)
end

switchPage("Farm")
for _, b in pairs(Sidebar:GetChildren()) do
    if b:IsA("TextButton") and b.LayoutOrder == 1 then
        b.BackgroundColor3 = Theme.Card
        b.TextColor3 = Theme.Text
        local ind = b:FindFirstChildOfClass("Frame")
        if ind then ind.Visible = true end
    end
end

function log(txt)
    if LogLabel then LogLabel.Text = "Log: " .. txt end
    print("[Ninja Hub] " .. txt)
end

-- ===== CORE LOGIC =====
function setSpeed(spd)
    if Hum and Hum.Parent then Hum.WalkSpeed = spd end
end

local function getChar()
    if LP.Character then
        Char = LP.Character
        HRP = Char:FindFirstChild("HumanoidRootPart") or HRP
        Hum = Char:FindFirstChild("Humanoid") or Hum
    end
    return Char, HRP, Hum
end

-- ===== TRAVEL SYSTEM =====
local function travelInstant(pos)
    getChar()
    if HRP and HRP.Parent then
        HRP.CFrame = CFrame.new(pos + Vector3.new(0, 5, 0))
        HRP.Velocity = Vector3.new(0, 0, 0)
    end
end

local function travelGlide(pos)
    getChar()
    if not HRP or not HRP.Parent then return end
    local startPos = HRP.Position
    local endPos = pos + Vector3.new(0, 5, 0)
    local distance = (endPos - startPos).Magnitude
    local speed = CONFIG.GlideSpeed
    local duration = distance / speed
    if duration <= 0 then duration = 0.1 end
    if duration > 3 then duration = 3 end

    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = (endPos - startPos).Unit * speed
    bv.Parent = HRP

    local elapsed = 0
    local conn
    conn = RunService.Heartbeat:Connect(function(dt)
        elapsed = elapsed + dt
        if not HRP or not HRP.Parent then
            if bv then bv:Destroy() end
            if conn then conn:Disconnect() end
            return
        end
        local currentDist = (HRP.Position - endPos).Magnitude
        if currentDist < 5 or elapsed >= duration then
            if bv then bv:Destroy() end
            if conn then conn:Disconnect() end
            HRP.CFrame = CFrame.new(endPos)
        end
    end)
    task.wait(duration + 0.1)
    if bv then bv:Destroy() end
    if conn then conn:Disconnect() end
end

local function travelRun(pos)
    getChar()
    if not HRP or not HRP.Parent or not Hum then return end
    local oldSpeed = Hum.WalkSpeed
    Hum.WalkSpeed = CONFIG.RunSpeed

    local timeout = 5
    local elapsed = 0
    Hum:MoveTo(pos)
    while elapsed < timeout do
        if not HRP or not HRP.Parent then break end
        local dist = (HRP.Position - pos).Magnitude
        if dist < 8 then break end
        Hum:MoveTo(pos)
        task.wait(0.1)
        elapsed = elapsed + 0.1
    end
    Hum.WalkSpeed = oldSpeed
end

function travelTo(pos)
    if not pos then return end
    if CONFIG.TravelMode == "Instant" then
        travelInstant(pos)
    elseif CONFIG.TravelMode == "Glide" then
        travelGlide(pos)
    elseif CONFIG.TravelMode == "Run" then
        travelRun(pos)
    else
        travelInstant(pos)
    end
end

function teleport(pos)
    travelInstant(pos)
end

function goToSafeZone()
    local safe = findSafeZone()
    if not safe then
        log("không tìm thấy vùng an toàn")
        return
    end
    travelTo(safe)
    task.wait(0.3)
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    log("đã về vùng an toàn (" .. CONFIG.TravelMode .. ")")
end

function getRarity(name)
    local lower = string.lower(name)
    for rName, _ in pairs(RARITY) do
        if string.find(lower, string.lower(rName)) then return rName end
    end
    if string.find(lower, "secret") then return "Secret" end
    if string.find(lower, "mythic") then return "Mythic" end
    if string.find(lower, "legend") then return "Legendary" end
    if string.find(lower, "epic") then return "Epic" end
    if string.find(lower, "rare") then return "Rare" end
    if string.find(lower, "uncommon") then return "Uncommon" end
    return "Common"
end

function matchFilter(name)
    if CONFIG.FilterRarity == "All" then return true end
    return getRarity(name) == CONFIG.FilterRarity
end

function isHighValue(name)
    local r = getRarity(name)
    return (RARITY[r] and RARITY[r].Value or 0) >= (RARITY[CONFIG.RobMinRarity] and RARITY[CONFIG.RobMinRarity].Value or 3)
end

function equipTool()
    getChar()
    if not Char then return end
    local tool = nil
    if CONFIG.ToolName then
        tool = Char:FindFirstChild(CONFIG.ToolName) or LP.Backpack:FindFirstChild(CONFIG.ToolName)
    else
        for _, t in pairs(LP.Backpack:GetChildren()) do
            if t:IsA("Tool") then tool = t; break end
        end
        if not tool then
            for _, t in pairs(Char:GetChildren()) do
                if t:IsA("Tool") then tool = t; break end
            end
        end
    end
    if tool and tool.Parent ~= Char then
        Hum:EquipTool(tool)
    end
    return tool
end

local espCache = {}

function createESP(obj, label, color, part)
    if espCache[obj] then
        local gui = espCache[obj]
        if gui and gui.Parent then
            local txt = gui:FindFirstChildOfClass("TextLabel")
            if txt then txt.Text = label; txt.TextColor3 = color end
        end
        return
    end
    local target = part or (obj:IsA("Model") and obj.PrimaryPart) or (obj:IsA("BasePart") and obj)
    if not target then return end
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 200, 0, 40)
    billboard.AlwaysOnTop = true
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.Parent = target
    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.BackgroundTransparency = 1
    txt.Text = label
    txt.TextColor3 = color
    txt.TextStrokeTransparency = 0
    txt.TextScaled = true
    txt.Font = Enum.Font.GothamBold
    txt.Parent = billboard
    espCache[obj] = billboard
end

function clearESP()
    for obj, gui in pairs(espCache) do
        if gui and gui.Parent then gui:Destroy() end
    end
    espCache = {}
end

function getCarriedEgg(character)
    if not character then return nil end
    for _, d in pairs(character:GetDescendants()) do
        if (d:IsA("Model") or d:IsA("BasePart")) and string.find(string.lower(d.Name), "egg") then
            return d
        end
    end
    return nil
end

-- ===== ANTI MONSTER =====
local frozenMonsters = {}
local originalSpeeds = {}

local function isMonster(obj)
    if not obj:IsA("Model") then return false end
    local humanoid = obj:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr.Character == obj then return false end
    end
    return true
end

local function getAllMonsters()
    local list = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if isMonster(obj) then table.insert(list, obj) end
    end
    return list
end

local function freezeMonster(monster)
    if frozenMonsters[monster] then return end
    local humanoid = monster:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    originalSpeeds[monster] = humanoid.WalkSpeed
    pcall(function()
        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
        humanoid.JumpHeight = 0
        humanoid.AutoRotate = false
        humanoid.PlatformStand = true
    end)
    local hrp = monster:FindFirstChild("HumanoidRootPart")
    if hrp then pcall(function() hrp.Anchored = true end) end
    for _, part in pairs(monster:GetDescendants()) do
        if part:IsA("BasePart") then pcall(function() part.Anchored = true end) end
    end
    frozenMonsters[monster] = true
end

local function unfreezeMonster(monster)
    if not frozenMonsters[monster] then return end
    local humanoid = monster:FindFirstChildOfClass("Humanoid")
    if humanoid then
        pcall(function()
            humanoid.WalkSpeed = originalSpeeds[monster] or 16
            humanoid.JumpPower = 50
            humanoid.JumpHeight = 7.2
            humanoid.AutoRotate = true
            humanoid.PlatformStand = false
        end)
    end
    for _, part in pairs(monster:GetDescendants()) do
        if part:IsA("BasePart") then pcall(function() part.Anchored = false end) end
    end
    frozenMonsters[monster] = nil
    originalSpeeds[monster] = nil
end

function freezeAllMonsters()
    for _, m in ipairs(getAllMonsters()) do freezeMonster(m) end
end

function unfreezeAllMonsters()
    for m, _ in pairs(frozenMonsters) do
        if m and m.Parent then unfreezeMonster(m) end
    end
    frozenMonsters = {}
    originalSpeeds = {}
end

local function getNearestMonsterSpeed()
    getChar()
    if not HRP then return 16 end
    local maxSpeed = 16
    for _, m in ipairs(getAllMonsters()) do
        local hrp = m:FindFirstChild("HumanoidRootPart")
        local humanoid = m:FindFirstChildOfClass("Humanoid")
        if hrp and humanoid then
            local dist = (HRP.Position - hrp.Position).Magnitude
            if dist <= CONFIG.MonsterDetectRange then
                if humanoid.WalkSpeed > maxSpeed then maxSpeed = humanoid.WalkSpeed end
            end
        end
    end
    return maxSpeed
end

function antiMonsterLoop()
    if not CONFIG.AntiMonster then return end
    getChar()
    if not Hum then return end
    if CONFIG.AntiMode == "Freeze" then
        for _, m in ipairs(getAllMonsters()) do
            local hrp = m:FindFirstChild("HumanoidRootPart")
            if hrp then
                local dist = (HRP.Position - hrp.Position).Magnitude
                if dist <= CONFIG.MonsterDetectRange then freezeMonster(m) end
            end
        end
    elseif CONFIG.AntiMode == "Speed" then
        local monsterSpeed = getNearestMonsterSpeed()
        local targetSpeed = monsterSpeed + CONFIG.SpeedMargin
        if targetSpeed > CONFIG.MaxSpeed then targetSpeed = CONFIG.MaxSpeed end
        if Hum.WalkSpeed < targetSpeed then Hum.WalkSpeed = targetSpeed end
    end
end

-- ===== TÌM VƯỜN ẤP =====
local function findHatchGarden()
    local keywordList = {"garden","plot","farm","hatch","incubator","nest","pen","yard"}
    local bestObj, bestScore = nil, 0
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") or obj:IsA("Folder") then
            local lower = string.lower(obj.Name)
            local match = false
            for _, kw in ipairs(keywordList) do
                if string.find(lower, kw) then match = true; break end
            end
            if match then
                local slotCount = 0
                for _, d in pairs(obj:GetDescendants()) do
                    local dl = string.lower(d.Name)
                    if string.find(dl, "slot") or string.find(dl, "nest") or string.find(dl, "spot") or string.find(dl, "pad") then slotCount = slotCount + 1 end
                    if d:IsA("ProximityPrompt") then
                        local at = string.lower(d.ActionText)
                        if string.find(at, "hatch") or string.find(at, "place") or string.find(at, "put") or string.find(at, "drop") then slotCount = slotCount + 2 end
                    end
                end
                if slotCount > bestScore then bestScore = slotCount; bestObj = obj end
            end
        end
    end
    if not bestObj then
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then
                local at = string.lower(obj.ActionText)
                if string.find(at, "hatch") or string.find(at, "place egg") or string.find(at, "put egg") then
                    return obj.Parent
                end
            end
        end
    end
    return bestObj
end

local function findEmptyHatchSlot(garden)
    if not garden then return nil end
    local candidates = {}
    for _, d in pairs(garden:GetDescendants()) do
        local dl = string.lower(d.Name)
        if string.find(dl, "slot") or string.find(dl, "nest") or string.find(dl, "spot") or string.find(dl, "pad") or string.find(dl, "empty") then
            local hasEgg = false
            for _, c in pairs(d:GetDescendants()) do
                if string.find(string.lower(c.Name), "egg") then hasEgg = true; break end
            end
            if not hasEgg then
                local pos = d:IsA("Model") and d.PrimaryPart and d.PrimaryPart.Position or (d:IsA("BasePart") and d.Position)
                if pos then table.insert(candidates, {obj = d, pos = pos}) end
            end
        end
    end
    for _, d in pairs(garden:GetDescendants()) do
        if d:IsA("ProximityPrompt") then
            local at = string.lower(d.ActionText)
            if string.find(at, "hatch") or string.find(at, "place") or string.find(at, "put") or string.find(at, "drop") then
                local parent = d.Parent
                local pos = parent:IsA("Model") and parent.PrimaryPart and parent.PrimaryPart.Position or (parent:IsA("BasePart") and parent.Position)
                if pos then table.insert(candidates, {obj = parent, pos = pos, prompt = d}) end
            end
        end
    end
    if #candidates == 0 then
        for _, d in pairs(garden:GetDescendants()) do
            local dl = string.lower(d.Name)
            if string.find(dl, "slot") or string.find(dl, "nest") or string.find(dl, "spot") then
                local pos = d:IsA("Model") and d.PrimaryPart and d.PrimaryPart.Position or (d:IsA("BasePart") and d.Position)
                if pos then table.insert(candidates, {obj = d, pos = pos}) end
            end
        end
    end
    if #candidates == 0 then return nil end
    getChar()
    local nearest, minDist = nil, math.huge
    for _, c in ipairs(candidates) do
        local dist = (HRP.Position - c.pos).Magnitude
        if dist < minDist then minDist = dist; nearest = c end
    end
    return nearest
end

function doHatch()
    getChar()
    if not HRP then return end
    local garden = findHatchGarden()
    if not garden then log("không tìm thấy vườn ấp"); return end
    local slot = findEmptyHatchSlot(garden)
    if not slot then log("không có ô ấp trống"); return end
    travelTo(slot.pos)
    task.wait(0.4)
    if slot.prompt then
        slot.prompt.HoldDuration = 0
        pcall(function() fireproximityprompt(slot.prompt) end)
    else
        for _, d in pairs(slot.obj:GetDescendants()) do
            if d:IsA("ProximityPrompt") then
                d.HoldDuration = 0
                pcall(function() fireproximityprompt(d) end)
            end
        end
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        task.wait(0.1)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    end
    task.wait(0.4)
    local hasEgg = false
    for _, c in pairs(slot.obj:GetDescendants()) do
        if string.find(string.lower(c.Name), "egg") then hasEgg = true; break end
    end
    if hasEgg then log("đã đặt trứng vào "..slot.obj.Name)
    else
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        task.wait(0.1)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        task.wait(0.3)
        log("đã thử đặt trứng vào "..slot.obj.Name)
    end
end

function autoHatch() doHatch() end

function autoTreadmill()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("ProximityPrompt") and string.find(string.lower(obj.ActionText), "treadmill") then
            obj.HoldDuration = 0
            fireproximityprompt(obj)
        end
    end
end

function scanEventObjects()
    local found = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") or obj:IsA("BasePart") or obj:IsA("Folder") then
            local lower = string.lower(obj.Name)
            for _, kw in ipairs(EVENT_KEYWORDS) do
                if string.find(lower, kw) then table.insert(found, obj); break end
            end
        end
    end
    return found
end

function activateEventPrompts(eventObj)
    local activated = false
    for _, d in pairs(eventObj:GetDescendants()) do
        if d:IsA("ProximityPrompt") then
            d.HoldDuration = 0
            d.MaxActivationDistance = 100
            fireproximityprompt(d)
            activated = true
        elseif d:IsA("ClickDetector") then
            fireclickdetector(d)
            activated = true
        end
    end
    return activated
end

function autoEvent()
    local events = scanEventObjects()
    if #events == 0 then log("không có sự kiện"); return end
    local nearest, minDist = nil, math.huge
    for _, ev in ipairs(events) do
        local pos = ev:IsA("Model") and ev.PrimaryPart and ev.PrimaryPart.Position
            or (ev:IsA("BasePart") and ev.Position)
            or (ev:IsA("Folder") and ev:GetChildren()[1] and ev:GetChildren()[1].Position)
        if pos then
            local d = (HRP.Position - pos).Magnitude
            if d < minDist then minDist = d; nearest = ev end
        end
    end
    if not nearest then return end
    local pos = nearest:IsA("Model") and nearest.PrimaryPart and nearest.PrimaryPart.Position
        or (nearest:IsA("BasePart") and nearest.Position)
    if pos then travelTo(pos); task.wait(0.5) end
    local ok = activateEventPrompts(nearest)
    if ok then log("sự kiện: " .. nearest.Name) end
end

function getClosestPlayerWithEgg()
    local closest, minDist = nil, math.huge
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local carried = getCarriedEgg(plr.Character)
            if carried and isHighValue(carried.Name) then
                local d = (HRP.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                if d < minDist then minDist = d; closest = plr end
            end
        end
    end
    return closest
end

function aimAt(targetPart)
    if not targetPart then return end
    local camPos = Camera.CFrame.Position
    local dir = (targetPart.Position - camPos).Unit
    local newCF = CFrame.new(camPos, camPos + dir)
    Camera.CFrame = Camera.CFrame:Lerp(newCF, CONFIG.AimSmoothness)
end

function autoClick()
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
    task.wait(CONFIG.ClickDelay)
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
end

local robState = "idle"

function autoRobPlayer()
    if not CONFIG.AutoRobPlayer then return end
    local target = getClosestPlayerWithEgg()
    if not target or not target.Character then robState = "idle"; return end
    local targetChar = target.Character
    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHRP then return end
    local carried = getCarriedEgg(targetChar)
    if not carried then return end

    travelTo(targetHRP.Position)
    task.wait(0.15)
    equipTool()
    if CONFIG.Aimbot then
        local head = targetChar:FindFirstChild("Head") or targetHRP
        aimAt(head)
    end
    if CONFIG.AutoClick then
        for i = 1, 8 do
            autoClick()
            task.wait(0.05)
        end    end
    task.wait(0.2)
    local dropped = nil
    for _, obj in pairs(Workspace:GetDescendants()) do
        if (obj:IsA("Model") or obj:IsA("BasePart"))
            and string.find(string.lower(obj.Name), "egg")
            and obj ~= carried
            and not obj:IsDescendantOf(targetChar) then
            local pos = obj:IsA("Model") and obj.PrimaryPart and obj.PrimaryPart.Position or obj.Position
            if pos and (HRP.Position - pos).Magnitude < 30 then dropped = obj; break end
        end
    end
    if dropped then
        local pos = dropped:IsA("Model") and dropped.PrimaryPart and dropped.PrimaryPart.Position or dropped.Position
        if pos then
            travelTo(pos)
            task.wait(0.2)
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
            log("cướp: " .. dropped.Name)
            if CONFIG.AutoReturnSafe then goToSafeZone() end
        end
    else
        log("đánh " .. target.Name .. " chưa rớt")
    end
end

function updateESPMonster()
    if not CONFIG.ESPMonster then return end
    for _, m in ipairs(getAllMonsters()) do
        local humanoid = m:FindFirstChildOfClass("Humanoid")
        local speed = humanoid and humanoid.WalkSpeed or 0
        local frozen = frozenMonsters[m]
        local label = m.Name .. " [Tốc: " .. math.floor(speed) .. "]"
        if frozen then label = label .. " ❄ ĐÓNG BĂNG" end
        local color = frozen and Color3.fromRGB(100, 200, 255) or Color3.fromRGB(255, 100, 100)
        createESP(m, label, color)
    end
end

-- ESP gốc (pet + egg + player)
function updateESP()
    local petFolder = Workspace:FindFirstChild(CONFIG.PetFolder, true)
    local eggFolder = Workspace:FindFirstChild(CONFIG.EggFolder, true)

    if CONFIG.ESPPet and petFolder then
        for _, pet in pairs(petFolder:GetDescendants()) do
            if pet:IsA("Model") and pet:FindFirstChildOfClass("Humanoid") then
                local rarity = getRarity(pet.Name)
                local color = RARITY[rarity] and RARITY[rarity].Color or Color3.new(1,1,1)
                createESP(pet, pet.Name .. " [" .. translateText(rarity) .. "]", color)
            end
        end
    end

    if CONFIG.ESPEgg and eggFolder then
        for _, egg in pairs(eggFolder:GetDescendants()) do
            if egg:IsA("Model") or egg:IsA("BasePart") then
                local rarity = getRarity(egg.Name)
                local color = RARITY[rarity] and RARITY[rarity].Color or Color3.new(1,1,1)
                createESP(egg, egg.Name .. " [" .. translateText(rarity) .. "]", color)
            end
        end
    end

    if CONFIG.ESPPlayer then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LP and plr.Character then
                local carried = getCarriedEgg(plr.Character)
                if carried and isHighValue(carried.Name) then
                    local rarity = getRarity(carried.Name)
                    local color = RARITY[rarity] and RARITY[rarity].Color or Color3.new(1,1,1)
                    createESP(plr.Character, "ĐANG CẦM: " .. carried.Name .. " [" .. translateText(rarity) .. "]", color, plr.Character:FindFirstChild("Head"))
                end
            end
        end
    end
end

local function findEggFolder()
    local ef = Workspace:FindFirstChild(CONFIG.EggFolder)
    if ef then return ef end
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:IsA("Folder") and string.find(string.lower(obj.Name), "egg") then return obj end
    end
    return nil
end

function findNearestEgg()
    getChar()
    if not HRP then return nil end
    local eggFolder = findEggFolder()
    if not eggFolder then return nil end
    local nearest, minDist = nil, math.huge
    for _, egg in pairs(eggFolder:GetDescendants()) do
        if (egg:IsA("Model") or egg:IsA("BasePart")) and matchFilter(egg.Name) then
            local pos = egg:IsA("Model") and egg.PrimaryPart and egg.PrimaryPart.Position or egg.Position
            if pos then
                local d = (HRP.Position - pos).Magnitude
                if d < minDist then minDist = d; nearest = egg end
            end
        end
    end
    return nearest
end

function findSafeZone()
    local sz = Workspace:FindFirstChild(CONFIG.SafeZoneName, true)
    if sz then
        local pos = sz:IsA("Model") and sz.PrimaryPart and sz.PrimaryPart.Position or sz.Position
        if pos then return pos end
    end
    for _, obj in pairs(Workspace:GetDescendants()) do
        if (obj:IsA("Model") or obj:IsA("BasePart")) and string.find(string.lower(obj.Name), "safe") then
            local pos = obj:IsA("Model") and obj.PrimaryPart and obj.PrimaryPart.Position or obj.Position
            if pos then return pos end
        end
    end
    return nil
end

function stealEgg()
    local egg = findNearestEgg()
    if not egg then return end
    local pos = egg:IsA("Model") and egg.PrimaryPart and egg.PrimaryPart.Position or egg.Position
    if not pos then return end
    travelTo(pos)
    task.wait(0.2)
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    task.wait(0.3)
    if CONFIG.AutoReturnSafe then goToSafeZone() end
end

-- ===== KHỞI CHẠY =====
setSpeed(CONFIG.Speed)

task.spawn(function()
    while task.wait(0.1) do
        if CONFIG.AutoSteal and robState == "idle" then pcall(stealEgg) end
    end
end)

task.spawn(function()
    while task.wait(3) do
        if CONFIG.AutoHatch then pcall(autoHatch) end
    end
end)

task.spawn(function()
    while task.wait(CONFIG.TreadmillDelay) do
        if CONFIG.AutoTreadmill then pcall(autoTreadmill) end
    end
end)

task.spawn(function()
    while task.wait(CONFIG.EventScanDelay) do
        if CONFIG.AutoEvent then pcall(autoEvent) end
    end
end)

task.spawn(function()
    while task.wait(CONFIG.RobScanDelay) do
        if CONFIG.AutoRobPlayer then pcall(autoRobPlayer) end
    end
end)

task.spawn(function()
    while task.wait(0.2) do
        if CONFIG.AntiMonster then pcall(antiMonsterLoop) end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if CONFIG.ESPPet or CONFIG.ESPEgg or CONFIG.ESPPlayer or CONFIG.ESPMonster then
            pcall(updateESP)
            pcall(updateESPMonster)
        else
            pcall(clearESP)
        end
    end
end)

task.spawn(function()
    while task.wait(3) do
        if CONFIG_TRANSLATE.AutoTranslateGame then pcall(translateGameUI) end
        if CONFIG_TRANSLATE.TranslatePrompts then pcall(translateGamePrompts) end
    end
end)

task.spawn(function()
    while task.wait(900) do
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait(0.1)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end
end)

log("script v12 loaded - Ninja Hub Full")
print("Ninja Hub v12 Full loaded by Palofsc")