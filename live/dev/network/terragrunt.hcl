include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../terraform-modules/network"
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

    vnet_name             = "vnet-aks-dev"
    vnet_address_space    = ["10.0.0.0/8"]
    subnet_name           = "subnet-aks-dev"
    subnet_address_prefix = "10.240.0.0/16"
  }
)
