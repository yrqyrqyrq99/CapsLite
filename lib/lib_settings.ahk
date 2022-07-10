/*
提出settings.ini的设置信息
*/

settingsInit:
global settingsModifyTime ; 设置文件的修改时间
global CLSets:={} ; 保存 CL_Settings.ini 的各种设置
CLSets.length:={} ; 保存 Settings.ini 中每个字段的关键词数量
global setsChanges:={} ; 保存哪些设置经过改变
; Settings.ini 里面所有字段名，有更新必须修改这里，否则会无法获取
global iniSections:=["Global","TabHotString","Keys","QSearch","QRun","QWeb"]
FileGetTime, settingsModifyTime, CL_Settings.ini

;init CL_Demo.ini and CL_Settings.ini
IfNotExist, CL_Demo.ini
{       
    FileAppend, %lang_settingsDemoFileContent_1%, CL_Demo.ini, UTF-16
    FileAppend, %lang_settingsDemoFileContent_2%, CL_Demo.ini, UTF-16
    FileSetAttrib, +R, CL_Demo.ini
}
else
{
    FileGetTime, setDemoModifyTime, CL_Demo.ini
    IfExist, language
    {
        FileGetTime, thisScriptModifyTime, language
    }
    else
    {
        FileGetTime, thisScriptModifyTime, %A_ScriptName%
    }
    
    thisScriptModifyTime -= setDemoModifyTime, S
    if(thisScriptModifyTime > 0) ; 如果主程序文件比较新，那就是更新过，那就覆盖一遍
    {
        FileSetAttrib, -R, CL_Demo.ini
        FileDelete, CL_Demo.ini
        FileAppend, %lang_settingsDemoFileContent_1%, CL_Demo.ini, UTF-16
        FileAppend, %lang_settingsDemoFileContent_2%, CL_Demo.ini, UTF-16
        FileSetAttrib, +R, CL_Demo.ini
    }
}
IfNotExist, CL_Settings.ini
{   
    FileAppend, %lang_settingsFileContent%, CL_Settings.ini, UTF-16
}
lang_settingsDemoFileContent_1:=""
lang_settingsDemoFileContent_2:=""
lang_settingsFileContent:=""
; IniRead, settingsSections, CL_Settings.ini, , , %A_Space%
; sectionArr:=StrSplit(settingsSections,"`n")
for key,sectionValue in iniSections
{
    setsChanges[sectionValue]:={}
    setsChanges[sectionValue].deleted:={}
    setsChanges[sectionValue].modified:={}
    setsChanges[sectionValue].appended:={}
    settingsSectionInit(sectionValue)
}
gosub, keysInit
SetTimer, globalSettings, -1
SetTimer, setShortcutKey, -1
SetTimer, hotStringInit, -1
SetTimer, monitorSettingsFile, 500
return

; 监控设置文件的修改，并作出改动
monitorSettingsFile:
FileGetTime, latestModifyTime, CL_Settings.ini
if(latestModifyTime!=settingsModifyTime)
{
    settingsModifyTime:=latestModifyTime
    ; IniRead, settingsSections, CL_Settings.ini, , , %A_Space%
    ; sectionArr:=StrSplit(settingsSections,"`n")

    for key,sectionValue in iniSections
    {
        isChange%sectionValue%:=settingsSectionInit(sectionValue)
        _test:=isChange%sectionValue%
        
    }
    if(isChangeKeys)
    {
        SetTimer, keysInit, -1
    }
    if(isChangeGlobal) ; 如果 global 改过
    {
        
        for key1 in setsChanges.Global
        {
            for key2 in setsChanges.Global[key1]
            {
                if(key2="autostart")
                    SetTimer, globalSettings, -1
                else if(key2="loadScript")
                    SetTimer, jsEval_init, -1
            }
        }
    }
    if(isChangeTabHotString)
    {
        SetTimer, hotStringInit, -1
    }
}
return

getShortSetKey(str)
{
    return RegExReplace(str, "\s*<.*>$")
}

