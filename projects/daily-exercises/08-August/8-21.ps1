# 8-21
# Script that creates a RG
# Creates a SA within the RG
# Confirms this was created
# Then deletes the resource group
# Use "Start-Sleep" between to admire your work

# Reusable function that creates RG if it doesn't exist
function Create-RGIfMissing {
    [CmdletBinding(SupportsShouldProcess)]
    # This allows functions to use advanced parameters like -Verbose, -ErrorAction, -WhatIf, -Confirm
    param (
        [Parameter(Mandatory)][string]$Name,
        [Parameter(Mandatory)][string]$Location
    )
    $rg = Get-AzResourceGroup -Name $Name -ErrorAction SilentlyContinue
    if ($rg) {
        Write-Verbose "RG '$Name' already exists in $($rg.Location)."
        return $rg
    }
    else {
        New-AzResourceGroup -Name $Name -Location $Location
    }
}

# Reusable function that creates SA if it doesn't exist
function Create-SAIfMissing {
    [CmdletBinding(SupportsShouldProcess)]
    # This allows functions to use advanced parameters like -Verbose, -ErrorAction, -WhatIf, -Confirm
    param (
        [Parameter(Mandatory)][string]$Name,
        [Parameter(Mandatory)][string]$ResourceGroupName,
        [Parameter(Mandatory)][string]$Location,
        # ValidateSet restricts params allowed & allows tab complete
        [ValidateSet('Standard_LRS','Standard_GRS','Standard_ZRS','Premium_LRS','Premium_ZRS','Standard_RAGRS')]
        [string]$SkuName = 'Standard_LRS',
        [ValidateSet('StorageV2','BlobStorage','FileStorage','BlockBlobStorage')]
        [string]$Kind = 'StorageV2',
        [ValidateSet('Hot','Cool','Cold')]
        [string]$AccessTier = 'Hot'
    )
    $sa = Get-AzStorageAccount -Name $Name -ErrorAction SilentlyContinue
    if ($sa) {
        Write-Verbose "SA '$Name' already exists in $($sa.Location)."
        return $sa
    }
    else {
        New-AzStorageAccount -Name $Name `
            -Location $Location `
            -ResourceGroupName $ResourceGroupName `
            -SkuName $SkuName `
            -Kind $Kind `
            -AccessTier $AccessTier
    }
}
function Create-RGAndSA {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)][string]$RgName,
        [Parameter(Mandatory)][string]$Location,
        [Parameter(Mandatory)][string]$StorageName,
        [ValidateSet('Standard_LRS','Standard_GRS','Standard_ZRS','Premium_LRS','Premium_ZRS','Standard_RAGRS')]
        [string]$SkuName = 'Standard_LRS',
        [ValidateSet('StorageV2','BlobStorage','FileStorage','BlockBlobStorage')]
        [string]$Kind = 'StorageV2',
        [ValidateSet('Hot','Cool','Cold')]
        [string]$AccessTier = 'Hot'
    )
    $rg = Create-RGIfMissing -Name $RgName -Location $Location
    $rg
    $sa = Create-SAIfMissing -Name $StorageName -ResourceGroupName $RgName -Location $Location -SkuName $SkuName -Kind $Kind -AccessTier $AccessTier
    $sa
}