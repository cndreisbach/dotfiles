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

hs.hotkey.bind(hyper, "Up", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(hs.layout.maximized)
end)

hs.hotkey.bind(hyper, "Left", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(hs.layout.left50)
end)

hs.hotkey.bind(hyper, "Right", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(hs.layout.right50)
end)

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

hs.hotkey.bind({"cmd", "ctrl", "alt"}, "Left", moveToPrevScreen)
hs.hotkey.bind({"cmd", "ctrl", "alt"}, "Right", moveToNextScreen)
hs.hotkey.bind(hyper, "PageUp", moveToPrevScreen)
hs.hotkey.bind(hyper, "PageDown", moveToNextScreen)

hs.hotkey.bind(hyper, "l", function()
    local app = hs.application.frontmostApplication()

    if app:name() ~= "The Archive" then return end

    local output = hs.execute(
                       "cd ~/Dropbox/Notes/; ls | sed -E -e 's/.[^.]*$//' -e 's!^([0-9]+)[[:space:]-]+(.+)!\\2 [[\\1]]!'")

    output = trim(output)
    local notes = lines(output)
    local choices = {}
    for k, v in pairs(notes) do choices[k] = {["text"] = v} end

    local chooser = hs.chooser.new(function(choice)
        if choice then
            hs.pasteboard.setContents(choice["text"])
            hs.eventtap.keyStroke({"cmd"}, "v")
        end
    end)
    chooser:choices(choices)
    chooser:show()
end)

hs.hotkey.bind(hyper, "n", function()
    hs.application.launchOrFocus("The Archive")
    hs.osascript.applescript([[
      set theResponse to display dialog "New note name?" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"

      tell application "The Archive"
        activate
      end tell
      tell application "System Events"
        tell process "The Archive"
          click menu item "New…" of menu "Note" of menu bar 1
          click menu item "Rename" of menu "Note" of menu bar 1
          key code 124
          if (text returned of theResponse) is not equal to "" then
            keystroke " " & (text returned of theResponse)
          end if
          key code 36
          key code 48
        end tell
      end tell
    ]])
end)

Install:andUse("Seal", {
    hotkeys = {show = {hyper, "space"}},
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

Install:andUse("ClipboardTool", {
    hotkeys = {show_clipboard = {hyper, "v"}},
    config = {paste_on_select = true, show_in_menubar = false, hist_size = 50},
    start = true
})
