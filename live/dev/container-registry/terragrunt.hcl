terraform {
  source = "../../../terraform-modules/container-registry"
}

include {
  path = find_in_parent_folders("region.hcl")
}

inputs = merge(
  local.common_vars,
  {
    resource_group_name = local.tags.resource_group
    location       = local.location
    acr_name       = "mydevacr123"
    sku            = "Standard"
  } 
)
