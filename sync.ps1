$configRepoPath = 'D:\OneDrive\Documents\CSGO\Config\csgo-config'
$configGamePath = 'C:\Program Files (x86)\Steam\userdata\914786436\730\local\cfg'

# robocopy $configRepoPath $configGamePath /E /SEC /R:5 /W:5 /TBD /V /XD '.git' /XF 'sync.ps1' 'launch_options.txt'

Get-ChildItem -Path $configRepoPath | Where-Object {
    $_.Name -ne '.git' -and `
    $_.Name -ne 'sync.ps1' -and `
    $_.Name -ne 'launch_options.txt' `
} | Copy-Item -Destination $configGamePath -Recurse -Force -Verbose
