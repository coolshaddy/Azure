include {
  path = find_in_parent_folders()
}

dependency "network" {
  config_path = "../network"
}

terraform {
  source = "../../terraform-modules/aks"
}

inputs = {
  cluster_name         = "dev-aks-cluster"
  location             = local.location
  resource_group_name  = "dev-aks-rg"
  dns_prefix           = "devaks"
  node_count           = 2
  vm_size              = "Standard_DS2_v2"
  tags                 = local.tags
}
