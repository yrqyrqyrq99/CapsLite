; 1. Just put the functions here.
;    A key function must start with "kf_" (case insensitive)

; 2. Add a setting under the [Keys] section in `CL_Settings.ini`

; Example:
; 1. Here is a key function `kf_example`.
; 2. Add below setting under the [Keys] section in `CL_Settings.ini`:
;    caps_f7=kf_example
; 3. Save, reload CapsLite

kf_example(){
  msgbox, example
}
