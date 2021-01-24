hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install = spoon.SpoonInstall

function trim(s) return (s:gsub("^%s*(.-)%s*$", "%1")) end

function lines(str)
    local t = {}
    local function helper(line)
        table.insert(t, line)
        return ""
    end
    helper((str:gsub("(.-)\r?\n", helper)))
    return t
end

function map(func, array)
    local new_array = {}
    for i, v in ipairs(array) do new_array[i] = func(v) end
    return new_array
end

function mapTable(func, table)
    local newTable = {}
    for k, v in pairs(table) do newTable[k] = func(v) end
end

local hyper = {"cmd", "alt", "ctrl", "shift"}

hs.hotkey.bind(hyper, "R", function() hs.reload() end)
hs.alert.show("Hammerspoon config loaded")

hs.window.animationDuration = 0.1

-- hs.hotkey.bind(hyper, "Up", function()
--     local win = hs.window.focusedWindow()
--     win:moveToUnit(hs.layout.maximized)
-- end)

-- hs.hotkey.bind(hyper, "Left", function()
--     local win = hs.window.focusedWindow()
--     win:moveToUnit(hs.layout.left50)
-- end)

-- hs.hotkey.bind(hyper, "Right", function()
--     local win = hs.window.focusedWindow()
--     win:moveToUnit(hs.layout.right50)
-- end)

function moveToPrevScreen()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    local prevScreen = screen:previous()
    win:moveToScreen(prevScreen)
end

function moveToNextScreen()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    local nextScreen = screen:next()
    win:moveToScreen(nextScreen)
end

-- hs.hotkey.bind({"cmd", "ctrl", "alt"}, "Left", moveToPrevScreen)
-- hs.hotkey.bind({"cmd", "ctrl", "alt"}, "Right", moveToNextScreen)
-- hs.hotkey.bind(hyper, "PageUp", moveToPrevScreen)
-- hs.hotkey.bind(hyper, "PageDown", moveToNextScreen)

Install:andUse("Seal", {
    hotkeys = {toggle = {hyper, "space"}, show = {"cmd", "space"}},
    fn = function(s)
        s:loadPlugins({"apps", "calc", "screencapture", "useractions"})
        s.plugins.apps.appSearchPaths = {
            "/Applications", "/System/Applications", "~/Applications",
            "/Developer/Applications",
            "/Applications/Xcode.app/Contents/Applications",
            "/System/Library/PreferencePanes", "/Library/PreferencePanes",
            "~/Library/PreferencePanes",
            "/System/Library/CoreServices/Applications",
            "/System/Library/CoreServices/", "/usr/local/Cellar"
        }
        s.plugins.apps:restart()
        s:refreshAllCommands()
    end,
    start = true
})
