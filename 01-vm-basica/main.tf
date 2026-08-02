terraform {
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "~> 5.0"
      }
    }
}

provider "google" {
    project = var.project_id
    region = var.region
}

resource "google_compute_instance" "vm_sencilla" {
    name = var.vm_nombre
    machine_type = "e2-micro"
    zone = "${var.region}-a"

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"
      }
    }

    network_interface {
      network = "default"
      access_config {
        
      }
    }

    tags = ["terraform", "github"]
}