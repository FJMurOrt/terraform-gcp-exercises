output "vm_nombre" {
    description = "Nombre de la VM creada"
    value = google_compute_instance.vm_sencilla
}

output "vm_zona" {
    description = "Zona en la que se ha creado la VM"
    value = google_compute_instance.vm_sencilla.zone
}

output "vm_ip" {
    description = "IP externa de la VM"
    value = google_compute_instance.vm_sencilla.network_interface[0].access_config[0].nat_ip
}