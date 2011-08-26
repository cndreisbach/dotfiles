import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.ManageHook
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.WindowNavigation

-- Actions
import XMonad.Actions.CycleWS
import XMonad.Actions.SwapWorkspaces

isSplash = isInProperty "_NET_WM_WINDOW_TYPE" "_NET_WM_WINDOW_TYPE_SPLASH"

myManageHook :: [ManageHook]
myManageHook = 
    [ isSplash --> doIgnore 
    , isFullscreen --> doFullFloat ]

main = do xmonad $ gnomeConfig
                     { manageHook = manageHook gnomeConfig <+> composeAll myManageHook
                     , layoutHook = windowNavigation $ layoutHook gnomeConfig
                     , borderWidth = 3
                     , focusedBorderColor = "orange"
                     , normalBorderColor = "black"
                     , modMask = mod4Mask
                     }
                     `additionalKeysP`
                     [ ("M-<Left>",    prevWS)
                     , ("M-<Right>",   nextWS)
                     , ("M-S-<Left>",  shiftToPrev )
                     , ("M-S-<Right>", shiftToNext )
                     , ("M-p", spawn "synapse")
                     , ("M-n", spawn "nautilus --browser")
                     , ("M-c", spawn "gnome-control-center")
                     ]
