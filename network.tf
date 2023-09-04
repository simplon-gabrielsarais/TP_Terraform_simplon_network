# network.tf

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = "East US"
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

output "network_id" {
  value = azurerm_virtual_network.example.id
}

output "subnet_id" {
  value = azurerm_subnet.example.id
}
