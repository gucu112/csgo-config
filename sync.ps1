param(
    $ConfigRepoPath = 'E:\Git\csgo-config',
    $ConfigGamePath = 'C:\Program Files (x86)\Steam\userdata\914786436\730\local\cfg'
)

# robocopy $ConfigRepoPath $ConfigGamePath /E /SEC /R:5 /W:5 /TBD /V /XD '.git' /XF 'readme.md' 'sync.ps1' 'launch_options.txt'

Get-ChildItem -Path $ConfigRepoPath | Where-Object {
    $_.Name -notIn ('.git', 'readme.md', 'sync.ps1', 'launch_options.txt')
} | Copy-Item -Destination $ConfigGamePath -Recurse -Force -Verbose

Set-ItemProperty -Path "$ConfigGamePath\video.txt" -Name IsReadOnly -Value $true -Verbose
