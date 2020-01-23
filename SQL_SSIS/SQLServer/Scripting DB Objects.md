
```PowerShell
$fpath = "F:\CWC_CustomerMDM\DB_Scripts\VIEWS"
dir SQLSERVER:\SQL\CWCAcuitySpkDev\default\databases\CWC_CustomerMDM\Views `
| ? {$_.name -like 'v*' } | % {$_.script()+'go'}| Out-File -FilePath $fpath\view.sql
```