settingsSectionInit(sectionValue)
{
    isChange:=0 ; 这个字段是否有改动过
    IniRead, settingsKeys, CL_Settings.ini, %sectionValue%, , %A_Space%
    settingsKeys:=RegExReplace(settingsKeys, "m`n)=.*$")
    keyArr:=StrSplit(settingsKeys,"`n")
    
    
    tempLen:=CLSets.length[sectionValue]
    if tempLen is not number ; 如果还没初始化过
    {
        CLSets[sectionValue]:={}
        _clsetsSec:=CLSets[sectionValue]
        CLSets.length[sectionValue]:=0
        
        for key,keyValue in keyArr
        {
            IniRead, setValue, CL_Settings.ini, %sectionValue%, %keyValue%, %A_Space%
            
            if sectionValue in QSearch,QRun,QWeb ; 如果是这些里面的，用对象来保存，否则直接 key=value
            {
                shortKey:=getShortSetKey(keyValue) ; 从 abc(xxx) 中提取出 abc，用来作关键字
                _clsetsSec[shortKey]:={}
                _t:=_clsetsSec[shortKey]
                _t.fullKey:=keyValue
                _t.setValue:=setValue
            }
            else if(sectionValue="Keys")
            {
                ; 如果是 keys 项的值，控制它们的开头必须为 "kf_" ，以避免调用到其他非 kf_ 函数
                ; 同时，也就要求所有按键函数名应该以 "kf_" 开头
                if(SubStr(setValue,1,8)="kf_"){
                    _clsetsSec[keyValue]:=setValue
                }
            }
            else
            {
                _clsetsSec[keyValue]:=setValue
            }
            CLSets.length[sectionValue]++
        }
    }
    else
    {
        _clsetsSec:=CLSets[sectionValue]
        if sectionValue in QSearch,QRun,QWeb
        {
            for key,value in  _clsetsSec
            {
                _fullKey:=value.fullKey
                IniRead, valNew, CL_Settings.ini, %sectionValue%, %_fullKey%, %A_Space%
                if(valNew="") ;已删除
                {
                    setsChanges[sectionValue].deleted.insert(_fullKey)
                    isChange:=1
                }
                else
                {
                    if(value.setValue!=valNew)
                    {
                        shortKey:=getShortSetKey(key)
                        _t:=_clsetsSec[shortKey]
                        _t.fullKey:=key
                        _t.setValue:=valNew
                        setsChanges[sectionValue].modified[key]:=valNew
                        isChange:=1
                    }
                }
            }

            for key, value in setsChanges[sectionValue].deleted
            {
                _clsetsSec.remove(value)
                CLSets.length[sectionValue]--
            }
            
            for key,value in keyArr
            {
                valOld:=_clsetsSec[getShortSetKey(value)].setValue
                if(!(valOld=0||valOld))
                {
                    IniRead, valNew, CL_Settings.ini, %sectionValue%, %value%, %A_Space%
                    shortKey:=getShortSetKey(value)
                    _clsetsSec[shortKey]:={}
                    _t:=_clsetsSec[shortKey]
                    _t.fullKey:=value
                    _t.setValue:=valNew
                    CLSets.length[sectionValue]++
                    setsChanges[sectionValue].appended[value]:=valNew
                    isChange:=1
                }
            }
        }
        else
        {
            for key,value in  _clsetsSec
            {
                IniRead, valNew, CL_Settings.ini, %sectionValue%, %key%, %A_Space%
                if(valNew="")
                {
                    setsChanges[sectionValue].deleted.insert(key)
                    isChange:=1
                }
                else
                {
                    if(value!=valNew)
                    {
                        _clsetsSec[key]:=valNew
                        setsChanges[sectionValue].modified[key]:=valNew
                        isChange:=1
                    }
                }
            }

            for key, value in setsChanges[sectionValue].deleted
            {
                _clsetsSec.remove(value)
                CLSets.length[sectionValue]--
            }

            for key,value in keyArr
            {
                valOld:=_clsetsSec[value]
                if(!(valOld=0||valOld))
                {
                    IniRead, valNew, CL_Settings.ini, %sectionValue%, %value%, %A_Space%
                    _clsetsSec[value]:=valNew
                    CLSets.length[sectionValue]++
                    setsChanges[sectionValue].appended[value]:=valNew
                    isChange:=1
                }
            }
        }
    }
return isChange
}


globalSettings:
; scriptNameNoSuffix:=RegExReplace(A_ScriptName , "i)(\.ahk|\.exe)$")
; ----------auto start-------------
autostartLnk:=A_StartupCommon . "\CapsLite.lnk"
if(CLsets.global.autostart) ;如果开启开机自启动
{
    IfExist, % autostartLnk
    {
        FileGetShortcut, %autostartLnk%, lnkTarget
        if(lnkTarget!=A_ScriptFullPath)
            FileCreateShortcut, %A_ScriptFullPath%, %autostartLnk%, %A_WorkingDir%
    }
    else
    {
        FileCreateShortcut, %A_ScriptFullPath%, %autostartLnk%, %A_WorkingDir%
    }
}
else
{
    IfExist, % autostartLnk
    {
        FileDelete, %autostartLnk%
    }
}

if(CLsets.Global.allowClipboard!="0")
    CLsets.Global.allowClipboard:=1

return

setShortcutKey:
startMenuLnk:=A_ProgramsCommon . "\CapsLite.lnk"
IfExist, % startMenuLnk
{
    FileGetShortcut, %startMenuLnk%, lnkTarget
    if(lnkTarget!=A_ScriptFullPath)
        ;FileCreateShortcut, %A_ScriptFullPath%, %startMenuLnk%, %A_WorkingDir%, , , , Capslock
        FileCreateShortcut, %A_ScriptFullPath%, %startMenuLnk%, %A_WorkingDir%
}
else
{
    ;FileCreateShortcut, %A_ScriptFullPath%, %startMenuLnk%, %A_WorkingDir%, , , , Capslock
    FileCreateShortcut, %A_ScriptFullPath%, %startMenuLnk%, %A_WorkingDir%
}
return

; Caps+Tab 热字串替换初始化
hotStringInit:
global regexHotString:="iS)("
for key,value in CLSets.TabHotString
{
    regexHotString.="\Q" . key . "\E" . "|"
}
for key,value in CLSets.QRun
{
    regexHotString.="\Q" . key . "\E" . "|"
}
for key,value in CLSets.QWeb
{
    regexHotString.="\Q" . key . "\E" . "|"
}
regexHotString.=")$"
return

CLhotString()
{
    matchKey:=""
    RegExMatch(Clipboard, regexHotString, matchKey)
    if(matchKey)
    {
        if(CLSets.TabHotString[matchKey])
        {
            temp:=RegExReplace(Clipboard, "\Q" . matchKey . "\E$", CLSets.TabHotString[matchKey])
            StringReplace, temp, temp, \n, `n, All ;替换换行符
            StringReplace, temp, temp, \`n, \n, All ;有转义符的换回来
            Clipboard:=temp
        }
        else if(IsObject(CLSets.QRun[matchKey]))
        {
            Clipboard:=RegExReplace(Clipboard, "\Q" . matchKey . "\E$", CLSets.QRun[matchKey].setValue)
        }
        else
        {
            Clipboard:=RegExReplace(Clipboard, "\Q" . matchKey . "\E$", CLSets.QWeb[matchKey].setValue)
        }
    }
    return matchKey
}



