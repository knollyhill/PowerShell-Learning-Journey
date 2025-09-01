# 8-04
# Write a script that uses 'Get-Credential' to securely prompt for a username and password
# Store it in a variable
# Display the username

$UsernamePassword = Get-Credential -Message "Enter your User/Password when prompted."
$UsernamePassword
$UsernamePassword.UserName
$UsernamePassword.GetNetworkCredential().password

# Explore the PSCredential object that 'Get-Credential' returns. 
# Understand that it's a secure object, not just plain text


# How can you get the password? 
$UsernamePassword.GetNetworkCredential().password