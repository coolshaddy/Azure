include {
  path = find_in_parent_folders("region.hcl")
}

terraform {
  source = "../../../terraform-modules/network"
}

inputs = merge(
  local.common_vars,
  {
    cluster_name   = "aks-dev-cluster"
    resource_group = "rg-aks-dev"
    location       = "East US"

    vnet_name             = "vnet-aks-dev"
    vnet_address_space    = ["10.0.0.0/8"]
    subnet_name           = "subnet-aks-dev"
    subnet_address_prefix = "10.240.0.0/16"
  }
)
