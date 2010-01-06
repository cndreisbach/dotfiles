import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.ManageHook
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.WindowNavigation
import qualified Data.Map as M
 
-- Actions
import XMonad.Actions.CycleWS
import XMonad.Actions.SwapWorkspaces

isSplash = isInProperty "_NET_WM_WINDOW_TYPE" "_NET_WM_WINDOW_TYPE_SPLASH"

myManageHook :: [ManageHook]
myManageHook = 
    [ isSplash --> doIgnore ]

main = do xmonad $ gnomeConfig
                     { manageHook = manageHook gnomeConfig <+> composeAll myManageHook,
                       layoutHook = windowNavigation $ layoutHook gnomeConfig,
                       keys = myKeys,
                       borderWidth = 3,
                       focusedBorderColor = "#FFF838",
                       normalBorderColor = "#444447",
                       modMask = mod4Mask }
          where
            defKeys = keys defaultConfig
            delKeys x = foldr M.delete (defKeys x) (toRemove x)
            myKeys x = foldr (uncurry M.insert) (delKeys x) (toAdd x)
 
          -- remove some of the default key bindings
            toRemove x =
                [ (modMask x              , xK_p  )
                , (modMask x .|. shiftMask, xK_q  ) -- don't strand naive users
                ]
 
            toAdd x =
                [ ((modMask x, xK_Right), sendMessage $ Go R)
		, ((modMask x, xK_Left ), sendMessage $ Go L)
		, ((modMask x, xK_Up   ), sendMessage $ Go U)
		, ((modMask x, xK_Down ), sendMessage $ Go D)
                ]
            
     
