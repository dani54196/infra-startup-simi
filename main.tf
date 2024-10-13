# modules/vm/main.tf
resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
    access_config {}
  }
}

# modules/vm/variables.tf
variable "name" {}
variable "machine_type" {}
variable "zone" {}
variable "image" {}
variable "network" {}

# modules/vm/outputs.tf
output "instance_id" {
  value = google_compute_instance.default.id
}