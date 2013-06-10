import XMonad
import qualified XMonad.StackSet as W
import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.EZConfig
import XMonad.Config.Gnome
import XMonad.Util.Run
import XMonad.Layout.NoBorders
import System.IO

myManageHook = composeAll (
  [ manageHook gnomeConfig
  , isFullscreen --> (doF W.focusDown <+> doFullFloat)
  , className =? "Unity-2d-panel" --> doIgnore
  , className =? "Unity-2d-launcher" --> doFloat ])

main = do
xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
xmonad $ gnomeConfig 
  { modMask = mod4Mask,
    terminal = "gnome-terminal",
    manageHook = manageDocks <+> myManageHook, 
    layoutHook = smartBorders(spacing 3 $ layoutHook gnomeConfig),
    -- handleEventHook = fullscreenEventHook,
    -- needs xmonad 0.10 to work
    logHook = do
      dynamicLogWithPP xmobarPP {
        ppOutput = hPutStrLn xmproc,
        ppTitle = xmobarColor "blue" "" . shorten 50,
        ppLayout = const "" -- to disable the layout info on xmobar
      }
      logHook gnomeConfig,
    borderWidth = 3,
    normalBorderColor = "#CCCCCC",
    focusedBorderColor = "#0099FF" 
  }
  `additionalKeysP`
    [ ("M-p", spawn "/usr/local/bin/dmenu_run -b -fn 'Ubuntu Mono-12'")
    , ("M-b", spawn "gnome-www-browser")
    , ("M-f", spawn "firefox") 
    , ("M-g", spawn "gnome-control-center")
    , ("M-S-u", spawn "pkill unity-2d-panel; unity-2d-panel")
    , ("M-S-q", spawn "gnome-session-quit")
    ]
