terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "vm1" {
  name         = "${var.primer_nombre}-vm1"
  machine_type = var.tipo_vm
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }

  tags = ["web"]
}

resource "google_compute_instance" "vm2" {
  name         = "${var.primer_nombre}-vm2"
  machine_type = var.tipo_vm
  zone         = "${var.region}-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }

  tags = ["web"]
}

resource "google_compute_instance_group" "grupo_vms" {
  name = "${var.primer_nombre}-grupo"
  zone = "${var.region}-a"

  instances = [google_compute_instance.vm1.id]

  named_port {
    name = "http"
    port = 80
  }
}

resource "google_compute_health_check" "health_check" {
  name = "${var.primer_nombre}-health-check"

  http_health_check {
    port = 80
  }
}

resource "google_compute_backend_service" "backend" {
  name          = "${var.primer_nombre}-backend"
  protocol      = "HTTP"
  port_name     = "http"
  health_checks = [google_compute_health_check.health_check.id]

  backend {
    group = google_compute_instance_group.grupo_vms.id
  }
}

resource "google_compute_url_map" "url_map" {
  name            = "${var.primer_nombre}-url-map"
  default_service = google_compute_backend_service.backend.id
}

resource "google_compute_target_http_proxy" "proxy" {
  name    = "${var.primer_nombre}-proxy"
  url_map = google_compute_url_map.url_map.id
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name       = "${var.primer_nombre}-forwarding-rule"
  target     = google_compute_target_http_proxy.proxy.id
  port_range = "80"
}