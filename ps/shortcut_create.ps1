param (
    [Parameter(Mandatory = $true)]
    [string]$TargetPath,

    [Parameter(Mandatory = $true)]
    [string]$ShortcutPath
)

# Create WScript.Shell COM object
$WshShell = New-Object -ComObject WScript.Shell

# Create the shortcut
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)

# Set target
$Shortcut.TargetPath = $TargetPath

# Optional but recommended
$Shortcut.WorkingDirectory = Split-Path $TargetPath
$Shortcut.Save()
