# 7/31

# Write a script that creates a new directory called 'C:\Logs'
# then creates a file inside it called 'test.log'
# and writes the current date and time into the file

$directory = 'C:\Logs'
if ((test-path -path $directory -PathType Container) -eq $false) {
    try{
        New-Item -ItemType Directory -Path $directory | out-null
        Write-Output "Directory 'C:\Logs' created!"
    }
    catch{
        Write-Erorr "Failed to create directory!"
    }
    try{
        get-date -Format "MM/dd/yyyy hh:mm" | Set-Content -Path 'C:\Logs\test.log'
        Write-Output "Created log file 'C:\Logs\test.log' and wrote date/time!"
    }
    catch{
        Write-Error "Failed to create log file and write date/time!"
    }
}
else {
    Write-Error "Directory 'C:\Logs' already exists!"
}

# Research the 'New-Item', 'Set-Content', and 'Add-Content' cmdlets.
# Understand the difference between 'Set-Content' and 'Add-Content'

# Set-content overwrites existing content
# Add-content appends to the end of the file
    # good for logging