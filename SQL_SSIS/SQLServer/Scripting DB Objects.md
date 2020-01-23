# Schema Script for Views
Create SQL file for scripts of views in a database

```PowerShell
$fpath = "F:\CWC_CustomerMDM\DB_Scripts\VIEWS"
dir SQLSERVER:\SQL\CWCAcuitySpkDev\default\databases\CWC_CustomerMDM\Views `
| ? {$_.name -like 'v*' } | % {$_.script()+'go'}| Out-File -FilePath $fpath\view.sql
```

