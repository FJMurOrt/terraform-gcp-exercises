output "ip_balanceador" {
  description = "IP pública del balanceador"
  value       = google_compute_global_forwarding_rule.forwarding_rule.ip_address
}

output "url_aplicacion" {
  description = "URL de acceso a la aplicación"
  value       = "http://${google_compute_global_forwarding_rule.forwarding_rule.ip_address}"
}

output "vm1_nombre" {
  description = "Nombre de la primera VM"
  value       = google_compute_instance.vm1.name
}

output "vm2_nombre" {
  description = "Nombre de la segunda VM"
  value       = google_compute_instance.vm2.name
}

output "backend_service" {
  description = "Nombre del backend"
  value       = google_compute_backend_service.backend.name
}