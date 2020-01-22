$instanceName = "localhost"
$databaseName = "SampleDB"
$filename = "C:\DATA\Customers.txt"
$delimiter = "|"

$ExportQry = "SELECT * FROM SampleText" 

Invoke-SqlCmd -Query $ExportQry -ServerInstance $instanceName -Database $databaseName |
Export-Csv -Delimiter $delimiter -NoType $fileName
