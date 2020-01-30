# Test and Create Profile

```PowerShell
New-Item -path $profile -type file -force
```

```PowerShell
$console = $host.ui.rawui
$console.backgroundcolor = "black"
$console.foregroundcolor = "white"
$colors = $host.privatedata
$colors.verbosebackgroundcolor = "Magenta"
$colors.verboseforegroundcolor = "Green"
$colors.warningbackgroundcolor = "Red"
$colors.warningforegroundcolor = "white"
$colors.ErrorBackgroundColor = "DarkCyan"
$colors.ErrorForegroundColor = "Yellow"
```
