
resource "helm_release" "redis_release"{
    name = "${local.appName}-redis"
    chart = "redis"
    repository = "https://charts.bitnami.com/bitnami"
    version = "4.0.9"
    namespace = "default"
    values = [
        <<-EOF
        image:
          pullPolicy: "IfNotPresent"
        cluster:
          enabled: false
        EOF
    ]
}