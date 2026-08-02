output "vpc_nombre" {
  description = "Nombre de la vpc que se ha creado"
  value = google_compute_network.vpc.name
}

output "vpc_id" {
  description = "ID de la VPC"
  value = google_compute_network.vpc.id
}

output "subnet_mombre" {
  description = "Nombre de la subnet que se ha creado"
  value = google_compute_subnetwork.subnet.name
}

output "subnet_cidr" {
  description = "Rango CIDR de la subnet que se ha creado"
  value = google_compute_subnetwork.subnet.ip_cidr_range
}