; keys functions start-------------
; 所有按键对应功能都放在这，为防止从set.ini通过按键设置调用到非按键功能函数，
; 规定函数以"kf_"开头

; ------------------------ Basic -------------------------

kf_doNothing(){
    return
}


kf_send(p){
    sendinput, % p
    return
}


kf_run(p){
    run, % p
    return
}


RemoveToolTip:
    ToolTip
return


kf_toggleCapsLock(){
    SetCapsLockState % !GetKeyState("CapsLock", "T")
    if GetKeyState("CapsLock", "T"){
        ToolTip, CapsLock On
        SetTimer, RemoveToolTip, -2500
        Sleep 100
    } else {
        ToolTip, CapsLock Off
        SetTimer, RemoveToolTip, -2500
        Sleep 100
    }
    return
}


kf_toggleNumLock(){
    SetNumLockState % !GetKeyState("NumLock", "T")
    if !GetKeyState("NumLock", "T"){
        ToolTip, Numpad On
        SetTimer, RemoveToolTip, -2500
        Sleep 100
    } else {
        ToolTip, Numpad Off
        SetTimer, RemoveToolTip, -2500
        Sleep 100
    }
    return
}


kf_keySpace(){
    SendInput, {Space}
    return
}


kf_keyTab(){
    SendInput, {Tab}
    return
}


kf_keyEsc(){
    SendInput, {Esc}
    return
}


kf_keySemicolon(){
    SendInput, {;}
    return
}


kf_keyBackslash(){
    SendInput, {\}
    return
}


kf_keyRSBracket(){
    SendInput, {]}
    return
}


kf_doubleChar(char1,char2:=""){
    if(char2=="")
    {
        char2:=char1
    }
    charLen:=StrLen(char2)
    selText:=getSelText()
    ClipboardOld:=ClipboardAll
    if(selText)
    {
        Clipboard:=char1 . selText . char2
        SendInput, +{insert}
    }
    else
    {
        Clipboard:=char1 . char2
        SendInput, +{insert}{left %charLen%}
    }
    Sleep, 100
    Clipboard:=ClipboardOld
    Return
}


kf_sendChar(char){
    ClipboardOld:=ClipboardAll
    Clipboard:=char
    SendInput, +{insert}
    Sleep, 50
    Clipboard:=ClipboardOld
    return
}


kf_sendSpace(){
    kf_sendChar(" ")
    return
}


kf_sendSemicolon(){
    kf_sendChar(";")
    return
}


kf_sendComma(){
    kf_sendChar(",")
    return
}


kf_sendDot(){
    kf_sendChar(".")
    return
}


kf_doubleSingleQuote(){
    kf_doubleChar("'","'")
    return
}


