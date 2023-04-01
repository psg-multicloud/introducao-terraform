# Criar vm Windows Server 2016 Datacenter 

resource "azurerm_windows_virtual_machine" "vmwin_prd" {
  name                = var.name_vm
  resource_group_name = var.name_rg
  location            = var.location

  size           = var.size_vm
  admin_username = var.user
  admin_password = var.pass

  network_interface_ids = [azurerm_network_interface.nic_prd.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}