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

resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.dataset_id
  description = "Dataset en bigquery desde Terraform"
  location = "EU"

  delete_contents_on_destroy = true
}

resource "google_bigquery_table" "tabla" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id = var.table_id

  schema = jsonencode([
    {
        name = "id"
        type = "INTEGER"
        mode = "REQUIRED"
    },
    {
        name = "Nombre"
        type = "STRING"
        mode = "REQUIRED"
    },
    {
        name = "Fecha"
        type = "DATE"
        mode = "NULLABLE"
    }
  ])
}