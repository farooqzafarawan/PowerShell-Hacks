# Write-SqlTableData cmdlet
Use the Invoke-Sqlcmd cmdlet (or other commands that output a .Net DataTable) and 
pipe those results directly into the Write-SqlTableData cmdlet

```PowerShell
Invoke-Sqlcmd -Query "
SELECT DB_NAME([database_id]) AS DatabaseName,
       [file_id],
       [filegroup_id],
       ( [total_page_count] / 128 ) AS TotalSpaceInMB,
       ( [allocated_extent_page_count] / 128 ) AS SpaceUsedInMB,
       ( [unallocated_extent_page_count] / 128 ) AS SpaceFreeInMB
  FROM [sys].[dm_db_file_space_usage];" -OutputAs DataTables |             
Write-SqlTableData -ServerInstance localhost -DatabaseName tempdb -SchemaName dbo -TableName DataFileSizes -Force
```


## -InputData Parameter Example
Writing to SQL Table by first storing results of query in a DataTable and then taking results as Input Data.

```PowerShell
$Results = Invoke-Sqlcmd -Database WideWorldImporters -Query "
SELECT DB_NAME([database_id]) AS DatabaseName,
       [file_id],
       [filegroup_id],
       ( [total_page_count] / 128 ) AS TotalSpaceInMB,
       ( [allocated_extent_page_count] / 128 ) AS SpaceUsedInMB,
       ( [unallocated_extent_page_count] / 128 ) AS SpaceFreeInMB
  FROM [sys].[dm_db_file_space_usage];" -OutputAs DataTables            
Write-SqlTableData -ServerInstance localhost -DatabaseName tempdb -SchemaName dbo -TableName DataFileSizes -InputData $Results
```

