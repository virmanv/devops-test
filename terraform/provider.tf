# includes both helm and k8 provider
provider "kubernetes" {
    host = ""
    token = ""
    cluster_ca_certificate = ""
    load_config_file = false
    version = "->1.11"
}
provider "helm" {
    kubernetes {
        host = ""
        token = ""
        cluster_ca_certificate = ""
        load_config_file = false
    }
    version = "->1.0"
}