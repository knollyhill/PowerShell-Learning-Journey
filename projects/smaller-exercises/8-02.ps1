# 8-02
# Write a script that uses the variable '$PSVersionTable' to display
# your PS version, edition, and the OS it's running on

$psversiontable | select-object PSVersion, PSEdition, OS

# Read the summary of 'Practical Powershell for IT Professionals by L. J. Locher

# Notes
