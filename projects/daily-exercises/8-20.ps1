# 8-20

# remove/delete the RG to clear the slate

Remove-AzResourceGroup -Name Test-RG

# This allows the deletion of all resources within that Rg
# This is great because it's cattle and ultra reproducable
# We're not attached to it because it's one script away from being re-created
# We want to avoid "pets" which are very customized
