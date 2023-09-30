provider "google" {
  project = "lateral-rider-400619"
  region  = "us-west1"
  credentials = file(".config/lateral-rider-400619-c8a85a70a00d.json")
}

module "web_server" {
  source         = "./modules/web-server"
# project_id     = var.project_id
  region         = var.region
  instance_type  = var.instance_type
}

module "firewall" {
  source = "./modules/firewall"
}