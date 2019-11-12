$instanceName = "localhost"
$databaseName = "SampleDB"
$filename = "C:\DATA\Customers.txt"
$delimiter = "|"

Invoke-SqlCmd -Query "SELECT * FROM SampleText" -ServerInstance $instanceName -Database $databaseName |
Export-Csv -Delimiter $delimiter -NoType $fileName
