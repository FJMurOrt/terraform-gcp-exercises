output "email_del_sa" {
  description = "Email del Service Account"
  value = google_service_account.service_a.email
}

output "nombre_del_sa" {
  description = "Nombre del Service Account"
  value = google_service_account.service_a.name
}

output "id_del_sa" {
  description = "ID único del Service Account"
  value = google_service_account.service_a.unique_id
}