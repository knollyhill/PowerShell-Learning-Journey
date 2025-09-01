# 8-01
# Weekly Mini-Project
# Write a script that checks the status of three specific Windows services
# Spooler, WinRM, BITS
# The script should output the name and status of each to the console

get-service -Name Spooler, WinRM, BITS | Select-Object Name, Status

# Refactor into a function for extra credit

function Get-ServiceStatus {
    param (
        [String[]]$service_names = @('Spooler','WinRM','BITS')
    )
    get-service -Name $service_names | Select-Object Name, Status
}
