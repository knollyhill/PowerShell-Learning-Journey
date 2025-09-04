# 8-08
# Create a script that acrchives old log files. 
# It should fine all .log files in a specific folder older than 7 days
# Then move them to an "archive" subfolder

$old_logs = get-childitem -path C:\Logs\ -File -Filter *.log | Where-Object { $_.LastWriteTime -ge (get-date).adddays(7)}
Move-Item $old_logs -Destination C:\Logs\archive

# Using -Filter becaue this is not recursive (-Include works w/ recursive or wildcard in path)

