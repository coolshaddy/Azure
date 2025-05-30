locals {
  location = "centralindia"
}

remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "sandeep-rg--test-dev"
    storage_account_name = "sandeepdevstorage"
    container_name       = "tfstate"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}
