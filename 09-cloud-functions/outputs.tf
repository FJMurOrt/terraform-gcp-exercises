output "funcion_nombre" {
  description = "Nombre de la función"
  value       = google_cloudfunctions2_function.funcion.name
}

output "funcion_enlace" {
  description = "Enlace a la función"
  value       = google_cloudfunctions2_function.funcion.service_config[0].uri
}

output "bucket_del_codigo" {
  description = "Bucket del código"
  value       = google_storage_bucket.bucket_del_codigo.name
}