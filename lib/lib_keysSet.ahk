keysInit:
global keyset:=CLSets.Keys


; ==================================================
; Single Key Setting
; ==================================================

if(!keyset.press_caps){
    keyset.press_caps:="kf_doNothing"
}

if(!keyset.press_space){
    keyset.press_space:="kf_keySpace"
}

if(!keyset.press_tab){
    keyset.press_tab:="kf_keyTab"
}

if(!keyset.press_esc){
    keyset.press_esc:="kf_keyEsc"
}

if(!keyset.press_bs){
    keyset.press_bs:="kf_keyBackspace"
}

;if(!keyset.press_sc){
;    keyset.press_sc:="kf_keySemicolon"
;}

$`;::
    KeyWait, `;, T0.4
    if(ErrorLevel) {
        KeyWait, `;
        return
    } else {
        SendInput, {;}
        return
    }
    return

if(!keyset.press_bsl){
    keyset.press_sc:="kf_keyBackslash"
}

if(!keyset.press_rsb){
    keyset.press_sc:="kf_keyRSBracket"
}


; ==================================================
; Mask CapsLock Combination Keys
; ==================================================

^CapsLock::
    return

+CapsLock::
    return

!CapsLock::
    return

#CapsLock::
    return

;Space & CapsLock::
;    return


; ==================================================
; CapsLock Key Setting
; ==================================================

#If GetKeyState("CapsLock", "P")
{
; --------------------------------------------------
; CapsLock Key Setting
; --------------------------------------------------

Esc::
    kf_doNothing()
    return

`::
    return

1::
    kf_f1()
    return

2::
    kf_f2()
    return

3::
    kf_f3()
    return

4::
    kf_f4()
    return

5::
    kf_f5()
    return

6::
    kf_f6()
    return

7::
    kf_f7()
    return

8::
    kf_f8()
    return

9::
    kf_f9()
    return

0::
    kf_f10()
    return

-::
    kf_f11()
    return

=::
    kf_f12()
    return

Backspace::
    kf_doNothing()
    return

Delete::
    kf_doNothing()
    return

; --------------------------------------------------

Tab::
    kf_doNothing()
    return

q::
    kf_esc()
    return

w::
    kf_moveWordLeft()
    return

e::
    kf_moveWordRight()
    return

r::
    kf_enter()
    return

t::
    kf_moveToBOF()
    return

y::
    kf_moveToEOF()
    return

u::
    kf_selectWord()
    return

i::
    kf_selectLine()
    return

o::
    kf_selectAll()
    return

p::
    kf_doubleSmallBrackets()
    return

[::
    kf_doubleMiddleBrackets()
    return

]::
    kf_doubleLargeBrackets()
    return

\::
    kf_sendChar("\")
    return

; --------------------------------------------------

a::
    return

s::
    kf_backspace()
    return

d::
    kf_delete()
    return

f::
    kf_home()
    return

g::
    kf_end()
    return

h::
    kf_moveLeft()
    return

j::
    kf_moveDown()
    return

k::
    kf_moveUp()
    return

l::
    kf_moveRight()
    return

`;::
    kf_sendSemicolon()
    return

'::
    kf_doubleSingleQuote()
    return

Enter::
    kf_doNothing()
    return

; --------------------------------------------------

z::
    kf_undo()
    return

x::
    kf_cut()
    return

c::
    kf_copy()
    return

v::
    kf_paste()
    return

b::
    kf_pageUp()
    return

n::
    kf_pageDown()
    return

m::
    kf_find()
    return

,::
    kf_sendComma()
    return

.::
    kf_sendDot()
    return

/::
    kf_sendChar("/")
    return

Space::
    return


; --------------------------------------------------
; CapsLock Addition Key Setting
; --------------------------------------------------

a & Esc::
    kf_doNothing()
    return

a & `::
    return

a & 1::
    kf_doNothing()
    return

a & 2::
    kf_doNothing()
    return

a & 3::
    kf_doNothing()
    return

a & 4::
    kf_doNothing()
    return

a & 5::
    kf_doNothing()
    return

a & 6::
    kf_doNothing()
    return

a & 7::
    kf_doNothing()
    return

a & 8::
    kf_doNothing()
    return

a & 9::
    kf_doubleCSquote()
    return

a & 0::
    kf_doubleCDquote()
    return

a & -::
    kf_sendChar("_")
    return

a & =::
    kf_doubleChar("_","_")
    return

a & Backspace::
    kf_doNothing()
    return

a & Delete::
    kf_doNothing()
    return

; --------------------------------------------------

a & Tab::
    kf_doNothing()
    return

a & q::
    kf_doNothing()
    return

a & w::
    kf_selectWordLeft()
    return

a & e::
    kf_selectWordRight()
    return

a & r::
    kf_ctrlEnter()
    return

a & t::
    kf_selectToBOF()
    return

a & y::
    kf_selectToEOF()
    return

a & u::
    kf_switchSelUpperCase()
    return

a & i::
    kf_switchInitUpperCase()
    return

a & o::
    kf_switchSelLowerCase()
    return

a & p::
    kf_deleteLine()
    return

a & [::
    kf_doubleLargeBrackets()
    return

a & ]::
    kf_doubleMiddleBrackets()
    return

a & \::
    kf_sendChar("|")
    return

; --------------------------------------------------

a & s::
    kf_ctrlS()
    return

a & d::
    kf_ctrlD()
    return

a & f::
    kf_selectHome()
    return

a & g::
    kf_selectEnd()
    return

a & h::
    kf_selectLeft()
    return

a & j::
    kf_selectDown()
    return

a & k::
    kf_selectUp()
    return

a & l::
    kf_selectRight()
    return

a & `;::
    kf_sendChar(":")
    return

a & '::
    kf_doubleDoubleQuote()
    return

a & Enter::
    kf_doNothing()
    return

; --------------------------------------------------

a & z::
    kf_doNothing()
    return

a & x::
    kf_copyPath()
    return

a & c::
    kf_showCopyQ()
    return

a & v::
    kf_redo()
    return

a & b::
    kf_selectPageUp()
    return

a & n::
    kf_selectPageDown()
    return

a & m::
    kf_replace()
    return

a & ,::
    kf_sendChar("<")
    return

a & .::
    kf_sendChar(">")
    return

a & /::
    kf_sendChar("?")
    return

a & Space::
    return


; --------------------------------------------------
; CapsLock Space Key Setting
; --------------------------------------------------

; Ctrl Shift Func Setting

Space & Esc::
    kf_doNothing()
    return

Space & `::
    return

Space & 1::
    kf_csf1()
    return

Space & 2::
    kf_csf2()
    return

Space & 3::
    kf_csf3()
    return

Space & 4::
    kf_csf4()
    return

Space & 5::
    kf_csf5()
    return

Space & 6::
    kf_csf6()
    return

Space & 7::
    kf_csf7()
    return

Space & 8::
    kf_csf8()
    return

Space & 9::
    kf_csf9()
    return

Space & 0::
    kf_csf10()
    return

Space & -::
    kf_csf11()
    return

Space & =::
    kf_csf12()
    return

Space & Backspace::
    kf_doNothing()
    return

Space & Delete::
    kf_doNothing()
    return

; --------------------------------------------------

Space & Tab::
    kf_doNothing()
    return

Space & q::
    kf_winSearch()
    return

Space & w::
    kf_runBrowser()
    return

Space & e::
    kf_explorer()
    return

Space & r::
    kf_winRun()
    return

Space & t::
    kf_terminal()
    return

Space & y::
    kf_taskManager()
    return

Space & u::
    kf_doNothing()
    return

Space & i::
    kf_settings()
    return

Space & o::
    kf_appsKey()
    return

Space & p::
    kf_notepad()
    return

Space & [::
    kf_doNothing()
    return

Space & ]::
    kf_doNothing()
    return

Space & \::
    kf_doNothing()
    return

; --------------------------------------------------

Space & a::
    return

Space & s::
    kf_screenshot()
    return

Space & d::
    kf_showDesktop()
    return

Space & f::
    kf_lastDesktop()
    return

Space & g::
    kf_nextDesktop()
    return

Space & h::
    kf_windowLeft()
    return

Space & j::
    kf_minWindow()
    return

Space & k::
    kf_maxWindow()
    return

Space & l::
    kf_windowRight()
    return

Space & `;::
    kf_doNothing()
    return

Space & '::
    kf_doNothing()
    return

Space & Enter::
    kf_winX()
    return

; --------------------------------------------------

Space & z::
    kf_doNothing()
    return

Space & x::
    kf_doNothing()
    return

Space & c::
    kf_doNothing()
    return

Space & v::
    kf_doNothing()
    return

Space & b::
    kf_doNothing()
    return

Space & n::
    kf_doNothing()
    return

Space & m::
    kf_doNothing()
    return

Space & ,::
    kf_doNothing()
    return

Space & .::
    kf_doNothing()
    return

Space & /::
    kf_doNothing()
    return
}
#If


; ==================================================
; Space Key Setting
; ==================================================

#If GetKeyState("Space", "P")
{
Esc::
    kf_toggleCapsLock()
    return

`::
    return

1::
    kf_win1()
    return

2::
    kf_win2()
    return

3::
    kf_win3()
    return

4::
    kf_win4()
    return

5::
    kf_win5()
    return

6::
    kf_win6()
    return

7::
    kf_win7()
    return

8::
    kf_win8()
    return

9::
    kf_doNothing()
    return

0::
    kf_volumeMute()
    return

-::
    kf_volumeDown()
    return

=::
    kf_volumeUp()
    return

Backspace::
    kf_toggleNumLock()
    return

Delete::
    kf_doNothing()
    return

; --------------------------------------------------

Tab::
    kf_tabScript()
    return

q::
    kf_doNothing()
    return

w::
    kf_doNothing()
    return

e::
    kf_doNothing()
    return

r::
    kf_doNothing()
    return

t::
    kf_doNothing()
    return

y::
    kf_doNothing()
    return

u::
    kf_doNothing()
    return

i::
    kf_doNothing()
    return

o::
    kf_doNothing()
    return

p::
    kf_doNothing()
    return

[::
    kf_doNothing()
    return

]::
    kf_doNothing()
    return

\::
    kf_doNothing()
    return

; --------------------------------------------------

CapsLock::
    return

a::
    kf_doNothing()
    return

s::
    kf_doNothing()
    return

d::
    kf_doNothing()
    return

f::
    kf_doNothing()
    return

g::
    kf_doNothing()
    return

h::
    kf_doNothing()
    return

j::
    kf_doNothing()
    return

k::
    kf_doNothing()
    return

l::
    kf_doNothing()
    return

`;::
    kf_comment()
    return

'::
    kf_doNothing()
    return

Enter::
    kf_lockScreen()
    return

; --------------------------------------------------

z::
    kf_doNothing()
    return

x::
    kf_doNothing()
    return

c::
    kf_doNothing()
    return

v::
    kf_doNothing()
    return

b::
    kf_doNothing()
    return

n::
    kf_doNothing()
    return

m::
    kf_doNothing()
    return

,::
    kf_doNothing()
    return

.::
    kf_doNothing()
    return

/::
    kf_doNothing()
    return
}
#If


; ==================================================
; Semicolon Key Setting
; ==================================================

#If GetKeyState(";", "P")
{
Esc::
    kf_doNothing()
    return

`::
    return

1::
    kf_sendChar("!")
    return

2::
    kf_sendChar("@")
    return

3::
    kf_sendChar("#")
    return

4::
    kf_sendChar("$")
    return

5::
    kf_sendChar("%")
    return

6::
    kf_sendChar("^")
    return

7::
    kf_sendChar("&")
    return

8::
    kf_sendChar("*")
    return

9::
    kf_doubleSmallBrackets()
    return

0::
    kf_doNothing()
    return

-::
    kf_doNothing()
    return

=::
    kf_doNothing()
    return

Backspace::
    kf_doNothing()
    return

Delete::
    kf_doNothing()
    return

; --------------------------------------------------

Tab::
    kf_doNothing()
    return

q::
    kf_sendChar("``")
    return

w::
    kf_sendChar("~")
    return

e::
    kf_sendChar("=")
    return

r::
    kf_sendChar("!")
    return

t::
    kf_sendChar("+")
    return

y::
    kf_sendChar("-")
    return

u::
    kf_doubleSmallBrackets()
    return

i::
    kf_doubleMiddleBrackets()
    return

o::
    kf_doubleLargeBrackets()
    return

p::
    kf_doNothing()
    return

[::
    kf_doNothing()
    return

]::
    kf_doNothing()
    return

\::
    kf_doNothing()
    return

; --------------------------------------------------

a::
    kf_doubleBackquote()
    return

s::
    kf_doubleSingleQuote()
    return

d::
    kf_doubleDoubleQuote()
    return

f::
    kf_sendChar("<")
    return

g::
    kf_sendChar(">")
    return

h::
    kf_sendDot()
    return

j::
    kf_sendComma()
    return

k::
    kf_sendSemicolon()
    return

l::
    kf_sendChar(":")
    return

'::
    kf_doNothing()
    return

Enter::
    kf_doNothing()
    return

; --------------------------------------------------

z::
    kf_sendChar("->")
    return

x::
    kf_sendChar("\")
    return

c::
    kf_sendChar("/")
    return

v::
    kf_sendChar("|")
    return

b::
    kf_doubleChar("_","_")
    return

n::
    kf_sendChar("_")
    return

m::
    kf_sendChar("?")
    return

,::
    kf_doubleChar("<",">")
    return

.::
    kf_doNothing()
    return

/::
    kf_doNothing()
    return

Space::
    return
}
#If


; ==================================================
; Tab Key Setting
; ==================================================

#If GetKeyState("Tab", "P")
{
; Ctrl Func Setting

Esc::
    kf_doNothing()
    return

`::
    return

1::
    kf_cf1()
    return

2::
    kf_cf2()
    return

3::
    kf_cf3()
    return

4::
    kf_cf4()
    return

5::
    kf_cf5()
    return

6::
    kf_cf6()
    return

7::
    kf_cf7()
    return

8::
    kf_cf8()
    return

9::
    kf_cf9()
    return

0::
    kf_cf10()
    return

-::
    kf_cf11()
    return

=::
    kf_cf12()
    return

Backspace::
    kf_doNothing()
    return

Delete::
    kf_doNothing()
    return

; --------------------------------------------------

q::
    kf_doNothing()
    return

w::
    kf_ctrlW()
    return

e::
    kf_doNothing()
    return

r::
    kf_doNothing()
    return

t::
    kf_doNothing()
    return

y::
    kf_doNothing()
    return

u::
    kf_doNothing()
    return

i::
    kf_doNothing()
    return

o::
    kf_doNothing()
    return

p::
    kf_doNothing()
    return

[::
    kf_doNothing()
    return

]::
    kf_doNothing()
    return

\::
    kf_doNothing()
    return

; --------------------------------------------------

a::
    kf_doNothing()
    return

s::
    kf_doNothing()
    return

d::
    kf_doNothing()
    return

f::
    kf_doNothing()
    return

g::
    kf_doNothing()
    return

h::
    kf_altLeft()
    return

j::
    kf_altDown()
    return

k::
    kf_altUp()
    return

l::
    kf_altRight()
    return

`;::
    kf_doNothing()
    return

'::
    kf_doNothing()
    return

Enter::
    kf_doNothing()
    return

; --------------------------------------------------

z::
    kf_doNothing()
    return

x::
    kf_doNothing()
    return

c::
    kf_doNothing()
    return

v::
    kf_doNothing()
    return

b::
    kf_doNothing()
    return

n::
    kf_doNothing()
    return

m::
    kf_doNothing()
    return

,::
    kf_doNothing()
    return

.::
    kf_doNothing()
    return

/::
    kf_doNothing()
    return

Space::
    kf_doNothing()
    return
}
#If


; ==================================================
; Esc Key Setting
; ==================================================

#If GetKeyState("Esc", "P")
{
; Shift Func Setting

`::
    return

1::
    kf_sf1()
    return

2::
    kf_sf2()
    return

3::
    kf_sf3()
    return

4::
    kf_sf4()
    return

5::
    kf_sf5()
    return

6::
    kf_sf6()
    return

7::
    kf_sf7()
    return

8::
    kf_sf8()
    return

9::
    kf_sf9()
    return

0::
    kf_sf10()
    return

-::
    kf_sf11()
    return

=::
    kf_sf12()
    return

Backspace::
    kf_doNothing()
    return

Delete::
    kf_doNothing()
    return

; --------------------------------------------------

Tab::
    kf_doNothing()
    return

q::
    kf_doNothing()
    return

w::
    kf_doNothing()
    return

e::
    kf_doNothing()
    return

r::
    kf_altEnter()
    return

t::
    kf_doNothing()
    return

y::
    kf_doNothing()
    return

u::
    kf_doNothing()
    return

i::
    kf_doNothing()
    return

o::
    kf_doNothing()
    return

p::
    kf_doNothing()
    return

[::
    kf_doNothing()
    return

]::
    kf_doNothing()
    return

\::
    kf_doNothing()
    return

; --------------------------------------------------

a::
    kf_doNothing()
    return

s::
    kf_doNothing()
    return

d::
    kf_doNothing()
    return

f::
    kf_doNothing()
    return

g::
    kf_doNothing()
    return

h::
    kf_csLeft()
    return

j::
    kf_csDown()
    return

k::
    kf_csUP()
    return

l::
    kf_csRight()
    return

`;::
    kf_doNothing()
    return

'::
    kf_doNothing()
    return

Enter::
    kf_doNothing()
    return

; --------------------------------------------------

z::
    kf_doNothing()
    return

x::
    kf_doNothing()
    return

c::
    kf_doNothing()
    return

v::
    kf_doNothing()
    return

b::
    kf_doNothing()
    return

n::
    kf_doNothing()
    return

m::
    kf_doNothing()
    return

,::
    kf_doNothing()
    return

.::
    kf_doNothing()
    return

/::
    kf_doNothing()
    return

Space::
    kf_doNothing()
    return
}
#If


; ==================================================
; Backspace Key Setting
; ==================================================

#If GetKeyState("Backspace", "P")
{
; Alt Shift Func Setting

Esc::
    kf_doNothing()
    return

`::
    return

1::
    kf_asf1()
    return

2::
    kf_asf2()
    return

3::
    kf_asf3()
    return

4::
    kf_asf4()
    return

5::
    kf_asf5()
    return

6::
    kf_asf6()
    return

7::
    kf_asf7()
    return

8::
    kf_asf8()
    return

9::
    kf_asf9()
    return

0::
    kf_asf10()
    return

-::
    kf_asf11()
    return

=::
    kf_asf12()
    return

; --------------------------------------------------

Tab::
    kf_doNothing()
    return

q::
    kf_doNothing()
    return

w::
    kf_doNothing()
    return

e::
    kf_doNothing()
    return

r::
    kf_doNothing()
    return

t::
    kf_doNothing()
    return

y::
    kf_doNothing()
    return

u::
    kf_doNothing()
    return

i::
    kf_doNothing()
    return

o::
    kf_doNothing()
    return

p::
    kf_doNothing()
    return

[::
    kf_doNothing()
    return

]::
    kf_doNothing()
    return

\::
    kf_doNothing()
    return

; --------------------------------------------------

a::
    kf_doNothing()
    return

s::
    kf_doNothing()
    return

d::
    kf_doNothing()
    return

f::
    kf_doNothing()
    return

g::
    kf_doNothing()
    return

h::
    kf_doNothing()
    return

j::
    kf_doNothing()
    return

k::
    kf_doNothing()
    return

l::
    kf_doNothing()
    return

`;::
    kf_doNothing()
    return

'::
    kf_doNothing()
    return

Enter::
    kf_doNothing()
    return

; --------------------------------------------------

z::
    kf_doNothing()
    return

x::
    kf_doNothing()
    return

c::
    kf_doNothing()
    return

v::
    kf_doNothing()
    return

b::
    kf_doNothing()
    return

n::
    kf_doNothing()
    return

m::
    kf_doNothing()
    return

,::
    kf_doNothing()
    return

.::
    kf_doNothing()
    return

/::
    kf_doNothing()
    return

Space::
    kf_doNothing()
    return
}
#If


; ==================================================
; Backslash Key Setting
; ==================================================

#If GetKeyState("\", "P")
{
; Alt Func Setting

Esc::
    kf_doNothing()
    return

`::
    return

1::
    kf_af1()
    return

2::
    kf_af2()
    return

3::
    kf_af3()
    return

4::
    kf_af4()
    return

5::
    kf_af5()
    return

6::
    kf_af6()
    return

7::
    kf_af7()
    return

8::
    kf_af8()
    return

9::
    kf_af9()
    return

0::
    kf_af10()
    return

-::
    kf_af11()
    return

=::
    kf_af12()
    return

Backspace::
    kf_doNothing()
    return

Delete::
    return

; --------------------------------------------------

Tab::
    kf_doNothing()
    return

q::
    kf_doNothing()
    return

w::
    kf_doNothing()
    return

e::
    kf_doNothing()
    return

r::
    kf_doNothing()
    return

t::
    kf_doNothing()
    return

y::
    kf_doNothing()
    return

u::
    kf_doNothing()
    return

i::
    kf_doNothing()
    return

o::
    kf_doNothing()
    return

p::
    kf_doNothing()
    return

[::
    kf_doNothing()
    return

]::
    kf_doNothing()
    return

; --------------------------------------------------

a::
    kf_doNothing()
    return

s::
    kf_doNothing()
    return

d::
    kf_doNothing()
    return

f::
    kf_doNothing()
    return

g::
    kf_doNothing()
    return

h::
    kf_doNothing()
    return

j::
    kf_doNothing()
    return

k::
    kf_doNothing()
    return

l::
    kf_doNothing()
    return

`;::
    kf_doNothing()
    return

'::
    kf_doNothing()
    return

Enter::
    kf_doNothing()
    return

; --------------------------------------------------

z::
    kf_doNothing()
    return

x::
    kf_doNothing()
    return

c::
    kf_doNothing()
    return

v::
    kf_doNothing()
    return

b::
    kf_doNothing()
    return

n::
    kf_doNothing()
    return

m::
    kf_doNothing()
    return

,::
    kf_doNothing()
    return

.::
    kf_doNothing()
    return

/::
    kf_doNothing()
    return

Space::
    kf_doNothing()
    return
}
#If


; ==================================================
; Right Square Bracket Setting
; ==================================================

#If GetKeyState("]", "P")
{
; Ctrl Alt Func Setting

Esc::
    kf_doNothing()
    return

`::
    return

1::
    kf_caf1()
    return

2::
    kf_caf2()
    return

3::
    kf_caf3()
    return

4::
    kf_caf4()
    return

5::
    kf_caf5()
    return

6::
    kf_caf6()
    return

7::
    kf_caf7()
    return

8::
    kf_caf8()
    return

9::
    kf_caf9()
    return

0::
    kf_caf10()
    return

-::
    kf_caf11()
    return

=::
    kf_caf12()
    return

Backspace::
    kf_doNothing()
    return

Delete::
    return

; --------------------------------------------------

Tab::
    kf_doNothing()
    return

q::
    kf_doNothing()
    return

w::
    kf_doNothing()
    return

e::
    kf_doNothing()
    return

r::
    kf_doNothing()
    return

t::
    kf_doNothing()
    return

y::
    kf_doNothing()
    return

u::
    kf_doNothing()
    return

i::
    kf_doNothing()
    return

o::
    kf_doNothing()
    return

p::
    kf_doNothing()
    return

[::
    kf_doNothing()
    return

\::
    kf_doNothing()
    return

; --------------------------------------------------

a::
    kf_doNothing()
    return

s::
    kf_doNothing()
    return

d::
    kf_doNothing()
    return

f::
    kf_doNothing()
    return

g::
    kf_doNothing()
    return

h::
    kf_doNothing()
    return

j::
    kf_doNothing()
    return

k::
    kf_doNothing()
    return

l::
    kf_doNothing()
    return

`;::
    kf_doNothing()
    return

'::
    kf_doNothing()
    return

Enter::
    kf_doNothing()
    return

; --------------------------------------------------

z::
    kf_doNothing()
    return

x::
    kf_doNothing()
    return

c::
    kf_doNothing()
    return

v::
    kf_doNothing()
    return

b::
    kf_doNothing()
    return

n::
    kf_doNothing()
    return

m::
    kf_doNothing()
    return

,::
    kf_doNothing()
    return

.::
    kf_doNothing()
    return

/::
    kf_doNothing()
    return

Space::
    kf_doNothing()
    return
}
#If


; ==================================================
; NumLock Off
; ==================================================

#If !GetKeyState("NumLock", "T")
{
Esc::
    kf_doNothing()
    return

`::
    return

1::
    kf_doNothing()
    return

2::
    kf_doNothing()
    return

3::
    kf_doNothing()
    return

4::
    kf_doNothing()
    return

5::
    kf_doNothing()
    return

6::
    kf_doNothing()
    return

7::
    kf_sendChar("7")
    return

8::
    kf_sendChar("8")
    return

9::
    kf_sendChar("9")
    return

0::
    kf_doubleSmallBrackets()
    return

-::
    kf_sendChar("-")
    return

=::
    kf_sendChar("+")
    return

Backspace::
    kf_backspace()
    return

Delete::
    kf_delete()
    return

; --------------------------------------------------

Tab::
    kf_doNothing()
    return

q::
    kf_doNothing()
    return

w::
    kf_doNothing()
    return

e::
    kf_doNothing()
    return

r::
    kf_doNothing()
    return

t::
    kf_doNothing()
    return

y::
    kf_doNothing()
    return

u::
    kf_sendChar("4")
    return

i::
    kf_sendChar("5")
    return

o::
    kf_sendChar("6")
    return

p::
    kf_sendChar("_")
    return

[::
    kf_doubleMiddleBrackets()
    return

]::
    kf_doubleLargeBrackets()
    return

\::
    kf_sendChar("\")
    return

; --------------------------------------------------

a::
    kf_doNothing()
    return

s::
    kf_doNothing()
    return

d::
    kf_doNothing()
    return

f::
    kf_doNothing()
    return

g::
    kf_doNothing()
    return

h::
    kf_doNothing()
    return

j::
    kf_sendChar("1")
    return

k::
    kf_sendChar("2")
    return

l::
    kf_sendChar("3")
    return

`;::
    kf_sendSemicolon()
    return

'::
    kf_doubleSingleQuote()
    return

Enter::
    kf_enter()
    return

; --------------------------------------------------

z::
    kf_doNothing()
    return

x::
    kf_doNothing()
    return

c::
    kf_doNothing()
    return

v::
    kf_doNothing()
    return

b::
    kf_doNothing()
    return

n::
    kf_doNothing()
    return

m::
    kf_sendChar("0")
    return

,::
    kf_sendComma()
    return

.::
    kf_sendDot()
    return

/::
    kf_sendChar("/")
    return

Space::
    kf_keySpace()
    return
}
#If
