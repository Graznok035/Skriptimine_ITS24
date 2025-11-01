# Autor Martin Tursk
# Kursus ITS25
# Yœlesanne 5
Clear-Host

Write-Host "Masina nimi (Host Name):" (hostname)
Write-Host "********************"

$os = Get-CimInstance Win32_OperatingSystem
Write-Host "Operatsioonisüsteem (OS name):" $os.Caption
Write-Host "********************"

$ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -notmatch "Loopback|vEthernet"} | Select-Object -ExpandProperty IPAddress)
Write-Host "IP aadress:" $ip
Write-Host "********************"

$ram = [Math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
Write-Host "Muutmälu (RAM): $ram GB"
Write-Host "********************"

$cpu = (Get-CimInstance Win32_Processor).Name
Write-Host "Protsessor (CPU): $cpu"
Write-Host "********************"

$gpu = (Get-CimInstance Win32_VideoController).Name
Write-Host "Graafikakaart (VideoController): $gpu"
Write-Host "********************"

$users = (Get-CimInstance Win32_UserAccount | Where-Object { $_.LocalAccount -eq $true }).Name
Write-Host "Arvuti kasutajad (UserAccounts):"
$users | ForEach-Object { Write-Host $_ }
Write-Host "********************"