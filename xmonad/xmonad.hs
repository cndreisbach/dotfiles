import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
	
main = xmonad $ gnomeConfig {
         terminal = "gnome-terminal"
       , modMask = mod4Mask
       }
       `additionalKeysP`
       [ ("M-d", spawn "dmenu_run -b") ]

