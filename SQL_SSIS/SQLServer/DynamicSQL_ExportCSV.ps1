function GenericSqlQuery ($Server, $Database, $SQLQuery) {
    $Datatable = New-Object System.Data.DataTable
    
    $Connection = New-Object System.Data.SQLClient.SQLConnection
    $Connection.ConnectionString = "server='$Server';database='$Database';trusted_connection=true;"
    $Connection.Open()
    $Command = New-Object System.Data.SQLClient.SQLCommand
    $Command.Connection = $Connection
    $Command.CommandText = $SQLQuery

    $DataAdapter = new-object System.Data.SqlClient.SqlDataAdapter $Command
    $Dataset = new-object System.Data.Dataset
    $DataAdapter.Fill($Dataset)
    $Connection.Close()
    
    return $Dataset.Tables[0]
}

$where = ""
$gte_dt = " WHERE srcCreateDate >= "
$lte_dt = " AND srcCreateDate <= "
$lc = "loc"
$a = " AND "
$q = "="
$like = " like '%"
$prcnt = "%'"


$UserSqlQuery = $("select EJobId from RSC where isEnabled=1 and EJobId is not null")
$resData = GenericSqlQuery $Server $Database $UserSqlQuery 
$jobID = $resData[1].ItemArray[0]


$expJobQry = "select FromDate, EndDate, loc from ExpJob where JobId=" + $jobID
$resData = GenericSqlQuery $Server $Database $expJobQry 
$where += $gte_dt + [string]$resData[1].ItemArray[0] + $lte_dt + [string]$resData[1].ItemArray[1] #+ $lc + $resData[1].ItemArray[2]

# Export File Location and Name
$ExportFile = $resData[1].ItemArray[2]

Write-Host $where

# Getting rows from ExportJobDetail against scheduled ExportJob based on ExportJobId
$sqlQry = "select FieldName,FieldValue,Op from ExpJobDet where JobId=" + $jobID
#Write-Host $sqlQry

$resData = GenericSqlQuery $Server $Database $sqlQry
foreach($res in $resData|select -skip 1){
    $where += $a + $res.ItemArray[0]
    $op = $res.ItemArray[2]
    if ($op -eq "exact"){
        $where += $q + $res.ItemArray[1]
    } else {
        $where += $like + $res.ItemArray[1] + $prcnt
    }
    Write-Host $where
    #$where += $a + $res.ItemArray[0] 
    
    #+ $lte_dt + [string]$resData[1].ItemArray[1] #+ $lc + $resData[1].ItemArray[2]

} 

#validate we got data
Write-Host ("The table contains: " + $resData.Rows.Count + " rows")

[string] $Server = "localhost"
[string] $Database = "ExportData"

$qryExport = "select * from Emp "
$qryExport += $where 
$delimiter = "|"

Invoke-Sqlcmd -Query $qryExport -ServerInstance $Server -Database $Database | Export-Csv -Delimiter $delimiter -NoType $ExportFile
