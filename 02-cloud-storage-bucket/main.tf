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

resource "google_storage_bucket" "bucket" {
  name = var.bucket_nombre
  location = var.region
  force_destroy = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}