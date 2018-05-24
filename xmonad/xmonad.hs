import XMonad
import XMonad.Actions.WorkspaceNames
import XMonad.Config.Desktop -- still relevant?
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import XMonad.Layout.Spacing
import XMonad.Layout.Dishes
import XMonad.Layout.HintedTile
import XMonad.Layout.Roledex
import XMonad.Layout.ResizableTile
import XMonad.Layout.Fullscreen
import XMonad.Layout.WindowArranger
import XMonad.Layout.Circle
import XMonad.Layout.Gaps

import XMonad.Prompt
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


withGaps layout = gaps [(U, 42), (R, 8), (L, 8), (D, 8)] $ avoidStruts (spacing 10 $ layout)

res = ResizableTall 1 (2/100) (1/2) []
dis = Dishes 2 (1/6)
ful = fullscreenFull Full
hintedTile = HintedTile 1 (3/100) (1/2) TopLeft
wide = hintedTile Wide
layout = (avoidStruts $ res)
         ||| withGaps res
         ||| (avoidStruts $ ful)
         ||| withGaps ful
         ||| (avoidStruts $ dis)
         ||| withGaps dis
         ||| withGaps wide
         ||| (avoidStruts $ wide)
         ||| (avoidStruts $ Circle) -- Circle is unlikely to have a problem, but play it safe

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/eric/.xmonad/xmobar.hs"
  xmonad $ defaultConfig
      { manageHook = manageDocks <+> manageHook defaultConfig
      , layoutHook = windowArrange layout
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
