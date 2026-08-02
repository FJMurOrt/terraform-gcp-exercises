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

resource "google_sql_database_instance" "instancia" {
  name = var.instancia_nombre
  database_version = "MYSQL_8_0"
  region = var.region

  settings {
    tier = "db-f1-micro"

    backup_configuration {
      enabled = true
    }

    ip_configuration {
      ipv4_enabled = true
    }
  }

  deletion_protection = false
}

resource "google_sql_database" "base_de_datos" {
  name = var.db_nombre
  instance = google_sql_database_instance.instancia.name
}

resource "google_sql_user" "usuario" {
  name = var.db_usuario
  instance = google_sql_database_instance.instancia.name
  password = var.db_contraseña
}