
resource "google_compute_instance" "webserver" {
  name         = "web-server-instance"
  machine_type = var.instance_type
  zone         = var.region

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

   metadata = {
    ssh-keys = "avnee:${file(".config/id_rsa.pub")}"
  }

   network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = templatefile("${path.module}/startup.sh", {})
  tags = ["web-server", "http-server", "https-server"]
}