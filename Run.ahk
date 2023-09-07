; Ctrl-Alt-C - запустить Калькулятор
^!C::
{
    if WinExist("ahk_class ApplicationFrameWindow")
        WinActivate
    else
        Run "calc"
}
; Ctrl-Alt-N - запустить Блокнот
^!N::
{
    File := EnvGet("USERPROFILE") . "\Documents\" . FormatTime(,"yyyy-MM-dd") . ".md"
    if WinActive("ahk_exe notepad.exe")
        WinClose
    else if WinExist("ahk_exe notepad.exe")
        WinActivate
    else if FileExist(File)
        Run "notepad " . File
    else
        Run "notepad"
}
; Ctrl-Alt-P - запустить PowerShell
^!P::
{
    if WinExist("ahk_exe pwsh.exe")
        WinActivate
    else
        Run "pwsh"
}

; Ctrl-Win-# - установить уровень громкости
#^1::
{
    SoundSetVolume 10
}
#^2::
{
    SoundSetVolume 20
}
#^3::
{
    SoundSetVolume 30
}
#^4::
{
    SoundSetVolume 40
}
#^5::
{
    SoundSetVolume 50
}
#^6::
{
    SoundSetVolume 60
}
#^7::
{
    SoundSetVolume 70
}
#^8::
{
    SoundSetVolume 80
}
#^9::
{
    SoundSetVolume 90
}
#^0::
{
    SoundSetVolume 0
}

; Ctrl-Shift-V - вставка неформатированного текста - работает странно относительно раскладок
^+V::
{
    Send(A_Clipboard)
}

; для Маркдауна в русской раскладке
; Ctrl-Alt-3 - #
^!3::
{
    Send "{#}"
}
; Ctrl-Alt-3 - [
^!9::
{
    Send "["
}
; Ctrl-Alt-3 - ]
^!0::
{
    Send "]"
}

; замены текстов
:*:;today::
{
    Send(FormatTime(,"yyyy-MM-dd"))
}
:*:№::{#} ; не помню, чтобы мне нужен был символ номера - заменяется на # для Маркдауна
:*:;mail::igor.gero@gmail.com
:*:;wmail::i.erokhin@gle.ru
:*:;shrug::¯\_(ツ)_/¯

; Cheat sheet
#^I::MsgBox "Ctrl-Alt-C - Calculator`nCtrl-Alt-N - Notepad`nCtrl-Alt-T - Terminal`nCtrl-Win-0,1...9 - Volume level`nCtrl-Alt-3,9,0 - #[]`ntoday, mail, wmail, shrug", "Info"
