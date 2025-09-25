Get-CimInstance Win32_Process -Filter "Name = 'cmd.exe'" | ForEach-Object {
    # Write-Host "Found cmd.exe PID=$($_.ProcessId) CommandLine=$($_.CommandLine)" -ForegroundColor Yellow
    $cmd = $_.CommandLine
    if (-not $cmd) { return }

    # AsyncRun in Vim (cmd.exe with asyncrun.cmd)
    if ($cmd -match "asyncrun\.cmd") {
        [PSCustomObject]@{
            Case     = "vim-asyncrun"
            PID      = $_.ProcessId
            Command  = $cmd
        }
    }
}
