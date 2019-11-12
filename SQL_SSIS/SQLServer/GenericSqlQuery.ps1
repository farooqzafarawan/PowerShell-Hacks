[string] $Server= ".\SQLEXPRESS2014"
[string] $Database = "MyDatabase"
[string] $UserSqlQuery= $("SELECT * FROM [dbo].[User]")

$resultsDatatable = GenericSqlQuery $Server $Database $UserSqlQuery 

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

#validate we got data
Write-Host ("The table contains: " + $resultsDatatable.Rows.Count + " rows")
