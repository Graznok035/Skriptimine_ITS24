$nimi = "Martin Tursk"
$email = "onemartib@gmail.com"
$kp = Get-Date
echo $nimi, $email, $kp
$skriptiAsukoht = $MyInvocation.MyCommand.Path
$dir = Split-Path $skriptiAsukoht
$emailid = Get-Content -path $dir\emailid.txt
$emailid = $emailid.split(",")
$emailid2 = $emailid,$email
$emailid2 | Out-File C:\GitHub-ITS24/Powershell/emailid2.txt
(Get-Content C:\GitHub-ITS24/Powershell/emailid2.txt | Measure-Object -Line)
 
Get-Content C:\GitHub-ITS24/Powershell/emailid2.txt | Select-Object -first 1 -last 1