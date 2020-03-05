# include tf script to install rabbitmq
resource "helm_release" "rabbitMq_release"{
    name = "${local.appName}-rabbitmq"
    chart = "rabbitmq"
    repository = "https://charts.bitnami.com/bitnami"
    version = "6.18.1"
    namespace = "default"
    values = [
        <<-EOF
        image:
          pullPolicy: "IfNotPresent"
        rabbitmq:
          username: "zulip"
          password: "${kubernetes_secret.rmq_secret.metadata.0.name}"         
        EOF
    ]
}