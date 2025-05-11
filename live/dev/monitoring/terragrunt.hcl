include {
  path = find_in_parent_folders("region.hcl")
}

terraform {
  source = "../../../terraform-modules/monitoring"
}

inputs = merge(
  local.common_vars,
  {
    cluster_name   = "aks-dev-cluster"
    resource_group_name = local.tags.resource_group
    location       = local.location

    prometheus_chart_version = "25.6.0"
    grafana_chart_version    = "7.3.0"
    enable_alerting          = true
  }
)
