# To get the amount of memory per process used on a 64 bit windows operating system
Get-Process | Sort-Object WorkingSet64 | Select-Object Name,@{Name='WorkingSet';Expression={($_.WorkingSet64/1KB)}}
