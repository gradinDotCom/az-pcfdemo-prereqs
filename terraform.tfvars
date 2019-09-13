# limit short_name to <= 8 characters to allow for 4 char hex randomizer
env_short_name         = "azpcf"
location               = "centralus"
app_name               = ""

##############################
##  CONTRACTS               ##
##  These are items which   ##
##  we are fully dependent  ##
##  upon and represent an   ##
##  agreement set forth     ##
##  with a 'provider'.      ##
##############################

#  az account list --query "[?name=='Lower'].id" -o tsv
# FTS-Hub-Lower
# subscription_id       = "f42b5ced-26d6-4859-9e9f-7df21aa8f7bf"

# az account list --query "[?contains(name,'CI')].{Name:name,SubID:id}" -o tsv
# ETG-CI
subscription_id       = "6a7f5164-ceb0-4011-b83d-c0d109605871"

# az account list --query "[?contains(name,'CI') || contains(name,'Lower')].[name,id,tenantId]" -o table
tenant_id             = "cdf226d7-79fd-4290-a3a7-996968201a26"

# env_name makes up a large part of the resources created by this script, but also
# represents the prefix of our pre-defined resource group (i.e. env_name-rg1).
env_name              = "demo-uscentral-pcf"

# az ad group list --query "[?contains(displayName,'PCF')].displayName" -o tsv
# the owner variable is used as the group name to be given ownership RBAC to the resultant resource group
owner                 = "PAE_PCF"