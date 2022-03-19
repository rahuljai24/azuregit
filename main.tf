terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}  
}


resource "azurerm_resource_group" "terr" {
  location = "East US"
  name     = "terrops"

  tags = {
    environment = "prod"
  }

}

resource "azurerm_virtual_network" "vnettf" {
  resource_group_name = azurerm_resource_group.terr.name
  name                = "terr_vnet"
  location            = "East US"
  address_space       = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.terr.name
  virtual_network_name = azurerm_virtual_network.vnettf.name
  address_prefix     = "10.10.0.0/24"
 }
