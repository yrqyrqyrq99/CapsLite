language_Simplified_Chinese:

global lang_settingsFileContent:=""
lang_settingsFileContent=
(
;------------ Encoding: UTF-16 ------------
;请对照 CL_Demo.ini 来配置相关设置
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
; # CapsLite 设置样本
; - ******请务必阅读以下说明：******

; - 这里的设置是只读的，仅作说明参考，不要修改这里的设置（修改了也没用），需要自定义设置请在 CL_Settings.ini 中的对应段名中作添加修改
; - 例如，需要开启开机自启动，请在 CL_Settings.ini 的 [Global] 下添加：autostart=1，并保存

; - "[]"里面是段名，不能修改
; - 各段下所有设置的格式都为：键名=键值，每行一个
; - 虽然 QSearch,QRun 和 QWeb 是不同的段，理论上它们的键名可以重复，但请不要这样设置，否则 +Q 的快速启动功能会无法区分
; - 分号开头的是注释行，注释行不影响设置，就像这几行


;----------------------------------------------------------------
; ## 全局设置
[Global]
; 是否开机自启动，1为是，0为否（默认）
autostart=0

; 需要加载的 JavaScript 文件，以逗号分隔，文件应放在与 CapsLite 程序同文件夹下的 loadScript 文件夹
; JS 文件将会按照顺序加载，加载完后 +Tab 可以使用里面的函数
; 在本设置不为空时，启动 CapsLite 时将自动创建 loadScript 文件夹，以及位于文件夹中的 debug.html 和 scriptDemo.js 文件
loadScript=myScript1.js, myScript2.js, myScript3.js, myScript4.js

; 是否允许独立剪贴板功能，1为是（默认），0为否
allowClipboard=1

; 是否开启程序加载动画，1是（默认），0否
loadingAnimation=1

;----------------------------------------------------------------
[QSearch]

default=https://www.baidu.com/s?wd={q}
bd=https://www.baidu.com/s?wd={q}
g   <google>=https://www.google.com/search?q={q}
tb  <taobao>=http://s.taobao.com/search?q={q}
wk=https://zh.wikipedia.org/w/index.php?search={q}
m=https://developer.mozilla.org/zh-CN/search?q={q}


;----------------------------------------------------------------
; ## TabScript 的字符替换设置

[TabHotString]
cl=CapsLite
)


lang_settingsDemoFileContent_2=
(
; ## 按键功能设置
; - 以下设置键名是按键组合名，键值是对应功能

[Keys]
; 短按 CapsLock -> 发送 Esc
; press_caps=kf_esc
)


; keysFunction.ahk
global lang_kf_getDebugText:=""
lang_kf_getDebugText=
(
供 TabScript 调试用字符串
点击"OK"将它复制到剪贴板
)
return
