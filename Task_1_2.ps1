#1.2.	Получить mac-адреса всех сетевых устройств вашего компьютера 
Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName .| Select-Object -Property MACAddress
#и удалённо.
$cred= Get-Credential administrator
Invoke-Command -ScriptBlock {Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName VM1 `
     | Select-Object -Property MACAddress} -ComputerName VM1 -Credential $cred


