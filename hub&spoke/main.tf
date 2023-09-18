# HUB RESOURCE GROUP
resource "azurerm_resource_group" "rg-hub" {
  name     = "vnet-${var.hub_net_name}-${var.env}-${var.location}-001"
  location = var.location
  tags = var.default_tags
}

# HUB VNET
resource "azurerm_virtual_network" "vnet-hub" {
  name                = "vnet-${var.hub_net_name}-${var.env}-${var.location}-001"
  address_space       = var.hub_cidr
  location            = azurerm_resource_group.rg-hub.location
  resource_group_name = azurerm_resource_group.rg-hub.name
  tags = merge(
    var.default_tags,
    {
      Name = "vnet-${var.hub_net_name}-${var.env}-${var.location}-001"
    },
  )
}

# Gateway Snet4
resource "azurerm_subnet" "gw-subnet" {
  name                 = "snet-${var.hub_net_name}-${var.hub_snet_gw}-${var.env}-${var.location}"
  resource_group_name  = azurerm_resource_group.rg-hub.name
  virtual_network_name = azurerm_virtual_network.vnet-hub.name
  address_prefixes     = var.gw_snet_cidr
}

# SPOKE 1 RESOURCE GROUP
resource "azurerm_resource_group" "rg-spoke1" {
  name     = "rg-${var.spoke_net_name}-network-${var.env}-${var.location}-001"
  location = var.location
  tags = var.default_tags
}

# SPOKE 1 VNET
resource "azurerm_virtual_network" "vnet-spoke1" {
  name                = "vnet-${var.spoke_net_name}-${var.env}-${var.location}-001"
  address_space       =  var.spoke1_cidr
  location            = azurerm_resource_group.rg-spoke1.location
  resource_group_name = azurerm_resource_group.rg-spoke1.name
  tags = merge(
    var.default_tags,
    {
      Name = "vnet-${var.spoke_net_name}-${var.env}-${var.location}-001"
    },
  )
}

# SPOKE 1 SUBNET
resource "azurerm_subnet" "snet-spoke1" {
  name                 = "snet-${var.spoke_snet_workload}-${var.env}-${var.location}-001"
  resource_group_name  = azurerm_resource_group.rg-spoke1.name
  virtual_network_name = azurerm_virtual_network.vnet-spoke1.name
  address_prefixes     = var.spoke1_snet_cidr 
}

# SPOKE 2 RESOURCE GROUP
resource "azurerm_resource_group" "rg-spoke2" {
  name     = "rg-${var.spoke_net_name}-network-${var.env}-${var.location}-002"
  location = var.location
  tags = var.default_tags
}

# SPOKE 2 VNET
resource "azurerm_virtual_network" "vnet-spoke2" {
  name                = "vnet-${var.spoke_net_name}-${var.env}-${var.location}-002"
  address_space       = var.spoke2_cidr
  location            = azurerm_resource_group.rg-spoke2.location
  resource_group_name = azurerm_resource_group.rg-spoke2.name
  tags = merge(
    var.default_tags,
    {
      Name = "vnet-${var.spoke_net_name}-${var.env}-${var.location}-002"
    },
  )
}

# SPOKE 2 SUBNET
resource "azurerm_subnet" "snet-spoke2" {
  name                 = "snet-${var.spoke_snet_workload}-${var.env}-${var.location}-002"
  resource_group_name  = azurerm_resource_group.rg-spoke2.name
  virtual_network_name = azurerm_virtual_network.vnet-spoke2.name
  address_prefixes     = var.spoke2_snet_cidr
}
