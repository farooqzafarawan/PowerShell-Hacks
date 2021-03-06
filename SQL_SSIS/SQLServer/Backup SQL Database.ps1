# Schedule using following argument in windows scheduler
#-NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass -File C:\MetadataBackup

$dt = Get-Date -Format yyyyMMdd
$dbname = "Metadata"
$srvr = "APP01"
$backupDest = "E:\BACKUPS\Metadata_Backup\" + $dbname + ".bak"

Backup-SqlDatabase -ServerInstance $srvr -Database $dbname -BackupFile $backupDest -Initialize

Invoke-Expression E:\BACKUPS\Metadata_Backup\PS_ARCHIVE_ECP.ps1
