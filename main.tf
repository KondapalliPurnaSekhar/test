# Create a Resource_Group 
resource "azurerm_resource_group" "rg" {
  name     = var.Resource_Group
  location = var.location
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}


# Create a sub_net network
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = var.Resource_Group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
