; Ctrl-Alt-C - запустить Калькулятор
^!C::
{
    if WinExist("ahk_class ApplicationFrameWindow")
        WinActivate
    else
        Run "calc"
}
; Ctrl-Alt-N - добавить в заметку
^!N::
{
    MyGui := Gui("-MaximizeBox -MinimizeBox", "Записать:")
    MyGui.SetFont("S10 Q5", "Consolas")
    MainEdit := MyGui.Add("Edit", "vMainEdit W600 R20")
    MyGui.OnEvent("Escape", MyGui_Escape)
    MyGui_Escape(thisGui) 
    {
        Saved := MyGui.Submit()
        File := EnvGet("USERPROFILE") . "\Documents\" . FormatTime(,"yyyy-MM-dd") . ".md"
        if FileExist(File)
            FileAppend "`n" . Saved.MainEdit, File, "UTF-8"
        else
            FileAppend Saved.MainEdit, File, "UTF-8"
    }
    MyGui.Show()
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

; Ctrl-Win-I - Cheat sheet
#^I::MsgBox "Ctrl-Alt-C - Calculator`nCtrl-Alt-N - Заметка`nCtrl-Alt-T - Terminal`nCtrl-Win-0,1...9 - Volume level`nCtrl-Alt-3,9,0 - #[]`ntoday, mail, wmail, shrug", "Info"
