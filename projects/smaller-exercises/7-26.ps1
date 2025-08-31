# JULY 26th
#Create a simple function named 'Get-SystemInfo' that contains the code from one of the previous projects
# then, call the function at the end of the script to execute it
function Get-SystemInfo {
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

# Reviewed The PowerShell Practice Primer
# Idea repeating and emphasizing 
# basic cmdlet usage
    # get-, set-, new-, remote-
    # pipeline flow and objects
    # practice get-process, get-service, get-eventlog, etc
# filtering/formatting
    # where-object, select-object, sort-object
    # format-table, format-list
# Variables and logic
    # Declare and assign variables
    # if, foreach, switch, etc
# Error Handling
    # try/catch-finally for control
    # understanding terminating vs non-terminating errors
# Scripting Basics
    # write, save, execute .ps1 files
    # comments and clear naming conventions
# Modules and uctions
    #importing moduels and defining reusable functions
