param (
    $ConfigRepoPath = 'E:\Git\csgo-config',
    $ConfigGamePath = 'C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg',
    $UserSettingsPath = 'C:\Program Files (x86)\Steam\userdata\914786436\730\local\cfg'
)

Get-ChildItem -Path $ConfigRepoPath | Where-Object {
    $_.Name -in ('autoexec.cfg', 'training.cfg')
} | Copy-Item -Destination $ConfigGamePath -Recurse -Force -Verbose

Get-ChildItem -Path $ConfigRepoPath | Where-Object {
    $_.Name -in ('cs2_video.txt')
} | Copy-Item -Destination $UserSettingsPath -Recurse -Force -Verbose
