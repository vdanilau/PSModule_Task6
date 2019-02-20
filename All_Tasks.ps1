#1.1.	Вывести все IP адреса вашего компьютера (всех сетевых интерфейсов)
Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName . | Select-Object -Property IPAddress

#1.2.	Получить mac-адреса всех сетевых устройств вашего компьютера 
Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName .| Select-Object -Property MACAddress
#и удалённо.
$cred= Get-Credential administrator
Invoke-Command -ScriptBlock {Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName VM1 `
     | Select-Object -Property MACAddress} -ComputerName VM1 -Credential $cred

#1.3.	На всех виртуальных компьютерах настроить (удалённо) получение адресов с DHСP.
$VM=@("VM1","VM2","VM3") #имена виртуалок   
$cred= Get-Credential administrator 
Invoke-Command -ScriptBlock {Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=true   | `
    ForEach-Object -Process {$_.InvokeMethod("EnableDHCP", $null)}} -ComputerName $VM -Credential $cred
    
#1.4.	Расшарить папку на компьютере
(Get-WmiObject -List -ComputerName . | Where-Object -FilterScript {$_.Name –eq "Win32_Share"}).InvokeMethod(`
"Create",("C:\v_danilau","TempShare",0,25,"test share of the temp folder")) 

# 1.5.	Удалить шару из п.1.4
(Get-WmiObject -Class Win32_Share -ComputerName . -Filter "Name='TempShare'").InvokeMethod("Delete",$null)

# 2.1.	Получить список коммандлетов работы с Hyper-V (Module Hyper-V)
Get-Command -module "*Hyper*"

# 2.2.	Получить список виртуальных машин 
Get-VM

# 2.3.	Получить состояние имеющихся виртуальных машин
get-vm | select-object name, state, status

# 2.4.	Выключить виртуальную машину
Stop-VM -Name VM3_Danilau

# 2.5.	Создать новую виртуальную машину
new-vm -Name TestVM -Path "D:\TestVM\Test" -MemoryStartupBytes 1Gb -NewVHDPath "D:\TestVM\Test.vhdx" -NewVHDSizeBytes 10GB 

# 2.6.	Создать динамический жесткий диск
New-VHD -Dynamic -Path D:\TestVM\Test_New.vhdx -SizeBytes 10GB 

# 2.7.	Удалить созданную виртуальную машину
Remove-VM -Name testVM 



