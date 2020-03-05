resource "kubernetes_secret" "rmq_secret" {
  metadata {
    name = "${local.appName}-rmq-secret"
    namespace = "default"
  }
  data {
      RABBITMQ_DEFAULT_PASS = "${var.rabbitmq_default_pass}"
  }
}