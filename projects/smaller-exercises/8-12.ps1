# 8-12
# Script that creates an Azure storage account inside the RG you made yesterday
# Use 'New-AzStorageAccount'
# Storage accounts must be globally unique

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
