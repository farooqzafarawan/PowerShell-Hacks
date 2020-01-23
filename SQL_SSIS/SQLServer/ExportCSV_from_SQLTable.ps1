$instanceName = "localhost"
$databaseName = "SampleDB"
$usr = "guest"
$pwd = "guest"
$filename = "C:\DATA\Customers.txt"
$delimiter = "|"

$ExportQry = "SELECT * FROM SampleText" 

write-host "Start Export" (get-date -Format "HH:mm:ss")

$sqlcmd = Invoke-SqlCmd -Query $ExportQry -ServerInstance $instanceName -Database $databaseName -Username $usr -Password $pwd  

$sqlcmd | Export-Csv -UseQuotes Never -Delimiter $delimiter  -Path $fileName -Encoding UTF8

write-host "Completed:" (get-date -Format "HH:mm:ss")





