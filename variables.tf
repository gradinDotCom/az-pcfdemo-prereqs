variable "env_name" {}

variable "location" {
  default     = "centralus"
}

variable "cloud_name" {
  description = "The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment"
  default     = "public"
}

variable "tenant_id" {}

variable "subscription_id" {}

variable "env_short_name" {}

variable "owner" {}