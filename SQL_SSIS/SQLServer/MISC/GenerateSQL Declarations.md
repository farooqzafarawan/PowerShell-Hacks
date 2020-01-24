# Generate Column Data Type dynamically from Table
Following code will pull the table schema info and generates the SQL declarations with datatypes as database table data types can change any time.


```PowerShell
$SQLServer = "SERVER\INSTANCE" #use Server\Instance for named SQL instances!
# Set DB Name
$SQLDBName = "Database"
# Set DB User ID
$SQLDBUserID = "sa"
# Set DB Password
$SQLDBUserPW = "P@ssword"

$tables = Invoke-Sqlcmd -ServerInstance $SQLServer -Database $SQLDBName -Username $SQLDBUserID -Password $SQLDBUserPW -Query "SELECT * FROM information_schema.tables" | Select TABLE_NAME
$tables
foreach ($table in $tables) {
    "/*{0}*/" -f $Table.TABLE_NAME
    $records = Invoke-Sqlcmd -ServerInstance $SQLServer -Database $SQLDBName -Username $SQLDBUserID -Password $SQLDBUserPW -Query "select * from information_schema.columns where table_name = '$($Table.TABLE_NAME)'" | Select Column_Name, Data_Type, CHARACTER_MAXIMUM_LENGTH
    $records | foreach{
        if (![string]::IsNullOrEmpty($_.CHARACTER_MAXIMUM_LENGTH)){
            $charLength = $_.CHARACTER_MAXIMUM_LENGTH
            if ($charLength -eq -1) { $charLength = "MAX"}
            "Declare @{0} {1}({2}) = '`$(POWERSHELL_VAR)'" -f $_.COLUMN_NAME, $_.DATA_TYPE, $charLength
        }
        else {
            "Declare @{0} {1} = '`$(POWERSHELL_VAR)'" -f $_.COLUMN_NAME, $_.DATA_TYPE
        }
    }
}
```
