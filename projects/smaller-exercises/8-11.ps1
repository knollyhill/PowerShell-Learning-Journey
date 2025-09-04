# 8-11
# Script to create a new azure Resource Group
# Use 'New-AzResourceGroup'
# Provide name and location

$newRG = Test-RG
$newRG_location = "westus2"
$newRG_tag = @{'environment'='testing'}

New-AzResourceGroup -Name $newRG -Location $newRG_location -Tag $newRG_tag
get-azresourcegroup -Name $newRG
Remove-AzResourceGroup -Name $newRG 
get-azresourcegroup -Name $newRG
