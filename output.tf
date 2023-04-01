output "rg_name" {
  value = azurerm_resource_group.rg_prd.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet_prd.name
}

output "subnet_name" {
  value = azurerm_subnet.subnet_prd.name
}

output "pip_name" {
  value = azurerm_public_ip.pip_prd.name
}

output "nic_name" {
  value = azurerm_network_interface.nic_prd.name
}

output "nsg_name" {
  value = azurerm_network_security_group.nsg_prd.name
}

output "rule_name_80" {
  value = azurerm_network_security_rule.regras_entrada_basicas["110"].name
}

output "rule_name_443" {
  value = azurerm_network_security_rule.regras_entrada_basicas["120"].name
}

output "rule_name_3389" {
  value = azurerm_network_security_rule.regras_entrada_basicas["130"].name
}

output "rule_name_22" {
  value = azurerm_network_security_rule.regras_entrada_basicas["140"].name
}

output "nsg_subnet_association" {
  value = azurerm_network_security_group.nsg_prd.id
}

output "vm_name" {
  value = azurerm_windows_virtual_machine.vmwin_prd.name
}
