import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import qualified Data.Map as M

main = xmonad gnomeConfig
         { modMask = mod4Mask
         --, terminal = "urxvt"
         , keys = \c -> mykeys c `M.union` keys gnomeConfig c
         , manageHook = manageHook gnomeConfig <+> composeOne [ isFullscreen -?> doFullFloat ]
         , handleEventHook = fullscreenEventHook
         }
  where
    mykeys (XConfig {modMask = modm}) = M.fromList $
         [ ((modm , xK_w), spawn "google-chrome") 
         , ((modm , xK_x), spawn "gnome-screensaver-command --lock") 
         , ((modm , xK_e), spawn "emacs")]
