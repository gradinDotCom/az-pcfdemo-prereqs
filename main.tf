provider "azurerm" {
  version         = "1.33"
  subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
 }

provider "azuread" { version  = "0.6" }

provider "random" { version = "2.2"}

resource "azurerm_resource_group" "pcf_resource_group" {
  name     = "${var.env_name}-rg1"
  location = "${var.location}"
}

resource "azurerm_role_assignment" "pcf-team" {
    scope                = "${azurerm_resource_group.pcf_resource_group.id}"
    role_definition_name = "Owner"
    principal_id         = "${data.azuread_group.pcf.id}"
}

resource "random_id" "storage_account" {
  keepers = {
    sa_id = "${azurerm_resource_group.pcf_resource_group.id}"
  }

  byte_length = 2
}

resource "azurerm_storage_account" "pcf_general_sa" {
  name                     = "${var.env_short_name}${random_id.storage_account.hex}"
  resource_group_name      = "${azurerm_resource_group.pcf_resource_group.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "pcf_terraform" {
  name                  = "terraform"
  depends_on            = ["azurerm_storage_account.pcf_general_sa"]
  resource_group_name   = "${azurerm_resource_group.pcf_resource_group.name}"
  storage_account_name  = "${azurerm_storage_account.pcf_general_sa.name}"
  container_access_type = "blob"
}