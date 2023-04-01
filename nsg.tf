# Criar grupo de segurança Azure

resource "azurerm_network_security_group" "nsg_prd" {
  name = var.name_nsg
  location = var.location
  resource_group_name = azurerm_resource_group.rg_prd.name
}

# Criar regras de segurança dentro do grupo de segurança Azure

resource "azurerm_network_security_rule" "regras_entrada_basicas" {
  for_each = var.regras_entrada_basicas
  resource_group_name = azurerm_resource_group.rg_prd.name
  name = "porta_entrada_${each.value}"
  priority = each.key
  direction = "Inbound"
  access = "Allow"
  source_port_range = "*"
  protocol = "Tcp"
  destination_port_range = each.value
  source_address_prefix = "*"
  destination_address_prefix = "*"
  network_security_group_name = azurerm_network_security_group.nsg_prd.name
}

# Associar o grupo de segurança a subnet.

resource "azurerm_subnet_network_security_group_association" "nsga_prd" {
  subnet_id = azurerm_subnet.subnet_prd.id
  network_security_group_id = azurerm_network_security_group.nsg_prd.id
}
