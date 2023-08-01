# To get the amount of memory per process used on a 64 bit windows operating system
Get-Process| Sort-Object WorkingSet64| Select-Object Name,@{Name='WorkingSet';Expression={($_.WorkingSet64/1KB)}}


# Get-Process with total memory usage
get-process -computername $tag1 | Group-Object -Property ProcessName | 
    Format-Table Name, @{n='Mem (KB)';e={'{0:N0}' -f (($_.Group|Measure-Object WorkingSet64 -Sum).Sum / 1KB)};a='right'} -AutoSize
