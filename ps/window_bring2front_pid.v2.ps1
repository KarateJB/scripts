# v2: also works on cmd.exe. cmd.exe does have a console window, but it is not treated as a normal GUI main window — so PowerShell usually sees MainWindowHandle as 0.
param ([int]$processId)

Add-Type @"
using System;
using System.Text;
using System.Diagnostics;
using System.Runtime.InteropServices;

public class Win32 {
    public delegate bool EnumWindowsProc(IntPtr hWnd, IntPtr lParam);

    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool EnumWindows(EnumWindowsProc lpEnumFunc, IntPtr lParam);

    [DllImport("user32.dll", SetLastError = true)]
    public static extern uint GetWindowThreadProcessId(IntPtr hWnd, out int lpdwProcessId);

    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool IsWindowVisible(IntPtr hWnd);

    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);
}
"@

$foundHandle = [IntPtr]::Zero

[Win32]::EnumWindows({
    param($hWnd, $lParam)
    $procId = 0
    [Win32]::GetWindowThreadProcessId($hWnd, [ref]$procId) | Out-Null
    if ($procId -eq $processId -and [Win32]::IsWindowVisible($hWnd)) {
        $script:foundHandle = $hWnd
        return $false  # stop enumeration
    }
    return $true
}, [IntPtr]::Zero)

if ($foundHandle -ne [IntPtr]::Zero) {
    [Win32]::SetForegroundWindow($foundHandle) | Out-Null
    Write-Host "Brought window for PID $processId to foreground."
} else {
    Write-Host "No visible window found for PID $processId."
}
