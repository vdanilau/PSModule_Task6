#1.6.	Скрипт входными параметрами которого являются Маска подсети и два ip-адреса. 
#Результат  – сообщение (ответ) в одной ли подсети эти адреса.
# Извините, на доведение красоты и защиты от дурака совсем не было времени(((

 #после ввода получаем строку IP без точек
$ad1= (Read-Host "Enter IP ADD1").Split('.') #после ввода получаем строку IP без точек
$ad2= (Read-Host "Enter IP ADD2").Split('.')  #после ввода получаем строку IP без точек  
$netm= (Read-Host "Enter Network mask").Split('.') #после ввода получаем строку маски без точек

$net1=for ($i=0; $i -lt 4; $i++){
    $ad1[$i] -band $netm[$i]
} #получаем адрес первой сети 
$net2=for ($i=0; $i -lt 4; $i++){
    $ad2[$i] -band $netm[$i]
} #получаем адрес второй сети
 
if (($net1[0] -eq $net2[0]) -and ($net1[1] -eq $net2[1]) -and ($net1[2] -eq $net2[2]) -and ($net1[3] -eq $net2[3]))
    {
    Write-Host "It's one networks"
}
else {
    write-host "It's different networks"
}
$ad2= (Read-Host "Enter IP ADD2").Split('.')  #после ввода получаем строку IP без точек  
$netm= (Read-Host "Enter Network mask").Split('.') #после ввода получаем строку маски без точек

$net1=for ($i=0; $i -lt 4; $i++){
    $ad1[$i] -band $netm[$i]
} #получаем адрес первой сети 
$net2=for ($i=0; $i -lt 4; $i++){
    $ad2[$i] -band $netm[$i]
} #получаем адрес второй сети
 
if (($net1[0] -eq $net2[0]) -and ($net1[1] -eq $net2[1]) -and ($net1[2] -eq $net2[2]) -and ($net1[3] -eq $net2[3]))
    {
    Write-Host "It's one networks"
}
else {
    write-host "It's different networks"
}