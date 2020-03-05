locals{
    appName = "vv"
}

variable "rabbitmq_default_pass"{
    default = "admin" // not a good practice you can always override it in TFE
}