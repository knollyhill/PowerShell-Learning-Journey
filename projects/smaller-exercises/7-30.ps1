##### 7-30

<#
Write a script that uses 'Find-Module' to search the powershell gallery for a module (e.g. 'pester'). 
Then use 'Install-Module' to install it (use the '-Scope CurrentUser' parameter to avoid needing admin rights).
#>

$teams_modules = Find-Module -Name *Teams* 
Install-Module $teams_modules[0].name -Scope CurrentUser

# get-module -listavalible will show what's already installed/availble on the system
# find-module will allow you to search PSGallery repo

# Explore the PowerShell Gallery website. 
# See hwo modules are documented and rated.
# It's the app store for PowerShell

# '-Scope' param
# 'CurrentUser' can be specifed so the module is only saved to the local profile
# location: $HOME\Documents\PowerShell\Modules
# 'AllUsers' is default and installs the module so all users on computer can use it 
# location: C:\Program Files\PowerShell\Modules