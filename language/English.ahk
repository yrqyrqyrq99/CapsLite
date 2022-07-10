language_English:

global lang_settingsFileContent:=""
lang_settingsFileContent=
(
;------------ Encoding: UTF-16 ------------
; Please refer to CL_Demo.ini to configure settings
[Global]

loadScript=scriptDemo.js

[QSearch]

[QRun]

[QWeb]

[TabHotString]

[Keys]

)


global lang_settingsDemoFileContent_1:=""
global lang_settingsDemoFileContent_2:=""
lang_settingsDemoFileContent_1=
(
;------------ Encoding: UTF-16 ------------
; # CapsLite Settings Demo
; ****** PLEASE READ THE FOLLOWING INSTRUCTIONS: ******

; - The settings here are read-only, just for demonstration, don't modify the settings here, please write settings in CL_Settings.ini.
; - For example, if you need to turn on the auto start, please insert a line: autostart=1 under [Global] in CL_Settings.ini, and save.

; - "[xxx]" is the section name, which cannot be modified.
; - The format of settings under each section is: key=value, one setting per line.
; - Although QSearch,QRun and QWeb are different sections, in theory, their key names can be repeated, but please keep them unique, otherwise, the quick start function of +Q will not work properly.
; - The line beginning with a semicolon is a comment line. Comment lines do not affect the settings, just like these lines.


;----------------------------------------------------------------
; ## Global Settings
[Global]
; Whether to start automatically after booting, 1 is yes, 0 is no (default).
autostart=0

; The JavaScript files that need to be loaded, separated by commas, and the files should be placed in the "loadScript" folder under the same folder as the CapsLite program.
; They will be loaded in order, after loading, +Tab can use the functions inside.
; When this setting is not empty, the "loadScript" folder and the "debug.html" and "scriptDemo.js" files located in the folder will be automatically created when CapsLite is launched.
loadScript=myScript1.js, myScript2.js, myScript3.js, myScript4.js

; Whether to allow independent clipboard, 1 is yes (default), 0 is no
allowClipboard=1

; Whether to show the startup loading animation, 1 is yes (default), 0 is no
loadingAnimation=1

;----------------------------------------------------------------
[QSearch]

default=https://www.google.com/search?q={q}
bd=https://www.baidu.com/s?wd={q}
g   <google>=https://www.google.com/search?q={q}
tb  <taobao>=http://s.taobao.com/search?q={q}
wk=https://zh.wikipedia.org/w/index.php?search={q}
m=https://developer.mozilla.org/zh-CN/search?q={q}


;----------------------------------------------------------------;
; ## The hotstring settings of TabScript

[TabHotString]
cl=CapsLite
)


lang_settingsDemoFileContent_2=
(
; ## Hotkey settings
; - The following setting key name is the hotkey name, the key value is the corresponding function.

[Keys]
; Tap CapsLock -> Send input: Esc
; press_caps=keyFunc_esc
)


; keysFunction.ahk
global lang_kf_getDebugText:=""
lang_kf_getDebugText=
(
The string for debug TabScript
Click "OK" to copy it to the clipboard.
)
return
