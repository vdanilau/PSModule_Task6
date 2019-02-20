#1.3.	На всех виртуальных компьютерах настроить (удалённо) получение адресов с DHСP.
$VM=@("VM1","VM2","VM3") #имена виртуалок   
$cred= Get-Credential administrator 
Invoke-Command -ScriptBlock {Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=true   | `
    ForEach-Object -Process {$_.InvokeMethod("EnableDHCP", $null)}} -ComputerName $VM -Credential $cred
    
    