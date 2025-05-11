include {
  path = find_in_parent_folders("region.hcl")
}

terraform {
  source = "../../../terraform-modules/monitoring"
}

locals {
  region_config = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  common_vars   = local.region_config.locals.common_vars
  tags          = local.region_config.locals.tags
  location      = local.region_config.locals.location
}

inputs = {
  subscription_id     = local.common_vars.subscription_id
  client_id           = local.common_vars.client_id
  client_secret       = local.common_vars.client_secret
  tenant_id           = local.common_vars.tenant_id

  cluster_name        = "aks-dev-cluster"
  resource_group_name = local.tags.resource_group
  location            = local.location
  node_count          = 2
}

