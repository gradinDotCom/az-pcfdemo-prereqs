# data "terraform_remote_state" "pcfspoke" {
#   backend = "azurerm"
#   config {
#     storage_account_name = "etghubcoresvcs"
#     container_name = "terraform"
#     key = "etg-infrastructure-as-code/azure/etg-uscentral-lower-pcfspoke/terraform.tfstate"
#     # access_key = "nsSGCUjAOu87n3BpxoAxLvOjeHk9AcdGDK32rm2EsoeK5MJzIJmuyAdygibOjEggGlcemZHlnxYIrLyWYxXHnw=="
#   }
# }

# data "azurerm_subscription" "lower" {
#   subscription_id = "f42b5ced-26d6-4859-9e9f-7df21aa8f7bf"
# }

# data "azurerm_client_config" "cli" {}

data "azuread_group" "pcf" {
    name = "${var.owner}"
}