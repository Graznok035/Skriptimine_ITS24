cls
$pc=hostname
$d=@(get-wmiobject win32_logicaldisk -filter "DriveType=3")
Write-Host "Arvuti:"$pc
Write-Host "Kettaid kokku:"$($d.Count)
foreach($x in $d){
$p=[math]::Round(($x.FreeSpace/$x.Size)*100,2)
Write-Host "Vaba ruumi kettal $($x.DeviceID) - $p%"
if($p -lt 50){Write-Host "Hakkab täis saama"}
}