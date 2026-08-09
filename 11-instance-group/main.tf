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

resource "google_compute_network" "vpc" {
  name                    = "${var.primer_nombre}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.primer_nombre}-subnet"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_instance_template" "plantilla" {
  name_prefix  = "${var.primer_nombre}-plantilla-"
  machine_type = var.tipo_vm

  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
    disk_size_gb = 10
  }

  network_interface {
    network    = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.subnet.id
  }

  tags = ["web"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_health_check" "health_check" {
  name = "${var.primer_nombre}-health-check"

  check_interval_sec  = 10
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3

  tcp_health_check {
    port = 80
  }
}

resource "google_compute_region_instance_group_manager" "mig" {
  name   = "${var.primer_nombre}-mig"
  region = var.region

  base_instance_name = "${var.primer_nombre}-vm"

  version {
    instance_template = google_compute_instance_template.plantilla.id
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.health_check.id
    initial_delay_sec = 300
  }
}

resource "google_compute_region_autoscaler" "autoescalado" {
  name   = "${var.primer_nombre}-autoescalado"
  region = var.region
  target = google_compute_region_instance_group_manager.mig.id

  autoscaling_policy {
    max_replicas    = var.max_vms
    min_replicas    = var.min_vms
    cooldown_period = 60

    cpu_utilization {
      target = 0.6
    }
  }
}