resource "google_compute_firewall" "web_server_firewall" {
  name        = "web-server-firewall"
  network     = "default"
  allow {
    protocol = "tcp"
    ports    = ["22", "443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}
