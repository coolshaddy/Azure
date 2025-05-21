include {
  path = find_in_parent_folders()
}

dependency "network" {
  config_path = "../network"
  skip_outputs = true
}

terraform {
  source = "../../../terraform-modules/aks"
}

locals {
  region_config = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  common_vars   = local.region_config.locals.common_vars
  tags          = local.region_config.locals.tags
  location      = local.region_config.locals.location
}

inputs = merge(
  local.common_vars,
  {
    cluster_name        = "aks-dev-cluster"
    resource_group_name = local.tags.resource_group
    location            = local.location
    dns_prefix          = "aks-dev"
    vm_size             = "Standard_DS2_v2"
    tags                = local.tags
    node_count          = 2
  }
)
