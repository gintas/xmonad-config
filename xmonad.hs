import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageHelpers
import qualified Data.Map as M

main = xmonad gnomeConfig
         { modMask = mod4Mask
         --, terminal = "urxvt"
         , keys = \c -> mykeys c `M.union` keys gnomeConfig c
         , manageHook = manageHook gnomeConfig <+> composeOne [ isFullscreen -?> doFullFloat ]
         }
  where
    mykeys (XConfig {modMask = modm}) = M.fromList $
         [ ((modm , xK_w), spawn "google-chrome") 
         , ((modm , xK_e), spawn "emacs")]
