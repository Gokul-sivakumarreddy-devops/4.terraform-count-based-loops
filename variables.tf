variable "ami_id" {
    type = string
    default = "ami-0f3c7d07486cad139"    
}

variable "instance_names" {
    type = list
    default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","dispatch","web"]
  }

variable "zone_id" {
    type = string
    default = "Z062815430DMB9RUXA69R"    
}

variable "domain_name" {
    type = string
    default = "practiceazure.com"    
}

 