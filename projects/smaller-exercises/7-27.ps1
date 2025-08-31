# 7/27

# Modify yesterdays function to accept a '$ComputerName' parameter
# if the parameter is used, the function should try to get system info from that remote computer

# JULY 26th
#Create a simple function named 'Get-SystemInfo' that contains the code from one of the previous projects
# then, call the function at the end of the script to execute it
function Get-SystemInfo  {
param(
    $ComputerName
    # this is treated as an object by default
)

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
}
Get-SystemInfo

# Research the 'param()' block in PS functions and the [Parameter(Manadory=$true)]
# param() 
# defines parameters at the start of the script or function
# Tells PS what imputs the script can accept
<#
param(
    [string]$name,
    [int]$age
)
#>
#by default, parameters defined in param() are optional unless attributes like [Parameter(Mandatory=$true)]

# [Parameter(Mandatory=$true)]
# Adds metadata/behavior rules to a parameter
# makes a parameter required - PS will prompt the users if parameter not supplied
<#
param(
    [Parameter(Mandatory=$true)]
    [string]$Name
)
#>
# If "Name" is not provided, PS will stop and ask for it interactively