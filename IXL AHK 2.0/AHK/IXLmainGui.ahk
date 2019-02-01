﻿#SingleInstance, force 
#NoTrayIcon
#Persistent
#include %A_ScriptDir%\lib\GUILibrary.ahk 

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
DetectHiddenWindows, On
SetTitleMatchMode, 2

EnvSet, fpath, %A_WorkingDir% 

EnvSet, sr, 1 
EnvSet, new_window, 1 
EnvSet, sm, 1 
EnvSet, sf, 1 

Gui, +Resize 
Gui, Add, Tab3, , General|Search Settings|List of Hotkeys 

Gui, Tab, 1
BuildButton("mainscript", "Main Script", 55, 50, 205, 30)
BuildTap("CustomAHK", "Custom AHK", 55, 90, 205, 30)
BuildTap("copyGUI", "Display Copy Macros", 55, 210, 205, 30)


Gui, Tab, 2
Gui, Add, Text,, Search Settings
Gui, Add, Radio, Checked vSendRight0 gSEND_RIGHT_ON, Send right ON
Gui, Add, Radio, vSendRight1 gSEND_RIGHT_OFF, Send right OFF 
Gui, Add, Text,, 
Gui, Add, Text,,Triforce search options
Gui, Add, Radio, Checked vNewWindow0 gNEW_WINDOW_ON, Create new window when searching 
Gui, Add, Radio, vNewWindow1 gNEW_WINDOW_OFF, Create new tab when searching
Gui, Add, Text,, 
Gui, Add, Text,,SubmanSearch for e-mail?
Gui, Add, Radio, Checked vSubman0 gSUBMAN_SEARCH_ON, Subman search for e-mail included
Gui, Add, Radio, vSubman1 gSUBMAN_SEARCH_OFF, Don't use Subman for e-mail search
Gui, Add, Text,,
Gui, Add, Text,,SalesForce Search for Account number?
Gui, Add, Radio, Checked vSalesForce0 gSALESFORCE_ON, SalesForce search for Account Number included
Gui, Add, Radio, vSalesForce1 gSALESFORCE_OFF, Don't include SalesForce for Account Number search 

Gui, Tab, 3
Gui, Add, Text,, ddd - time and date and initial functions 
Gui, Add, Text,, ctrl + shift + p - phone number sales force search 
Gui, Add, Text,, ctrl + shift + f - google search 
Gui, Add, Text,, ctrl + shift + d - literal e-mail user search 
Gui, Add, Text,, ctrl + shift + s - customizable e-mail, account number, `ncase number search 
Gui, Add, Text,, ctrl + shift + q - File scrubbing excel function 
Gui, Add, Text,, ctrl + shift + l - File Scrubbing and saving excel function  
Gui, Add, Text,, ctrl + Shift + 0-9 - copies and creates a macro to the `nspecified number key
Gui, Add, Text,, ctrl + alt + 0-9 - pastes the macro to the corresponding `nnumber key 

Gui, Tab 
Gui, Add, Button, x10 y350 vReloadButton gRELOAD_ON, Reload 
Gui, Add, Radio, vOnTop gTOP_ON, AHK window always displayed 
Gui, Add, Radio, Checked vOnBottom gTOP_OFF, AHK window not always displayed 

Gui, Show, w320 h450, IXL AHK 

scriptArray := ["CustomAHK", "mainscript", "copyGUI"]

return 
;----------------------------------- GENERAL TAB -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- CUSTOM -------------------------------------------------------------------------------------------------------------
CustomAHKOn:
{
	Tap("CustomAHK", "\scripts")
	return
}
;----------------------------------- MAIN SCRIPT -------------------------------------------------------------------------------------------------------------
mainscriptOn:
{
	OnButton("mainscript", "\scripts")
	return
}
mainscriptOff:
{
	OffButton("mainscript", "\scripts")
	return 
}
;----------------------------------- COPY MACROS DISPLAY -------------------------------------------------------------------------------------------------------------
copyGUIOn:
{
	Tap("copyGUI", "\scripts")
	return
}

;----------------------------------- SETTINGS TAB  -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- SEND RIGHT SETTING -------------------------------------------------------------------------------------------------------------
SEND_RIGHT_ON:
{
    EnvSet, sr, 1  
    CheckForScript()
    return
}
SEND_RIGHT_OFF:
{
    EnvSet, sr, 0
    CheckForScript()
    return  
}
;----------------------------------- NEW WINDOW SETTING -------------------------------------------------------------------------------------------------------------
NEW_WINDOW_ON:
{
    EnvSet, new_window, 1
    CheckForScript()  
    return
}
NEW_WINDOW_OFF:
{
    EnvSet, new_window, 0 
    CheckForScript()
    return 
}
;----------------------------------- SUBMAN SEARCH SETTING  -------------------------------------------------------------------------------------------------------------
SUBMAN_SEARCH_ON:
{
    EnvSet, sm, 1
    CheckForScript()
    return
}
SUBMAN_SEARCH_OFF:
{
    EnvSet, sm, 0 
    CheckForScript()
    return 
}
;----------------------------------- SALES FORCE SEARCH SETTING -------------------------------------------------------------------------------------------------------------
SALESFORCE_ON:
{
    EnvSet, sf, 1
    CheckForScript()  
    return 
}
SALESFORCE_OFF:
{
    EnvSet, sf, 0  
    CheckForScript()
    return 
}
;----------------------------------- NO TAB -------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- RELOAD -------------------------------------------------------------------------------------------------------------
RELOAD_ON:
{
	ExitAllArray("\scripts", ".ahk", scriptArray)
	Reload 
	return 
}
;----------------------------------- WINDOW PRIORITY CONTROLS -------------------------------------------------------------------------------------------------------------
TOP_ON:
{
    Gui, +AlwaysOnTop
    return
}
TOP_OFF:
{
    WinSet, AlwaysOnTop, Off 
    return 
}
;------------------------------------------------------------------------------------------------------------------------------------------------
GuiClose:
ExitAllArray("\scripts", ".ahk", scriptArray)
ExitApp
;----------------------------------- FUNCTIONS -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------------------------------------------
CheckForScript() {
	if WinExist("mainscript.ahk")
	{
		Tap("searchkey", "\scripts\auxillary")
		return 
	}
}