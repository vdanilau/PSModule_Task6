#1.4.	Расшарить папку на компьютере
(Get-WmiObject -List -ComputerName . | Where-Object -FilterScript {$_.Name –eq "Win32_Share"}).InvokeMethod(`
"Create",("C:\v_danilau","TempShare",0,25,"test share of the temp folder")) 