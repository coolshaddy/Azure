locals {
  location = "Central India"
  tags = {
    environment      = "dev"
    team             = "platform"
    resource_group   = "sandeep-rg--test-dev"
    vnet_name        = "vnet-aks-dev"
  }
  common_vars = {
    subscription_id = get_env("ARM_SUBSCRIPTION_ID")
    client_id       = get_env("ARM_CLIENT_ID")
    client_secret   = get_env("ARM_CLIENT_SECRET")
    tenant_id       = get_env("ARM_TENANT_ID")
  }
}
