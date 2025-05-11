terraform {
  source = "../../../terraform-modules/container-registry"
}

include {
  path = find_in_parent_folders("region.hcl")
}

inputs = merge(
  local.common_vars,
  {
    resource_group = "rg-container-registry-dev"
    location       = "East US"
    acr_name       = "mydevacr123"
    sku            = "Standard"
  }
)
