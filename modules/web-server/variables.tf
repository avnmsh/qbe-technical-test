variable "instance_type" {
  description = "Instance type where Web Server is being hosted"
  default = "f1-micro"
}

variable "region" {
  description = "Region where we are deploying Web-Server "
  default = "us-west1-a"
}
