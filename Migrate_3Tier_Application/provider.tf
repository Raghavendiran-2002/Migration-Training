provider "azurerm" {
  features  {}
  subscription_id = "<sub_id>"  
}

variable "region" {
  description = "The Azure region to deploy resources"
  default     = "westus2"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "rg_raghav"
}
