terraform {
  source = "../../../terraform-modules/container-registry"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name                = "devacr12345"
  resource_group_name = "dev-aks-rg"
  location            = "East US"
  sku                 = "Standard"
  admin_enabled       = true
  tags = {
    env = "dev"
  }
}