kf_doubleDoubleQuote(){
    kf_doubleChar("""","""")
    return
}


kf_doubleBackquote(){
    kf_doubleChar("``","``")
    return
}


kf_doubleSmallBrackets(){
    kf_doubleChar("(",")")
    return
}


kf_doubleMiddleBrackets(){
    kf_doubleChar("[","]")
    return
}


kf_doubleLargeBrackets(){
    kf_doubleChar("{","}")
    return
}


kf_doubleCSquote(){
    kf_doubleChar("「","」")
    return
}


kf_doubleCDquote(){
    kf_doubleChar("『","』")
    return
}


; 功能: 切换选中文字大小写
; 参数: Mode - 可以为 L (小写)、U (大写)、T (首字母大写)
SwitchSelCase(Mode) {
    clipBak := ClipboardAll ; 备份剪贴板
    Clipboard := "" ; 清空剪贴板
    SendInput, ^{insert}
    ClipWait, 0.1
    if (ErrorLevel)
    {
        SendInput,^{left}^+{right}^{insert}
        ClipWait, 0.1
    }

    if(!ErrorLevel)
    {
        selText := Clipboard
        if (selText != "") {
            Clipboard := ""
            Clipboard := Format("{:" Mode "}", selText)
            ClipWait, 1
            Send, ^v
            Sleep, 500 ; 防止没有粘贴完毕剪贴板就被恢复了
        }
    }
    Clipboard := clipBak ; 恢复剪贴板
    return
}


; 选中文字切换为小写
kf_switchSelLowerCase(){
    SwitchSelCase("L")
    return
}

; 选中文字切换为大写
kf_switchSelUpperCase(){
    SwitchSelCase("U")
    return
}


; 选中文字首字母大写
kf_switchInitUpperCase(){
    SwitchSelCase("T")
    return
}


; ----------------------- Movement -----------------------

kf_moveLeft(i:=1){
    SendInput, {left %i%}
    return
}


kf_moveRight(i:=1){
    SendInput, {right %i%}
    return
}


kf_moveUp(i:=1){
    global
    if(WinActive("ahk_id" . GuiHwnd))
    {
        ControlFocus, , ahk_id %LV_show_Hwnd%
        SendInput, {Up %i%}
        ControlFocus, , ahk_id %editHwnd%
    }
    else
        SendInput,{up %i%}
    return
}


kf_moveDown(i:=1){
    global
    if(WinActive("ahk_id" . GuiHwnd))
    {
        ControlFocus, , ahk_id %LV_show_Hwnd%
        SendInput, {Down %i%}
        ControlFocus, , ahk_id %editHwnd%
    }
    else
        SendInput,{down %i%}
    return
}


kf_moveWordLeft(i:=1){
    SendInput,^{Left %i%}
    return
}


kf_moveWordRight(i:=1){
    SendInput,^{Right %i%}
    return
}


kf_home(){
    SendInput,{Home}
    return
}


kf_end(){
    SendInput,{End}
    return
}


kf_pageUp(){
    global
    if(WinActive("ahk_id" . GuiHwnd))
    {
        ControlFocus, , ahk_id %LV_show_Hwnd%
        SendInput, {PgUp}
        ControlFocus, , ahk_id %editHwnd%
    }
    else
        SendInput, {PgUp}
    return
}


kf_pageDown(){
    global
    if(WinActive("ahk_id" . GuiHwnd))
    {
        ControlFocus, , ahk_id %LV_show_Hwnd%
        SendInput, {PgDn}
        ControlFocus, , ahk_id %editHwnd%
    }
    else
        SendInput, {PgDn}
    return
}


kf_moveToBOF(){
    SendInput, ^{Home}
    return
}


kf_moveToEOF(){
    SendInput, ^{End}
    return
}


; ---------------------- Selection -----------------------

kf_selectUp(i:=1){
    SendInput, +{Up %i%}
    return
}


kf_selectDown(i:=1){
    SendInput, +{Down %i%}
    return
}


kf_selectLeft(i:=1){
    SendInput, +{Left %i%}
    return
}


kf_selectRight(i:=1){
    SendInput, +{Right %i%}
    return
}


kf_selectAll(){
    SendInput, ^{a}
    return
}


kf_selectHome(){
    SendInput, +{Home}
    return
}


kf_selectEnd(){
    SendInput, +{End}
    return
}

kf_selectPageUp(){
    SendInput, +{PgUp}
    return
}


kf_selectPageDown(){
    SendInput, +{PgDn}
    return
}


kf_selectToBOF(){
    SendInput, +^{Home}
    return
}


kf_selectToEOF(){
    SendInput, +^{End}
    return
}


kf_selectWord(){
    SendInput, ^{Left}
    SendInput, +^{Right}
    return
}


kf_selectLine(){
    SendInput, {Home}
    SendInput, +{End}
    return
}


kf_selectWordLeft(i:=1){
    SendInput, +^{Left %i%}
    return
}


kf_selectWordRight(i:=1){
    SendInput, +^{Right %i%}
    return
}


; ------------------------ Delete ------------------------

kf_backspace(){
    SendInput,{backspace}
    return
}


kf_delete(){
    SendInput,{delete}
    return
}


kf_deleteAll(){
    SendInput, ^{a}{delete}
    return
}


kf_deleteToBOF(){
    SendInput,+^{Home}{bs}
    return
}


kf_deleteToEOF(){
    SendInput,+^{End}{bs}
    return
}


kf_deleteWord(){
    SendInput, +^{left}
    SendInput, {delete}
    return
}


kf_deleteLine(){
    SendInput,{End}+{home}{bs}
    return
}


kf_deleteToBOL(){
    SendInput,+{Home}{bs}
    return
}


kf_deleteToEOL(){
    SendInput,+{End}{bs}
    return
}


; ----------------------- Function -----------------------

kf_getJSEvalString(){
    global
    ClipboardOld:=ClipboardAll
    Clipboard:=""
    SendInput, ^{insert} ;
    ClipWait, 0.1
    if(!ErrorLevel)
    {
        result:=escapeString(Clipboard)
        inputbox, result,,%lang_kf_getDebugText%,,,,,,,, % result
        if(!ErrorLevel)
        {
            Clipboard:=result
            return
        }
    }
    Sleep, 200
    Clipboard:=ClipboardOld
    return
}


kf_tabScript(){
    tabAction()
    return
}


kf_enter(){
    SendInput, {Enter}
    return
}


kf_esc(){
    SendInput, {Esc}
    return
}


kf_undo(){
    SendInput, ^{z}
    return
}


kf_redo(){
    SendInput, ^{y}
    return
}


kf_find(){
    SendInput, ^{f}
    return
}


kf_replace(){
    SendInput, ^{h}
    return
}


kf_windowLeft(){
    SendInput, #{Left}
    return
}


kf_windowRight(){
    SendInput, #{Right}
    return
}


kf_windowUp(){
    SendInput, #{Up}
    return
}


kf_windowDown(){
    SendInput, #{Down}
    return
}


kf_lastDesktop(){
    SendInput, ^#{Left}
    return
}


kf_nextDesktop(){
    SendInput, ^#{Right}
    return
}


kf_multiTask(){
    SendInput, #{Tab}
    return
}


kf_maxWindow(){
    WinGet,S,MinMax,A
    if S=0
        WinMaximize,A
    else if S=1
        WinRestore,A
    else if S=-1
        WinRestore,A
    return
}


kf_minWindow(){
    WinMinimize,A
}


kf_lockScreen(){
    Run rundll32.exe user32.dll LockWorkStation
    Sleep 1000
    return
}


kf_winX(){
    SendInput, #{x}
    return
}


kf_winSearch(){
    SendInput, #{q}
    return
}


kf_explorer(){
    SendInput, #{e}
    return
}


kf_winRun(){
    SendInput, #{r}
    return
}


kf_settings(){
    SendInput, #{i}
    return
}


kf_notepad(){
    run, "D:\Useful Tools\Notepad2\Notepad2.exe"
    return
}


kf_screenshot(){
    run, "D:\Useful Tools\Tools\FSCapture\FSCapture.exe"
    return
}


kf_terminal(){
    run, "C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminal_8wekyb3d8bbwe\wt.exe"
    return
}


kf_runBrowser(){
    run, "D:\Work Tools\CentBrowser\CentBrowser\Application\chrome.exe"
    return
}


kf_runCopyQ(){
    run, "D:\Useful Tools\CopyQ\copyq.exe"
    return
}


kf_showDesktop(){
    SendInput, #{d}
    return
}


kf_taskManager(){
    SendInput, ^+{Esc}
    return
}


kf_newFolder(){
    SendInput, ^+{n}
    return
}


kf_showCopyQ(){
    SendInput, ^!{c}
    return
}


; 开启右键菜单
kf_appsKey(){
    SendInput, {AppsKey}
    return
}


; ---------------------- Clipboard -----------------------

kf_switchClipboard(){
    global
    if(CLsets.global.allowClipboard)
    {
        CLsets.global.allowClipboard:="0"
        setSettings("Global","allowClipboard","0")
        showMsg("Clipboard OFF",1500)
    }
    else
    {
        CLsets.global.allowClipboard:="1"
        setSettings("Global","allowClipboard","1")
        showMsg("Clipboard ON",1500)
    }
    return
}


kf_pasteSystem(){
    global
    if (whichClipboardNow!=0)
    {
        allowRunOnClipboardChange:=false
        Clipboard:=sClipboardAll
        whichClipboardNow:=0
    }
    SendInput, ^{v}
    return
}


kf_cut(){
    SendInput, ^{x}
    return
}


kf_copy(){
    SendInput, ^{c}
    return
}


kf_paste(){
    SendInput, ^{v}
    return
}


kf_copyPath(){
    pathSel := Explorer_GetSelected()
    if pathSel
    {
        ClipboardOld:=ClipboardAll
        Clipboard:=pathSel
    }
    return
}


kf_cut_1(){
    global
    if(CLsets.global.allowClipboard="0")  ;禁用剪贴板功能
    {
        CL:=""
        return
    }
    ClipboardOld:=ClipboardAll
    Clipboard:=""
    SendInput, ^{x}
    ClipWait, 0.1
    if (ErrorLevel)
    {
        SendInput,{home}+{End}^{x}
        ClipWait, 0.1
    }
    if (!ErrorLevel)
    {
        clipSaver("c")
        whichClipboardNow:=1
    }
    else
    {
        Clipboard:=ClipboardOld
    }
    return
}


kf_copy_1(){
    global
    if(CLsets.global.allowClipboard="0")  ;禁用剪贴板功能
    {
        CL:=""
        return
    }

    ClipboardOld:=ClipboardAll
    Clipboard:=""
    SendInput, ^{insert}
    ClipWait, 0.1
    if (ErrorLevel)
    {
        SendInput,{home}+{End}^{insert}{End}
        ClipWait, 0.1
    }
    if (!ErrorLevel)
    {
        ;  cClipboardAll:=ClipboardAll
        clipSaver("c")
        whichClipboardNow:=1
    }
    else
    {
        Clipboard:=ClipboardOld
    }
    return
}


kf_paste_1(){
    global
    if(CLsets.global.allowClipboard="0")  ;禁用剪贴板功能
    {
        CL:=""
        return
    }
    if (whichClipboardNow!=1)
    {
        Clipboard:=cClipboardAll
        whichClipboardNow:=1
    }
    SendInput, ^{v}
    return
}


kf_cut_2(){
    global
    if(CLsets.global.allowClipboard="0")  ;禁用剪贴板功能
    {
        CL:=""
        return
    }
    ClipboardOld:=ClipboardAll
    Clipboard:=""
    SendInput, ^{x}
    ClipWait, 0.1
    if (ErrorLevel)
    {
        SendInput,{home}+{End}^{x}
        ClipWait, 0.1
    }
    if (!ErrorLevel)
    {
        clipSaver("ca")
        whichClipboardNow:=2
    }
    else
    {
        Clipboard:=ClipboardOld
    }
    return
}


kf_copy_2(){
    global
    if(CLsets.global.allowClipboard="0")  ;禁用剪贴板功能
    {
        CL:=""
        return
    }

    ClipboardOld:=ClipboardAll
    Clipboard:=""
    SendInput, ^{insert}
    ClipWait, 0.1
    if (ErrorLevel)
    {
        SendInput,{home}+{End}^{insert}{End}
        ClipWait, 0.1
    }
    if (!ErrorLevel)
    {
        ;  caClipboardAll:=ClipboardAll
        clipSaver("ca")
        whichClipboardNow:=2
    }
    else
    {
        Clipboard:=ClipboardOld
    }
    return
}


kf_paste_2(){
    global
    if(CLsets.global.allowClipboard="0")  ;禁用剪贴板功能
    {
        CL:=""
        return
    }
    if (whichClipboardNow!=2)
    {
        Clipboard:=caClipboardAll
        whichClipboardNow:=2
    }
    SendInput, ^{v}
    return
}


; ----------------------- Media -----------------------

kf_volumeUp(){
    SendInput, {Volume_Up}
    return
}


kf_volumeDown(){
    SendInput, {Volume_Down}
    return
}


kf_volumeMute(){
    SendInput, {Volume_Mute}
    return
}


kf_browserForward(){
    SendInput, {Browser_Forward}
    return
}


kf_browserBack(){
    SendInput, {Browser_Back}
    return
}


kf_browserRefresh(){
    SendInput, {Browser_Refresh}
    return
}


kf_browserSearch(){
    SendInput, {Browser_Search}
    return
}


kf_browserHome(){
    SendInput, {Browser_Home}
    return
}


; ---------------------- Useful HK -----------------------

kf_shiftDelete(){
    SendInput, +{delete}
    return
}


kf_altEnter(){
    SendInput, !{Enter}
    return
}


kf_ctrlEnter(){
    SendInput, ^{Enter}
    return
}


kf_ctrlS(){
    SendInput, ^{s}
    return
}


kf_ctrlD(){
    SendInput, ^{d}
    return
}


kf_ctrlW(){
    SendInput, ^{w}
    return
}


kf_altLeft(){
    SendInput, !{Left}
    return
}


kf_altRight(){
    SendInput, !{Right}
    return
}


kf_altUp(){
    SendInput, !{Up}
    return
}


kf_altDown(){
    SendInput, !{Down}
    return
}


kf_comment(){
    SendInput, ^{/}
    return
}


kf_removeHyperlink(){
    SendInput, ^+{F9}
    return
}


kf_f1(){
    SendInput, {F1}
    return
}


kf_f2(){
    SendInput, {F2}
    return
}


kf_f3(){
    SendInput, {F3}
    return
}


kf_f4(){
    SendInput, {F4}
    return
}


kf_f5(){
    SendInput, {F5}
    return
}


kf_f6(){
    SendInput, {F6}
    return
}


kf_f7(){
    SendInput, {F7}
    return
}


kf_f8(){
    SendInput, {F8}
    return
}


kf_f9(){
    SendInput, {F9}
    return
}


kf_f10(){
    SendInput, {F10}
    return
}


kf_f11(){
    SendInput, {F11}
    return
}


kf_f12(){
    SendInput, {F12}
    return
}


kf_win1(){
    SendInput, #{1}
    return
}


kf_win2(){
    SendInput, #{2}
    return
}


kf_win3(){
    SendInput, #{3}
    return
}


kf_win4(){
    SendInput, #{4}
    return
}


kf_win5(){
    SendInput, #{5}
    return
}


kf_win6(){
    SendInput, #{6}
    return
}


kf_win7(){
    SendInput, #{7}
    return
}


kf_win8(){
    SendInput, #{8}
    return
}


kf_win9(){
    SendInput, #{9}
    return
}


kf_win10(){
    SendInput, #{0}
    return
}


; -------------------- combination key --------------------

; Ctrl + Func

kf_cf1(){
    SendInput, ^{F1}
    return
}


kf_cf2(){
    SendInput, ^{F2}
    return
}


kf_cf3(){
    SendInput, ^{F3}
    return
}


kf_cf4(){
    SendInput, ^{F4}
    return
}


kf_cf5(){
    SendInput, ^{F5}
    return
}


kf_cf6(){
    SendInput, ^{F6}
    return
}


kf_cf7(){
    SendInput, ^{F7}
    return
}


kf_cf8(){
    SendInput, ^{F8}
    return
}


kf_cf9(){
    SendInput, ^{F9}
    return
}


kf_cf10(){
    SendInput, ^{F10}
    return
}


kf_cf11(){
    SendInput, ^{F11}
    return
}


kf_cf12(){
    SendInput, ^{F12}
    return
}


; Shift + Func

kf_sf1(){
    SendInput, +{F1}
    return
}


kf_sf2(){
    SendInput, +{F2}
    return
}


kf_sf3(){
    SendInput, +{F3}
    return
}


kf_sf4(){
    SendInput, +{F4}
    return
}


kf_sf5(){
    SendInput, +{F5}
    return
}


kf_sf6(){
    SendInput, +{F6}
    return
}


kf_sf7(){
    SendInput, +{F7}
    return
}


kf_sf8(){
    SendInput, +{F8}
    return
}


kf_sf9(){
    SendInput, +{F9}
    return
}


kf_sf10(){
    SendInput, +{F10}
    return
}


kf_sf11(){
    SendInput, +{F11}
    return
}


kf_sf12(){
    SendInput, +{F12}
    return
}


; Alt + Func

kf_af1(){
    SendInput, !{F1}
    return
}


kf_af2(){
    SendInput, !{F2}
    return
}


kf_af3(){
    SendInput, !{F3}
    return
}


kf_af4(){
    SendInput, !{F4}
    return
}


kf_af5(){
    SendInput, !{F5}
    return
}


kf_af6(){
    SendInput, !{F6}
    return
}


kf_af7(){
    SendInput, !{F7}
    return
}


kf_af8(){
    SendInput, !{F8}
    return
}


kf_af9(){
    SendInput, !{F9}
    return
}


kf_af10(){
    SendInput, !{F10}
    return
}


kf_af11(){
    SendInput, !{F11}
    return
}


kf_af12(){
    SendInput, !{F12}
    return
}


; Ctrl + Alt + Func

kf_caf1(){
    SendInput, ^!{F1}
    return
}


kf_caf2(){
    SendInput, ^!{F2}
    return
}


kf_caf3(){
    SendInput, ^!{F3}
    return
}


kf_caf4(){
    SendInput, ^!{F4}
    return
}


kf_caf5(){
    SendInput, ^!{F5}
    return
}


kf_caf6(){
    SendInput, ^!{F6}
    return
}


kf_caf7(){
    SendInput, ^!{F7}
    return
}


kf_caf8(){
    SendInput, ^!{F8}
    return
}


kf_caf9(){
    SendInput, ^!{F9}
    return
}


kf_caf10(){
    SendInput, ^!{F10}
    return
}


kf_caf11(){
    SendInput, ^!{F11}
    return
}


kf_caf12(){
    SendInput, ^!{F12}
    return
}


; Ctrl + Shift + Func

kf_csf1(){
    SendInput, ^+{F1}
    return
}


kf_csf2(){
    SendInput, ^+{F2}
    return
}


kf_csf3(){
    SendInput, ^+{F3}
    return
}


kf_csf4(){
    SendInput, ^+{F4}
    return
}


kf_csf5(){
    SendInput, ^+{F5}
    return
}


kf_csf6(){
    SendInput, ^+{F6}
    return
}


kf_csf7(){
    SendInput, ^+{F7}
    return
}


kf_csf8(){
    SendInput, ^+{F8}
    return
}


kf_csf9(){
    SendInput, ^+{F9}
    return
}


kf_csf10(){
    SendInput, ^+{F10}
    return
}


kf_csf11(){
    SendInput, ^+{F11}
    return
}


kf_csf12(){
    SendInput, ^+{F12}
    return
}


kf_csLeft(){
    SendInput, ^+{Left}
    return
}


kf_csRight(){
    SendInput, ^+{Right}
    return
}


kf_csUp(){
    SendInput, ^+{Up}
    return
}


kf_csDown(){
    SendInput, ^+{Down}
    return
}


; Alt + Shift + Func

kf_asf1(){
    SendInput, !+{F1}
    return
}


kf_asf2(){
    SendInput, !+{F2}
    return
}


kf_asf3(){
    SendInput, !+{F3}
    return
}


kf_asf4(){
    SendInput, !+{F4}
    return
}


kf_asf5(){
    SendInput, !+{F5}
    return
}


kf_asf6(){
    SendInput, !+{F6}
    return
}


kf_asf7(){
    SendInput, !+{F7}
    return
}


kf_asf8(){
    SendInput, !+{F8}
    return
}


kf_asf9(){
    SendInput, !+{F9}
    return
}


kf_asf10(){
    SendInput, !+{F10}
    return
}


kf_asf11(){
    SendInput, !+{F11}
    return
}


kf_asf12(){
    SendInput, !+{F12}
    return
}
