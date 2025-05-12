locals {
  location = "centralindia"
}

remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "aks-rg"
    storage_account_name = "akstfstatestorage"
    container_name       = "tfstate"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}
