# # Criar Grupo de Recurso que armazenará os recursos Azure

resource "azurerm_resource_group" "rg_prd" {
  name     = var.name_rg
  location = var.location
  tags     = var.tags
}

# Criar Virtual Network Azure

resource "azurerm_virtual_network" "vnet_prd" {
  name                = var.name_vnet
  resource_group_name = azurerm_resource_group.rg_prd.name
  location            = var.location
  address_space       = var.vnet_address_space
}

# Criar Subnet dentro da Vnet Azure

resource "azurerm_subnet" "subnet_prd" {
  name                 = var.name_subnet
  resource_group_name  = azurerm_resource_group.rg_prd.name
  virtual_network_name = azurerm_virtual_network.vnet_prd.name
  address_prefixes     = var.subnet_address
}

# Criar IP público Azure - Para uso na virtual Machine  

resource "azurerm_public_ip" "pip_prd" {
  name                    = var.pip_prd
  location                = var.location
  resource_group_name     = azurerm_resource_group.rg_prd.name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
  domain_name_label       = "vmprd-pip"
}

# Criar Interface de Rede Azure - Para uso na virtual machine

resource "azurerm_network_interface" "nic_prd" {
  name                = var.nic_prd
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_prd.name

  ip_configuration {
    name                          = var.name_config_pip
    subnet_id                     = azurerm_subnet.subnet_prd.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_prd.id
  }
}

