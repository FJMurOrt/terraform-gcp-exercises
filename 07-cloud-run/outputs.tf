output "servicio_nombre" {
  description = "Nombre del servicio que se ha creado"
  value = google_cloud_run_v2_service.servicio_run.name
}

output "url_del_servicio" {
  description = "URL pública al servicio"
  value = google_cloud_run_v2_service.servicio_run.uri
}

output "servicio_region" {
  description = "Región en la que se encuentra el servicio"
  value = google_cloud_run_v2_service.servicio_run.location
}