include {
  path = find_in_parent_folders("region.hcl")
}

dependency "network" {
  config_path = "../network"
}

terraform {
  source = "../../../terraform-modules/aks"
}

inputs = merge(
  local.common_vars,
  {
    cluster_name   = "aks-dev-cluster"
    resource_group = "rg-aks-dev"
    location       = "East US"
    node_count     = 2
  }
)
