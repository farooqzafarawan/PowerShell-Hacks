# Set Environment Variables
Setting Environment Variables without mentioning Machine or User context
```PowerShell
[Environment]::SetEnvironmentVariable("PYTHONPATH" , "C:\Users\farooq.GENIE\AppData\Local\Programs\Python\Python36")
```

Setting Environment Variables with Machine context
```PowerShell
[Environment]::SetEnvironmentVariable("ORACLE_HOME" , "D:\ORACLE\product\11.2.0\dbhome_1","Machine")
[Environment]::SetEnvironmentVariable("ORACLE_SID" , "orcl" ,"Machine" )
```

Setting Environment Variables with User context
```PowerShell
[Environment]::SetEnvironmentVariable("JAVA_HOME" , "C:\Program Files\Java\" , "User" )
```

# Get Environment Variable
Getting Environment Variables with User context
```PowerShell
[Environment]::GetEnvironmentVariable("JAVA_HOME", "User")
```

# Path Variable
Split path variable to check entries.
`$env:Path -split ';' | sls -pattern "Python"`

## Modifying Path Variable
### Removing entry from PATH variable
```PowerShell
$path = [Environment]::GetEnvironmentVariable('PATH' ,'User' )
$pathvar  = 'C:\Program Files\MongoDB\Server\3.4\bin'

$path = ($path. split(';') | Where { $_ -ne $pathvar }) -join ';'

[Environment]::SetEnvironmentVariable('PATH', $path, 'User')
```

### Set Path variable with new path entry
```PowerShell
$pathvar  =  ';C:\Program Files\MongoDB\Server\3.4\bin'
[System.Environment]::SetEnvironmentVariable('PATH', $env:path + $pathvar , 'User')
```

## Removing Path from PATH Variable
First,get the entry which you wish to remove
```PowerShell
$path = [Environment]::GetEnvironmentVariable('PATH' ,'Machine')
```

Remove unwanted entry
```PowerShell
$remove = "'C:\data' "
$path = ($path.split(';') | Where { $_ -ne $remove  }) -join ';'
```

# Set Path
```PowerShell
[Environment]:: SetEnvironmentVariable('PATH', $path, 'Machine')
```
