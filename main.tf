# Create a Resource_Group 
resource "azurerm_resource_group" "rg1" {
  name     = "myTFResourceGroup"
  location = ""West Europe""
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = ""West Europe""
  resource_group_name = azurerm_resource_group.rg1.name
}

