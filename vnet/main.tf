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

resource "azurerm_subnet" "pub1" {
  name                 = "${var.name}-${var.env}-public-1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.public1
}

resource "azurerm_subnet" "pub2" {
  name                 = "${var.name}-${var.env}-public-2}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.public2
}

resource "azurerm_subnet" "app1" {
  name                 = "${var.name}-${var.env}-app-1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.app1
}

resource "azurerm_subnet" "app2" {
  name                 = "${var.name}-${var.env}-app-2"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.app2
}

resource "azurerm_subnet" "db1" {
  count = 2
  name                 = "${var.name}-${var.env}-db-1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.db1
}

resource "azurerm_subnet" "db2" {
  count = 2
  name                 = "${var.name}-${var.env}-db-2"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.db2
}
