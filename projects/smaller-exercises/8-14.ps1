# 8-14
# Review Cleaning Up Options/requirments
$newRG = "Test-RG"
$newRG_location = "westus2"
$newRG_tag = @{'environment'='testing'}
New-AzResourceGroup -Name $newRG -Location $newRG_location -Tag $newRG_tag
get-azresourcegroup -Name $newRG

New-AzStorageAccount -ResourceGroupName $newRG `
-Name n82k3l2pq0c `
-SkuName Standard_LRS `
-Location westus2 `
-Kind StorageV2 `
-AccessTier Hot `
-MinimumTlsVersion TLS1_2 `
-PublicNetworkAccess Disabled

Update-AzTag -ResourceId (Get-AzResource -Name "n82k3l2pq0c").ResourceId -Tag $newRG_tag -Operation Merge

# Cleaning Up
Remove-AzStorageAccount -Name "n82k3l2pq0c" -ResourceGroupName "$newRG" -Force
Get-AzResource -Name "n82k3l2pq0c"
Remove-AzResourceGroup -Name $newRG -Force
Get-azresourcegroup -Name $newRG