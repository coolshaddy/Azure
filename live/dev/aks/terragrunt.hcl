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
    resource_group_name = local.tags.resource_group
    location       = local.location
    dns_prefix            = "aks-dev"
    vm_size               = "Standard_DS2_v2"
    tags                  = local.tags
    node_count     = 2
  }
)
