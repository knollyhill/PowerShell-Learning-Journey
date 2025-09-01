# 7-29
# Write a script that checks the status of the 'Spooler' service. 
# If it's 'Stopped', the script should start it. 
# If it's 'Running', it should do nothing. 
# Use 'Get-Service', 'Start-Service', and an 'If' statement.

$spooler_service = get-service -Name Spooler
if ($spooler_service.name -eq "Stopped") {
    Start-Service $spooler_service
}
else {
    Write-Output "The service is not currently stopped."
}

# Summary of Windows PowerShell Cookbook by Lee Homes
# long "recipes" for administering and scripting tasks

