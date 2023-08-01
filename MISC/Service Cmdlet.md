
## Stop Process using Port Only
```PowerShell
Stop-Process -Id (Get-NetTCPConnection -LocalPort 3000).OwningProcess -Force
```

## Delete or Remove Windows Service
Delete Service if PowerShell version < 6
```PowerShell
$service = Get-WmiObject -Class Win32_Service -Filter "Name='servicename'"
$service.delete()
```

```
sc.exe delete ServiceName
```

For PowerShell >= 6
```PowerShell
Remove-Service -Name ServiceName
OR
Get-Service -Name "Elasticsearch" | Remove-Service
```
