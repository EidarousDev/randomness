#include <AutoItConstants.au3>

; Auto recording demos

HotKeySet('{ESC}', _Exit)
Opt('SendKeyDelay', 50)

Global $giRecording = False

;Build()
;AdsIntegration()
;ContinuedShareExperience()
;QuizEditor()
;ModifyingUserInterface()

Func Build()
	Local $aSteps = [ _
			'_Activate("Randomness - Mozilla Firefox")', _
			'_MouseClick(320, 242, 2, 1000)', _
			'_SendAtOnce("319385685331288", 500)', _
			'_MouseClick(320, 312, 2, 1000)', _
			'_SendAtOnce("MAAYsfZAxiFmLBAGDSGQMGz5570T71ZA3Y7Y3sInXmv5myvZA7sPi0jkyvqBAErqjJbtvfBdHZCGaVbfP6SDnwJrNXVJkAs88nMaDrlDHz5ZB69eFsZA9j0AJi4uYeox0bdqSuNEmT0lQkaFACTkNdGAhwjGVaWD2uFA7ZBPpaSpqg", 2000)', _
			'_MouseClick(787, 754, 1)', _
			'_MouseClick(494, 732, 1, 4000)', _
			'_MouseClick(486, 53)', _
			'_Send("web", 300)', _
			'_MouseClick(556, 281, 1, 3000)', _
			'_MouseMove(503, 308)' _
			]
	RunSteps($aSteps)
EndFunc   ;==>Build

Func AdsIntegration()
	Local $aSteps = [ _
			'_Activate("Randomness - Mozilla Firefox")', _
			'_MouseClick(390, 458, 2, 1000)', _
			'_SendAtOnce("319385685331288_320749428528247", 3000)', _
			'_MouseClick(486, 53)', _
			'_Send("test", 300)', _
			'_MouseClick(498, 281)', _
			'_PixelWait(550, 550, 16240735)', _
			'_MouseClick(382, 382, 1, 750)', _
			'_MouseClick(434, 374, 1, 3000)', _
			'_MouseClickDrag(788, 280, 788, 397)', _
			'_MouseClick(558, 735, 1, 3000)' _
			]
	RunSteps($aSteps)
EndFunc   ;==>AdsIntegration

Func ContinuedShareExperience()
	Local $aSteps = [ _
			'_Activate("Hoàng - Mozilla Firefox")', _
			'_PixelWait(350, 500, 11710977)', _
			'_PixelWait(350, 500, 15921665)', _
			'_PixelWait(350, 500, 11710977)', _
			'_MouseClick(505, 475, 1, 500)', _
			'_PixelWait(505, 475, 0)', _
			'_MouseClickDrag(375, 772, 460, 772)', _
			'_MouseClick(385, 419, 1, 3000)', _
			'_MouseClickDrag(623, 320, 623, 375)', _
			'_MouseClick(375, 720)', _
			'_PixelWait(710, 600, 16777215)', _
			'_MouseClick(730, 600, 1, 3000)' _
			]
	RunSteps($aSteps)
EndFunc   ;==>ContinuedShareExperience

Func QuizEditor()
	Local $aSteps = [ _
			'_Activate("Randomness - Mozilla Firefox")', _
			'_MouseClick(382, 382, 1, 1200)', _
			'_MouseClickDrag(788, 188, 788, 246)', _
			'_MouseClick(500, 390, 1, 500)', _
			'_MouseClick(518, 378, 1, 0)', _
			'_Send("^a{#}f66c6c", 1400)', _
			'_Send("{tab}^aRed", 1400)', _
			'_Send("{tab}{tab}{tab}", 200)', _
			'_Send("{tab}^aYou are always the leader.", 1400)', _
			'_Send("{enter}Outstanding, confident and calm.", 1300)', _
			'_Send("{enter}Everyone respects you.", 1500)', _
			'_MouseClick(452, 747, 1, 500)', _
			'_MouseClick(747, 650, 1, 1500)' _
			]
	RunSteps($aSteps)
EndFunc   ;==>QuizEditor

