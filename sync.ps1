param (
    $SteamCurrentUser
)

# Get script base directory
$BasePath = $PSScriptRoot

# Get steam ID if not provided
if (-not $SteamCurrentUser) {
    $SteamCurrentUser = Get-ItemPropertyValue -Path 'HKCU:\Software\Valve\Steam\ActiveProcess' -Name 'ActiveUser'
}

# Get game configuration directory
$GameBasePath = Get-ItemPropertyValue -Path 'HKLM:\Software\WOW6432Node\Valve\CS2' -Name 'InstallPath'
$GameConfigPath = Join-Path $GameBasePath 'game\core\cfg'

# Get steam user settings directory
$SteamBasePath = Get-ItemPropertyValue -Path 'HKLM:\Software\WOW6432Node\Valve\Steam' -Name 'InstallPath'
$UserSettingsPath = Join-Path $SteamBasePath 'userdata' $SteamCurrentUser '730\local\cfg'

# Copy over configuration files
Get-ChildItem -Path $BasePath | Where-Object {
    $_.Name -in ('autoexec.cfg', 'spectate.cfg', 'training.cfg', 'warmup.cfg')
} | Copy-Item -Destination $GameConfigPath -Recurse -Force -Verbose

# Copy over user settings files
Get-ChildItem -Path $BasePath | Where-Object {
    $_.Name -in ('cs2_video.txt')
} | Copy-Item -Destination $UserSettingsPath -Recurse -Force -Verbose

# Set video settings file as read-only
Set-ItemProperty -Path "$UserSettingsPath\cs2_video.txt" -Name IsReadOnly -Value $true -Verbose
