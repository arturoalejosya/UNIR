# Provider Azure

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.98.0"
    }
  }
}

# Opciones de configuración
provider "azurerm" {
  features {}
}

# Grupo de recursos

resource "azurerm_resource_group" "rg" {
    name     =  "UNIRrg"
    location = var.location

    tags = {
        environment = "UNIRcp2"
    }

}

# Storage account

resource "azurerm_storage_account" "stAccount" {
    name                     = "staccountproduccion" 
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "UNIRcp2"
    }

}
