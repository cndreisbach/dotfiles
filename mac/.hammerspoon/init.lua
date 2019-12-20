-- caffeine = require "caffeine"
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function() hs.reload() end)
hs.alert.show("Hammerspoon config loaded")

hs.window.animationDuration = 0.1

function fullScreen()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end

hs.hotkey.bind({"cmd", "alt"}, "F", fullScreen)

hs.hotkey.bind({"cmd", "alt"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt"}, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
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

hs.loadSpoon('KSheet')

hs.hotkey
    .bind({"cmd", "alt", "ctrl"}, "k", function() spoon.KSheet:toggle() end)

