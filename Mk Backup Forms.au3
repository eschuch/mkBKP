#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=mkbackup.kxf
$MKBackup = GUICreate("MK Backup", 611, 399, 219, 155)
$miFile = GUICtrlCreateMenu("&File")
$miFileOpen = GUICtrlCreateMenuItem("Open", $miFile)
$miFileSave = GUICtrlCreateMenuItem("Save", $miFile)
$miFileSaveAs = GUICtrlCreateMenuItem("Save as ...", $miFile)
$miFileClose = GUICtrlCreateMenuItem("Close", $miFile)
$miEdit = GUICtrlCreateMenu("&Edit")
$miEditEdit = GUICtrlCreateMenuItem("Edit", $miEdit)
$miEditSave = GUICtrlCreateMenuItem("Save", $miEdit)
$miEditCopy = GUICtrlCreateMenuItem("Copy", $miEdit)
$miEditDelete = GUICtrlCreateMenuItem("Delete", $miEdit)
$miHelp = GUICtrlCreateMenu("&Help")
$miHelpHelp = GUICtrlCreateMenuItem("Help me!", $miHelp)
$miHelpAbout = GUICtrlCreateMenuItem("About", $miHelp)
GUISetIcon("C:\WINDOWS\system32\SHELL32.dll", -199)
$groupMessage = GUICtrlCreateGroup("Message Window", 0, 224, 609, 153)
$edMessageWindow = GUICtrlCreateEdit("", 8, 240, 593, 129)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$groupServerConfig = GUICtrlCreateGroup("Server Configuration", 184, 0, 425, 153)
$Label1 = GUICtrlCreateLabel("Server Name:", 192, 24, 69, 17)
$Label2 = GUICtrlCreateLabel("Server Address:", 192, 48, 79, 17)
$Label3 = GUICtrlCreateLabel("User:", 192, 72, 29, 17)
$Label4 = GUICtrlCreateLabel("Password:", 192, 96, 53, 17)
$cbBackupFile = GUICtrlCreateCheckbox("Regular bkp", 192, 128, 89, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$inputServerName = GUICtrlCreateInput("", 280, 16, 193, 21)
$inputServerAddress = GUICtrlCreateInput("", 280, 40, 193, 21)
$inputUser = GUICtrlCreateInput("", 280, 64, 193, 21)
$inputPassword = GUICtrlCreateInput("", 280, 88, 193, 21)
$btSave = GUICtrlCreateButton("Save", 520, 16, 75, 25)
$btClear = GUICtrlCreateButton("Clear", 520, 56, 75, 25)
$btCopyThis = GUICtrlCreateButton("Copy", 520, 96, 75, 25)
$cbExport = GUICtrlCreateCheckbox("Export file (editable)", 288, 128, 121, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$cbReport = GUICtrlCreateCheckbox("Make report", 416, 128, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$groupServerList = GUICtrlCreateGroup("Server List", 0, 0, 177, 225)
$listServerList = GUICtrlCreateList("", 8, 16, 161, 175)
$btCopy = GUICtrlCreateButton("Copy", 8, 192, 51, 25)
$btEdit = GUICtrlCreateButton("Edit", 64, 192, 51, 25)
$btRemove = GUICtrlCreateButton("Remove", 120, 192, 51, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$groupService = GUICtrlCreateGroup("Services", 184, 160, 225, 65)
$cbRunAsServices = GUICtrlCreateCheckbox("Run as services", 192, 176, 97, 17)
$Label5 = GUICtrlCreateLabel("Run intervals (minutes)", 192, 200, 111, 17)
$inputMinutesToRun = GUICtrlCreateInput("60", 304, 192, 33, 21)
$btServiceApply = GUICtrlCreateButton("Apply", 344, 192, 59, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$groupNow = GUICtrlCreateGroup("Now", 416, 160, 193, 65)
$brRunNow = GUICtrlCreateButton("Run Now", 528, 192, 75, 25)
$rbRunAll = GUICtrlCreateRadio("Run all", 424, 176, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$rbRun = GUICtrlCreateRadio("Just select", 424, 200, 97, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $miFileOpen

		Case $miFileSave
		Case $miFileSaveAs
		Case $miFileClose
		Case $miEditEdit
		Case $miEditSave
		Case $miEditCopy
		Case $miEditDelete
		Case $miHelpHelp
		Case $miHelpAbout
		Case $btSave
		Case $btClear
		Case $btCopyThis
		Case $btCopy
		Case $btEdit
		Case $btRemove
		Case $btServiceApply
	EndSwitch
WEnd

Func ChoseFileToOpen()
			local $fileToOpen = FileOpenDialog("Open", ".\", "All (*.*)", 1 + 4)
			If @error Then
			   MsgBox(4096, "", "No File(s) chosen",1)
			Else
			   $fileToOpen = StringReplace($fileToOpen, "|", @CRLF)
			   MsgBox(4096, "", "You chose " & $fileToOpen,1)
			EndIf
   Return $fileToOpen
EndFunc

Func OpenFile($file)
   return FileOpen($file)
EndFunc

func GetFileContent($OpenFile)
   return FileRead($OpenFile)
   FileClose($openFile)
EndFunc

func choseOpenAndReturnContent()
   return GetFileContent(OpenFile(ChoseFileToOpen()))
EndFunc

