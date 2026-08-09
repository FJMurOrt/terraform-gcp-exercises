output "nombre_del_topic" {
  description = "Nombre del topic"
  value       = google_pubsub_topic.topic.name
}

output "id_del_topic" {
  description = "ID del topic"
  value       = google_pubsub_topic.topic.id
}

output "suscripcion_rapida" {
  description = "Nombre de la suscripción rápida"
  value       = google_pubsub_subscription.suscripcion_rapida.name
}

output "suscripcion_lenta" {
  description = "Nombre de la suscripción lenta"
  value       = google_pubsub_subscription.suscripcion_lenta.name
}