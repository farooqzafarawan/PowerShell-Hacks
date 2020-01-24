# Compress-Archive cmdlet
Compress-Archive cmdlet creates a zipped (or compressed) archive file from one or more specified files or folders. An archive file allows multiple files to be packaged, and optionally compressed, into a single zipped file for easier distribution and storage. An archive file can be compressed by using the compression algorithm specified by the CompressionLevel parameter.

Because Compress-Archive relies upon the Microsoft .NET Framework API System.IO.Compression.ZipArchive to compress files, the maximum file size that you can compress by using Compress-Archive is currently 2 GB. This is a limitation of the underlying API.

```PowerShell
Compress-Archive -LiteralPath C:\Draftdoc.docx, C:\diagram.vsd -CompressionLevel Optimal -DestinationPath C:\Draft.Zip
```



# Compressing XML File


```PowerShell
$Path = "$env:TEMP\data1.xml"

# serialize data (results in large text files)
Get-Process | Export-Clixml -Path $Path

$length1 = (Get-Item -Path $Path).Length

$ZipPath = [IO.Path]::ChangeExtension($Path, ".zip")

Compress-Archive -Path $Path -Destination $ZipPath -CompressionLevel Optimal -Force
Remove-Item -Path $Path

$length2 = (Get-Item -Path $ZipPath).Length

$compression = $length2 * 100 / $length1
"Compression Ratio {0:n2} %" -f $compression 
```



Thanks to [pdq compress-archive cmdlet](https://www.pdq.com/powershell/compress-archive/) for examples.




















Thanks to [Idera Power Tips](https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/compressing-serialized-data) for the script
