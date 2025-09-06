# 8-19
# Script that stops the Azure VM
# Then start it again

#Region Create VM
$newRG = "Test-RG"
$newRG_location = "westus2"
$newRG_tag = @{'environment'='testing'}
New-AzResourceGroup -Name $newRG -Location $newRG_location -Tag $newRG_tag
get-azresourcegroup -Name $newRG

$newVM = "Test-VM"
$newVM_location = "westus2"
$newVM_tag = @{'environment'='testing'}
New-AzVM -ResourceGroupName $newRG `
    -Location $newVM_location `
    -Name $newVM `
    -Size "Standard_D2s_v4" `
    -OSDiskDeleteOption delete `
    -NetworkInterfaceDeleteOption delete `
    -HibernationEnabled

<#
$VMLocalAdminUser = "LAUser"
$VMLocalAdminSecurePassword = Read-Host -AsSecureString "Enter the local admin password"
$LocationName = "westus2"
$ResourceGroupName = "Test-RG"
$ComputerName = "Test-VM"
$VMName = "Test-VM"
$VMSize = "Standard_D2s_v4"

$NetworkName = "Test-VNet"
$NICName = "MyNIC"
$SubnetName = "Test-Subnet01"
$SubnetAddressPrefix = "10.100.0.0/24"
$VnetAddressPrefix = "10.100.0.0/16"

$SingleSubnet = New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressPrefix
$Vnet = New-AzVirtualNetwork -Name $NetworkName -ResourceGroupName $ResourceGroupName -Location $LocationName -AddressPrefix $VnetAddressPrefix -Subnet $SingleSubnet
$NIC = New-AzNetworkInterface -Name $NICName -ResourceGroupName $ResourceGroupName -Location $LocationName -SubnetId $Vnet.Subnets[0].Id

$Credential = New-Object System.Management.Automation.PSCredential ($VMLocalAdminUser, $VMLocalAdminSecurePassword);

$VirtualMachine = New-AzVMConfig -VMName $VMName -VMSize $VMSize
$VirtualMachine = Set-AzVMOperatingSystem -VM $VirtualMachine -Windows -ComputerName $ComputerName -Credential $Credential -ProvisionVMAgent -EnableAutoUpdate
$VirtualMachine = Add-AzVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id
$VirtualMachine = Set-AzVMSourceImage -VM $VirtualMachine -PublisherName 'MicrosoftWindowsServer' -Offer 'WindowsServer' -Skus '2022-datacenter-azure-edition-core' -Version latest

New-AzVM -ResourceGroupName $ResourceGroupName `
    -Location $LocationName `
    -VM $VirtualMachine `
    -SecurityType TrustedLaunch `
    -OSDiskDeleteOption delete `
    -NetworkInterfaceDeleteOption delete `
    -HibernationEnabled `
    -Verbose
#>
#endregion

#Region Stop VM
Stop-azvm -Name Test-VM -ResourceGroupName Test-RG -Force

# -SkipShutdown to request non-graceful VM shutdown when keeping the VM provisioned
# -StatyProvisioned stops the VM but does not deallocated; still charged

#end region

#Region Start VM
Start-AzVM -Name Test-VM -ResourceGroupName Test-RG

#endregion