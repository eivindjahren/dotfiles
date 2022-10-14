import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog

main :: IO ()
main = xmonad . ewmh =<< xmobar myconfig


myconfig = def
    { modMask = mod4Mask,  -- Rebind Mod to the Super key
      handleEventHook = handleEventHook def <+> fullscreenEventHook,
      logHook = dynamicLog
    }
  `additionalKeysP`
    [ ("M-C-l", spawn "xscreensaver-command -lock")
    , ("M-c"  , spawn "google-chrome")
    ]

