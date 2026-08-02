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

resource "google_cloud_run_v2_service" "servicio_run" {
  name = var.servicio_nombre
  location = var.region

  template {
    containers {
      image = var.imagen_docker

      resources {
        limits = {
          cpu = "1"
          memory = "512Mi"
        }
      }

      ports {
        container_port = 8080
      }
    }
  }
}

resource "google_cloud_run_v2_service_iam_member" "acceso_publico" {
  project = var.project_id
  location = var.region
  name = google_cloud_run_v2_service.servicio_run.name
  role = "roles/run.invoker"
  member = "allUsers"
}