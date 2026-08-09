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

resource "google_storage_bucket" "bucket_del_codigo" {
  name          = "${var.project_id}-codigo"
  location      = var.region
  force_destroy = true
}

resource "google_storage_bucket_object" "codigo_funcion" {
  name   = "funcion.zip"
  bucket = google_storage_bucket.bucket_del_codigo.name
  source = "funcion.zip"
}

resource "google_cloudfunctions2_function" "funcion" {
  name        = var.funcion_nombre
  location    = var.region
  description = "Función con Terraform"

  build_config {
    runtime     = "python311"
    entry_point = "hello_world"

    source {
      storage_source {
        bucket = google_storage_bucket.bucket_del_codigo.name
        object = google_storage_bucket_object.codigo_funcion.name
      }
    }
  }

  service_config {
    max_instance_count = 3
    min_instance_count = 0
    available_memory   = "256M"
    timeout_seconds    = 60
  }
}

resource "google_cloudfunctions2_function_iam_member" "acceso_publico" {
  project        = var.project_id
  location       = var.region
  cloud_function = google_cloudfunctions2_function.funcion.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"
}