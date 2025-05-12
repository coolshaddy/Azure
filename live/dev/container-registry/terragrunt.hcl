terraform {
  source = "../../../terraform-modules/container-registry"
}

include {
  path = find_in_parent_folders()
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
    resource_group_name = local.tags.resource_group
    location            = local.location
    name            = "mydevacr123"
    sku                 = "Standard"
  }
)
