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
