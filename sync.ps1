param(
    $ConfigRepoPath = 'E:\Git\csgo-config',
    $ConfigGamePath = 'C:\Program Files (x86)\Steam\userdata\914786436\730\local\cfg'
)

# robocopy $ConfigRepoPath $ConfigGamePath /E /SEC /R:5 /W:5 /TBD /V /XD '.git' /XF 'sync.ps1' 'launch_options.txt'

Get-ChildItem -Path $ConfigRepoPath | Where-Object {
    $_.Name -ne '.git' -and `
    $_.Name -ne 'sync.ps1' -and `
    $_.Name -ne 'launch_options.txt' `
} | Copy-Item -Destination $ConfigGamePath -Recurse -Force -Verbose
