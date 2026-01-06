param (
    [Parameter(Mandatory = $true)]
    [string]$ShortcutPath
)

if (-not (Test-Path $ShortcutPath)) {
    Write-Error "Shortcut does not exist: $ShortcutPath"
    exit 1
}

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut((Resolve-Path $ShortcutPath))

$Shortcut.TargetPath
