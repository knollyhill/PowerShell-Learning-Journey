# 7-28

# Write a piece of code that might fail (like 'get-content' on a non-existent file) in a try/catch block. 
# in the 'Catch' block, write a user-friendly error message

try {
    Get-Content -Path .\DoesNotExist.txt
}
catch {
    Write-Error "This is a friendly error message"
}

# Read about the '$_' or '$PSItem' variable within a 'Catch block.
# '$_' and '$PSItem' are the same thing, '$PSItem' is the full name
# normally they're the current object flowing through the pipeline
# in a catch block, $_ is the ERROR OBJECT (or type of [System.Management.Automation.ErrorRecord])
try {
    1/0
}
catch {
    Write-Output "Caught an error: $($PSItem.Exception.Message)"
    Write-Output "Actual .NET exception Object: $($_.Exception)"
    Write-Output "Human readable error massage: $($_.Exception.Message)"
    Write-Output "Error category for debugging: $($_.CategoryInfo)"
    Write-Output "Unique ID of the error: $($_.FullyQualifiedErrorId)"
    Write-Output "Where the error occurred: $($_.InvocationInfo)"
}
