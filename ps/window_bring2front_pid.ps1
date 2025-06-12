param ([int]$processId)

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool SetForegroundWindow(IntPtr hWnd);
}
"@

$process = Get-Process -Id $processId -ErrorAction Stop
if ($process.MainWindowHandle -ne 0) {
    [Win32]::SetForegroundWindow($process.MainWindowHandle)
} else {
    Write-Host "No window found for process with PID $processId."
}
