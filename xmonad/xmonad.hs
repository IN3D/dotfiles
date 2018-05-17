import XMonad
import XMonad.Actions.WorkspaceNames
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Prompt
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/eric/.xmonad/xmobar.hs"
  xmonad $ defaultConfig
      { manageHook = manageDocks <+> manageHook defaultConfig
      , layoutHook = avoidStruts  $  layoutHook defaultConfig
      , handleEventHook = mconcat
                          [ docksEventHook
			  , handleEventHook defaultConfig
			  ]
      , logHook = dynamicLogWithPP xmobarPP
                      { ppOutput = hPutStrLn xmproc
                      , ppTitle  = xmobarColor "green" "" . shorten 50
                      }
      , modMask = mod4Mask -- Rebind Mod to Super key
      } `additionalKeys`
      [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
      , ((mod4Mask .|. shiftMask, xK_r), renameWorkspace defaultXPConfig)
      , ((controlMask, xK_Print), spawn "sleep 0.2; cd ~/Pictures/scrots; scrot -s")
      , ((0, xK_Print), spawn "cd ~/Pictures/scrots; scrot")
      ]
