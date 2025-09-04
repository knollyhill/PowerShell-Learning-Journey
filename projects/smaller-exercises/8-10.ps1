# 8-10
# Write a script that, after connecting uses 'Get-AzResourceGroup' to list all the resource groups in the sub

Import-Module Az
Connect-AzAccount -UseDeviceAuthentication
# using device auth to avoid putting in creds for now

Get-AzResourceGroup

# explored different commands

get-azresourcegroup -Tag @{'environment'='prod'}
