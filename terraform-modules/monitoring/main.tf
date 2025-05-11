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
  version    = "15.0.0"
  values     = [file("${path.module}/prometheus-values.yaml")]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "grafana/grafana"
  namespace  = "monitoring"
  create_namespace = true
  repository = "https://grafana.github.io/helm-charts"
  version    = "6.7.4"
  values     = [file("${path.module}/grafana-values.yaml")]
}