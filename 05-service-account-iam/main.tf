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

resource "google_service_account" "service_a" {
  account_id = var.sa_nombre
  display_name = var.sa_descrip
  description = "Service Account creado con Terraform"
}

resource "google_project_iam_member" "rol_para_el_sa" {
  project = var.project_id
  role = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.service_a.email}"
}