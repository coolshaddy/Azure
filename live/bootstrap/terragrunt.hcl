terraform {
  source = "../../terraform-modules/backend-storage"
}

inputs = {
  resource_group_name   = "aks-rg"
  storage_account_name  = "akstfstatestorage" # must be globally unique
  container_name        = "tfstate"
  location              = "centralindia"
}
