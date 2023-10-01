variable "project_id" {
  description = "Google cloud Platform Project ID"
  default = "lateral-rider-400619"
}

variable "region" {
  description = "Defualt region of deployment"
  default = "us-west1-a"
}

variable "instance_type" {
  description = "Instance type where Web Server is being hosted"
  default = "f1-micro"
}

variable "ssh_key" {
    description = "Instance type where Web Server is being hosted"
    default = "./config/id_rsa.pub"
}

