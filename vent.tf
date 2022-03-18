provider "azurerm" {
  version         = "=2.20.0"
  subscription_id = "9a407b72-88d1-476e-9c46-facca399d1f5"
  client_id       = "94388429-b820-420a-9d33-6990d47ff6e8"
  client_secret   = "uSV7Q~1LkciBrk6QlDqbW64H2dApGy2gnjBba"
  tenant_id       = "7d74716b-b050-4057-a0ab-41231b240efe"
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
  name                = "abc_prod_vnet"
  location            = "West Europe"
  address_space       = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.terr.name
  virtual_network_name = azurerm_virtual_network.vnettf.name
  address_prefix     = "10.10.0.0/24"
 }
