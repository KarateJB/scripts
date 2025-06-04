Get-CimInstance Win32_Process -Filter "Name = 'iisexpress.exe'" | ForEach-Object {
    $siteName = $null
    $configPath = $null

    if ($_.CommandLine -match '/site:"?([^"\s]+)"?') {
        $siteName = $matches[1]
    }
    if ($_.CommandLine -match '/config:"?([^"\s]+)"?') {
        $configPath = $matches[1]
    }

    if ($siteName -and (Test-Path $configPath)) {
        [xml]$configXml = Get-Content $configPath
        $siteNode = $configXml.configuration.'system.applicationHost'.sites.site |
            Where-Object { $_.name -eq $siteName }

        if ($siteNode) {
            $bindings = $siteNode.bindings.binding
            foreach ($binding in $bindings) {
                $bindingInfo = $binding.bindingInformation
                # Format: *:12345: or 127.0.0.1:54321:
                if ($bindingInfo -match ':(\d+):') {
                    $port = $matches[1]
                    [PSCustomObject]@{
                        SiteName = $siteName
                        Port     = $port
                        PID      = $_.ProcessId
                        Config   = $configPath
                    }
                }
            }
        }
    }
}
