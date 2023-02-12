#! /usr/bin/env pwsh
#Requires -RunAsAdministrator
#Requires -Version 7

$VerbosePreference = 'Continue'

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Install-Module Terminal-Icons -Force -Scope AllUsers
Install-Module posh-git -Force -Scope AllUsers
Install-Module PSReadline -AllowPrerelease -Force -Scope AllUsers
Install-Module Terminal-Icons -Force -Scope AllUsers
Install-Module platyPS -Force -Scope AllUsers
Install-Module Pester -Force -Scope AllUsers
Install-Module PowerShellGet -AllowPrerelease -Force -Scope AllUsers

@"

## MY PROFILE
Import-Module MyProfile
oh-my-posh init pwsh --config /usr/local/share/powershell/Modules/MyProfile/mytheme.omp.json  | Invoke-Expression
## / MY PROFILE

"@ | Add-Content -Path $PROFILE.AllUsersCurrentHost -Encoding utf8
