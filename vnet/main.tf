resource "azurerm_resource_group" "rg" {
  name     = "${var.name}-${var.env}-ResourceGroup"
  location = var.region
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}-${var.env}-VNet"
  address_space       = var.vnet_cidr
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "public" {
  count = length(var.public_subnet)
  name                 = "${var.name}-${var.env}-public-${count.index}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.public_subnet[count.index]
}

resource "azurerm_subnet" "app" {
  count = length(var.app_subnet)
  name                 = "${var.name}-${var.env}-app-${count.index}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.app_subnet[count.index]
}

resource "azurerm_subnet" "db" {
  count = length(var.db_subnet)
  name                 = "${var.name}-${var.env}-db-${count.index}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.db_subnet[count.index]
}


