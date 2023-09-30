resource "google_compute_instance" "web_server" {
  name         = "web-server-instance"
  machine_type = var.instance_type
  zone         = var.region

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

   network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Perform security hardening steps here (e.g., updates, user config)
    # Install and configure your web server here (e.g., Nginx)
  EOF

  tags = ["web-server"]
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}