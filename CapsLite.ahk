#SingleInstance force

; If the script is not elevated, relaunch as administrator and kill current instance:
full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}

IfExist, CL.ico
{
;freezing icon
menu, TRAY, Icon, CL.ico, , 1
}
Menu, Tray, Icon,,, 1

SetStoreCapslockMode, Off

global CLversion:="Version: 3.2.0.0"

global cClipboardAll ;standalone clipboard 1
global caClipboardAll ;standalone clipboard 2
global sClipboardAll ;system clipboard
global whichClipboardNow  ;0 = system clipboard; 1 = clipboard 1; 2 = clipboard 2
; global clipSaveArr=[]
allowRunOnClipboardChange:=true


#Include lib
#Include lib_init.ahk ;The beginning of all things

; language
#include ..\language\lang_func.ahk
#include ..\language\Simplified_Chinese.ahk
#include ..\language\English.ahk
; /language

#include lib_keysFunction.ahk
#include lib_keysSet.ahk

#include lib_settings.ahk
#Include lib_clTab.ahk 
#Include lib_functions.ahk ;public functions
#include lib_loadAnimation.ahk

;change dir
#include ..\userAHK
#include *i main.ahk

#MaxHotkeysPerInterval 500
#NoEnv
;  #WinActivateForce
Process Priority,,High


start:

; ==================== START ====================
global ctrlZ, CL, CapsLock, SP, SC, TB, EC, BSL, RSB


; ------------------ CapsLock -------------------
$Capslock::
;ctrlZ:     Capslock+Z undo / redo flag
;Capslock:  Capslock 键状态标记，按下是1，松开是0
;CL:        是否使用过 CapsLite 功能标记，使用过会清除这个变量
ctrlZ:=CL:=CapsLock:=1

SetTimer, setCL, -400

KeyWait, Capslock
CapsLock:=""
if CL
{
    if keyset.press_caps
    {
        try
            runFunc(keyset.press_caps)
    }
    ;else
    ;{
    ;    SetCapsLockState % !GetKeyState("CapsLock","T")
    ;}
}
CL:=""

return


setCL:
CL:=""
return


; ------------------- Space ---------------------
$Space::
SP:=1

SetTimer, setSP, -400

KeyWait, Space
if SP
{
    SendInput, {Space}
}
SP:=""

return


setSP:
SP:=""
return


; ------------------ Semicolon ------------------
$`;::
SC:=1

SetTimer, setSC, -400

KeyWait, `;
if SC
{
    SendInput, {;}
}
SC:=""

return


setSC:
SC:=""
return


; -------------------- Tab ----------------------
$Tab::
TB:=1

SetTimer, setTB, -400

KeyWait, Tab
if TB
{
    SendInput, {Tab}
}
TB:=""

return


setTB:
TB:=""
return


; -------------------- Esc ----------------------
$Esc::
EC:=1

SetTimer, setEC, -400

KeyWait, Esc
if EC
{
    SendInput, {Esc}
}
EC:=""

return


setEC:
EC:=""
return


; ----------------- Backslash -------------------
$\::
BSL:=1

SetTimer, setBSL, -400

KeyWait, `\
if BSL
{
    SendInput, {\}
}
BSL:=""

return


setBSL:
BSL:=""
return


; ------------- R Square Bracket ----------------
$]::
RSB:=1

SetTimer, setRSB, -400

KeyWait, `]
if RSB
{
    SendInput, {]}
}
RSB:=""

return


setRSB:
RSB:=""
return


; ------------------ Clipboard ------------------
OnClipboardChange: ; 剪贴板内容改变时将运行


; 如果有复制操作时，Capslock 键没有按下，那就是系统原生复制
if (allowRunOnClipboardChange && !CapsLock && CLsets.global.allowClipboard != "0")
{
    try {
        clipSaver("s")
    } catch _ {
        sleep 100
        clipSaver("s")
    }
    whichClipboardNow:=0
}
allowRunOnClipboardChange:=true
return


#If CLsets.global.allowClipboard != "0"
$^v::
try
    kf_pasteSystem()
return
#If


GuiClose:
GuiEscape:
Gui, Cancel
return
