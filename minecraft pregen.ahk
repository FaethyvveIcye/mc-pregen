; Start with CTRL+P
; Stop with CTRL+Q

;;;;;;;;;;;;;;;; CONFIG START ;;;;;;;;;;;;;;;;;
tpDelay := 15000				; milliseconds between teleports, including chunk load time
radius := 1000					; in blocks, ie. -1000 to +1000
viewdistance := 10				; found in server-properties
yheight := 192					; what y-height to teleport to, recommended 192
;;;;;;;;;;;;;;;;; CONFIG END ;;;;;;;;;;;;;;;;;;

#NoEnv
SetBatchLines -1
SetTitleMatchMode 2
#SingleInstance off
#Persistent
SetWorkingDir %A_ScriptDir%

$^q::
{
    Reload
    Return
}

$^p::
diameter := radius * 2
fixedViewDistance := viewdistance - (viewdistance // 3)
loopamount := diameter // 16 // fixedViewDistance + 2
currentXPos := diameter * -1
currentZPos := diamater * -1
duration := (loopamount * loopamount * (1000 + tpDelay + 200) + 5000) / 60000
MsgBox % "This will take about " . Round(duration) . " minutes."
Sleep, 5000
Loop, %loopamount%
{
	Loop, %loopamount%
	{
		Send, t
		Sleep, 1000
		Send, /tp @p %currentXPos% %yheight% %currentZPos%{Enter}
		Sleep, tpDelay
		currentXPos += 32 * fixedViewDistance
	}
	currentXPos := diameter * -1
	currentZPos += 32 * fixedViewDistance
}
Send, t
Sleep, 1000
Send, /tp @p 0 %yheight% 0{Enter}
