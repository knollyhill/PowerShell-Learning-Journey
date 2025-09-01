# 8-06
# Script that uses 'Invoke-Command' 
# with '-ComputerName localhost' param 
# to run command like 'Get-Process'.
# This simulates remoting on your own machine

Invoke-Command -ComputerName localhost -ScriptBlock {write-output "start-process -name notepad"}

# This only executes in the console stream, no pop ups
    # Hello World did not work
# WinRM needs to be running for PS Remoting
# 'Enable-PSRemoting' will enable Windows Remote Management (WinRM)
# Target must be listening on 
    # HTTP: TCP 5985
    # HTTPS: TCP 5986 (when you configure a certificate)
# Listeners are creaed automatically with "Enable-PSRemoting
# Authentication via Kerberos by defulat, fall back to NTLM
# Can reguster custom endpoints if you wanted limited environments 