output "vm_template_id" {
  description = "ID de la plantilla de las VMs"
  value       = google_compute_instance_template.plantilla.id
}

output "mig_nombre" {
  description = "Nombre del grupo de las VMs"
  value       = google_compute_region_instance_group_manager.mig.name
}

output "mig_instance_group" {
  description = "Enlace del grupo de las VMs"
  value       = google_compute_region_instance_group_manager.mig.instance_group
}

output "nombre_del_autoescalado" {
  description = "Nombre del autoescalador del grupo"
  value       = google_compute_region_autoscaler.autoescalado.name
}

output "rango_de_vms" {
  description = "Límite del autoescalado de las VMs"
  value       = "Mínimo: ${var.min_vms} - Máximo: ${var.max_vms}"
}