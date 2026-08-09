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

resource "google_pubsub_topic" "topic" {
  name = var.topic_nombre
  message_retention_duration = "86600s"
}

resource "google_pubsub_subscription" "suscripcion_rapida" {
  name  = "${var.topic_nombre}-rapida"
  topic = google_pubsub_topic.topic.id
  ack_deadline_seconds = 20

  retry_policy {
    minimum_backoff = "10s"
  }
}

resource "google_pubsub_subscription" "suscripcion_lenta" {
  name  = "${var.topic_nombre}-lenta"
  topic = google_pubsub_topic.topic.id
  ack_deadline_seconds = 30

  expiration_policy {
    ttl = "300000.5s"
  }
}