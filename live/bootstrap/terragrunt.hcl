terraform {
  source = "../../terraform-modules/backend-storage"
}

inputs = {
  resource_group_name   = "sandeep-rg--test-dev"
  storage_account_name  = "sandeepdevstorage" # must be globally unique
  container_name        = "tfstate"
  location              = "centralindia"
}
