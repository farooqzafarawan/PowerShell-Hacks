# Set Environment Variables
Setting Environment Variables without mentioning Machine or User context
```PowerShell
[Environment]::SetEnvironmentVariable("PYTHONPATH" , "C:\Users\farooq.GENIE\AppData\Local\Programs\Python\Python36")
``

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
