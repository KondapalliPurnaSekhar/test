# Create a Resource_Group 
resource "azurerm_resource_group" "rg" {
  name     = var.Resource_Group
  location = var.location
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  
  name                = var.network
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.Resource_Group
}

# Create a sub_net network
resource "azurerm_subnet" "subnet" {
  count = 2
  name                 = "mysubnet-${count.index}"
  resource_group_name  = var.Resource_Group
  virtual_network_name = var.network
  address_prefixes     = ["10.0.${count.index}.0/24"]
}

