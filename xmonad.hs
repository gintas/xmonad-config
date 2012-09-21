import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Hooks.SetWMName
import qualified Data.Map as M

main = xmonad gnomeConfig
         { modMask = mod4Mask
         --, terminal = "urxvt"
         , keys = \c -> mykeys c `M.union` keys gnomeConfig c
         , manageHook = manageHook gnomeConfig <+> composeOne [ isFullscreen -?> doFullFloat ]
         , handleEventHook = fullscreenEventHook
         , layoutHook = smartBorders (layoutHook gnomeConfig)
         -- , startupHook = setWMName "LG3D"  -- Workaround for some Java GUI apps
         }
  where
    mykeys (XConfig {modMask = modm}) = M.fromList $
         [ ((modm , xK_x), spawn "gnome-screensaver-command --lock")
         , ((modm , xK_o), spawn "google-chrome")
         , ((modm , xK_i), spawn "emacsclient -c")
         ]
