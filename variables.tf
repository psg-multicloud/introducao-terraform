##################
# USO GERAL       #
##################

#String

variable "location" {
  type = string
  description = "Localizacao dos recursos da Azure"
  default = "eastus"
}

##################
# GRUPO DE RECURSOS #
##################

#String
variable "name_rg" {
  type = string
  description = "nome do resource group"
  default = "RG-PRD-GLOBALHITSS"
}

#Map
variable  "tags" {
  type = map
  description = "tags nos recursos e servicos do azure"
  default = {
     ambiente = "prd"
     responsavel = "patricia"
     centro-de-custo = "globalhitss"   
     provisioner = "terraform"  
  }
}

##################
# REDE VIRTUAL     #
##################

#String

variable "name_subnet" {
  type = string
  description = "nome da subnet azure"
  default = "subnet-prd-globalhitss"
}

#String

variable "name_vnet" {
  type = string
  description = "nome da vnet azure"
  default = "vnet-prd-globalhitss"
}

#List

variable "vnet_address_space" {
  type = list
  description = "address space vnet Azure"
  default = ["10.0.0.0/16", "192.168.0.0/16"]
}

#List

variable "subnet_address" {
  type = list
  description = "address subnet prd Azure"
  default = ["10.0.2.0/24"]
}

#String

variable "pip_prd" {
    type = string
    description = "nome do ip publico vm prd"
    default = "pip-prd" 
}

#String
variable "nic_prd" {
    type = string
    description = "nome da nic vm prd"
    default = "nic_prd"
}

#String
variable "name_config_pip" {
    type = string
    description = "nome da config ip"
    default = "ipexterno-config"
}


##################
# MÁQUINA VIRTUAL  #
##################

#String

variable "user" {
  type = string
  description = "user vm"
  default = "adminuser"
}

#String

variable "pass" {
  type = string
  description = "senha vm"
  default = "Cy260017@2020#"
}

#String
variable "size_vm" {
  type = string
  description = "size vm"
  default = "Standard_B1ls"
}

#String
variable "name_vm" {
  type = string
  description = "Nome da Vm Azure"
  default = "azuvmwin01"
}

#####################
# GRUPO DE SEGURANÇA  #
######################

#String

variable "name_nsg" {
    type = string
    description = "nome do grupo de segurança Azure"
    default = "nsg-prd"
}

#String

variable "regras_entrada_basicas" {
    type = map(any)
    default = {
      110 = 80
      120 = 443
      130 = 3389
      140 = 22
    } 
}