provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  chart      = "prometheus-community/prometheus"
  namespace  = "monitoring"
  create_namespace = true
  repository = "https://prometheus-community.github.io/helm-charts"
  version    = "25.21.0"
  values     = [file("${path.module}/prometheus-values.yaml")]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "grafana/grafana"
  namespace  = "monitoring"
  create_namespace = true
  repository = "https://grafana.github.io/helm-charts"
  version    = "7.3.8"
  values     = [file("${path.module}/grafana-values.yaml")]
}