# include sa for rabbitmq
resource "kubernetes_service_account" "rmq"{
    metadata {
      name = "${local.appName}-sa"
      namespace = "default" //its not considered a good practice ideally I should have created a namespace resource and then link it here
    }
    automount_service_account_token = false
    secret {
        name = "${kubernetes_secret.rmq_secret.metadata.0.name}"
    }

}