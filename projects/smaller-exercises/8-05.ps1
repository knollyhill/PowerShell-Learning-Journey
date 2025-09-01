# 8-05
# Script that uses '-match' operator 
# with a simple regular expression to find all files in a directory 
# that end with a number (ex: 'log2.txt)

Get-ChildItem -path 'C:\Logs\' | Where-Object { $_.BaseName -match '\d+$'}

# \d matches a digit (equivalent to [0-9])
    # + matches the previous token between one and unlimited times
# $ asserts position at the end of a line
# https://regex101.com/

# Use an online regex tester to experiment with basic patterns like '\d' (digit), '\w' (word character), and '^'

# \w matches any word character (equivalent to [a-zA-Z0-9_])
# ^ asserts position at start of a line