Func ModifyingUserInterface()
	Local $aSteps = [ _
			'_Activate("Randomness - Mozilla Firefox")', _
			'_MouseClick(502, 137, 2)', _
			'_Send("My game name", 1200)', _
			'_MouseClick(444, 202, 2)', _
			'_Send("The ", 1200)', _
			'_MouseMove(382, 392, 150)', _
			'_MouseClick(372, 502, 2)', _
			'_Send("birthday", 1300)', _
			'_MouseClick(372, 382, 2, 1600)', _
			'_MouseClick(486, 324, 1, 0)', _
			'_Send("^a", 150)', _
			'_Send("You are a...", 300)', _
			'_MouseClick(434, 384, 1, 0)', _
			'_Send("^a", 150)', _
			'_Send("Boy", 300)', _
			'_MouseClick(556, 384, 1, 0)', _
			'_Send("^a", 150)', _
			'_Send("Girl", 500)', _
			'_MouseClick(630, 384, 1, 1500)' _
			]
	RunSteps($aSteps)
EndFunc   ;==>ModifyingUserInterface

Func RunSteps($aSteps)
	_Send("{F7}", 200)
	$giRecording = True

	For $sStep In $aSteps
		Execute($sStep)
	Next

	_Send("{F7}", 200)
	$giRecording = False
EndFunc   ;==>RunSteps

Func _Activate($sBrowserWin)
	Local $hBrowserWin = WinGetHandle($sBrowserWin)
	If @error Or WinGetTitle($hBrowserWin) <> $sBrowserWin Then Exit 1

	Local $sRecorderWin = 'ScreenToGif'
	Local $hRecorderWin = WinGetHandle($sRecorderWin)
	If @error Or WinGetTitle($hRecorderWin) <> $sRecorderWin Then Exit 2

	MouseMove(500, 175, 0)

	WinMove($hBrowserWin, '', 200, 35, 600, 750)
	WinMove($hRecorderWin, '', 197, 2, 606, 812)
	WinSetOnTop($hRecorderWin, '', $WINDOWS_NOONTOP)

	WinActivate($hRecorderWin)
	WinActivate($hBrowserWin)

	Sleep(500)
EndFunc   ;==>_Activate

Func _MouseClick($x, $y, $iClicks = 1, $iSleep = 250)
	MouseClick($MOUSE_CLICK_LEFT, $x, $y, $iClicks)
	Sleep($iSleep)
EndFunc   ;==>_MouseClick

Func _MouseClickDrag($x1, $y1, $x2, $y2, $iClicks = 1, $iSleep = 250)
	MouseClickDrag($MOUSE_CLICK_LEFT, $x1, $y1, $x2, $y2)
	Sleep($iSleep)
EndFunc   ;==>_MouseClickDrag

Func _MouseMove($x, $y, $iSleep = 250)
	MouseMove($x, $y, 10)
	Sleep($iSleep)
EndFunc   ;==>_MouseMove

Func _Send($sKeys, $iSleep = 500)
	Send($sKeys)
	Sleep($iSleep)
EndFunc   ;==>_Send

Func _SendAtOnce($sKeys, $iSleep = 500)
	Local $iSendKeyDelay = Opt('SendKeyDelay', 0)
	Local $iSendKeyDownDelay = Opt('SendKeyDownDelay', 0)
	Send($sKeys)
	Opt('SendKeyDelay', $iSendKeyDelay)
	Opt('SendKeyDownDelay', $iSendKeyDownDelay)
	Sleep($iSleep)
EndFunc   ;==>_SendAtOnce

Func _MouseWheel($iWheels, $iSleep = 250)
	MouseWheel($MOUSE_WHEEL_DOWN, $iWheels)
	Sleep($iSleep)
EndFunc   ;==>_MouseWheel

Func _PixelWait($x, $y, $iColor)
	Do
		Sleep(100)
	Until PixelGetColor($x, $y) = $iColor
EndFunc   ;==>_PixelWait

Func _Exit()
	If $giRecording Then _Send('{F7}')
	Exit
EndFunc   ;==>_Exit
