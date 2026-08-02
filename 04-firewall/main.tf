terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~>5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region = var.region
}

resource "google_compute_network" "vpc" {
  name = var.vpc_nombre
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "con_ssh" {
  name = "que-permita-el-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["ssh"]
}

resource "google_compute_firewall" "con_http" {
  name = "que-permita-http"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["web"]
}

