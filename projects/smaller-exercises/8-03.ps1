# 8-03
# Use one of the previous weekly projects
# Add comment-based help to the script
# include .SYNOPSIS, .DESCRIPTION, and .EXAMPLE sections

# Weekly mini project that gathers and displays:
# computer hostname
# OS Version
# PowerShell Version
# Total Free Disk Space on C:
<#
This comment block provides comment-based help for functions/scripts/modules
Get-Help <Function-Name>
.SYNOPSIS
Gathers and displays:
    Computer Hostname
    OS Version
    PowerShell Version
    Total Disk Space on C:\

.DESCRIPTION
Uses $env:COMPUTERNAME to get the hostname
Uses Get-ComputerInfo to obtain OS name & Version
Uses $PSVersionTable to get PS version (converts version to string)
Uses Get-CimInstance to get Disk Space
.EXAMPLE
Get-HostInfo

This example outputs the host information
#>

# Gather Info and Save as Variables
$hostname = $env:COMPUTERNAME
$os_name = (Get-ComputerInfo -Property osname, osversion).osname
$os_version = (Get-ComputerInfo -Property osname, osversion).osversion
$ps_version = ($PSVersionTable.PSVersion)
$ps_version_string = "$($ps_version.Major).$($ps_version.Minor).$($ps_version.Patch)"
$free_space = (get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'").FreeSpace / (1024 * 1000000)

function Receive-Output {
    process { write-host $_ -ForegroundColor Green }
}

# Display Results
Write-Output "COMPUTER INFO-
Hostname: $hostname
OS: $os_name $os_version
PowerShell Version: $ps_version_string
Total Free Disk Space: $free_space GB" | Receive-Output


# Research PS comment-based help
# Understand how it allows 'Get-Help' to work on your own scripts and functions

# Notes