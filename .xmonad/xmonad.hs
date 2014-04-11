import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import System.Exit

myManageHook = composeAll
    [ className =? "Gimp"     --> doFloat
    , className =? "Firefox"  --> doFloat
    , className =? "Pidgin"   --> doShift "6"
    , className =? "Firefox"  --> doShift "8"
    , className =? "Conkeror" --> doShift "8"
    , className =? "Vmplayer" --> doShift "9"
    ]

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

--     trayproc <- spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x191970 --height 12"

main = do
    xmproc <- spawnPipe "xmobar"
--     synergyproc <- spawn "synergyc 13.242.228.128"
    xrandrproc <- spawn "xrandr --auto --output HDMI1 --primary --mode 1680x1050 --left-of VGA1"
    xscreensaverproc <- spawn "xscreensaver -no-splash"
    xmonad $ defaultConfig
        { terminal          = "gnome-terminal"
        , focusFollowsMouse = False
        , workspaces        = myWorkspaces
        , manageHook        = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , layoutHook        = avoidStruts  $  layoutHook defaultConfig
        , logHook           = dynamicLogWithPP $ xmobarPP
                                  { ppOutput = hPutStrLn xmproc
                                  , ppTitle  = xmobarColor "green" "" . shorten 50
                                  }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
