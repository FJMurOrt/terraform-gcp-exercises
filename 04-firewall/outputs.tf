output "vpc_nombre" {
  description = "Nombre de la VPC que se ha creado"
  value = google_compute_network.vpc.name
}

output "con_ssh" {
  description = "Regla del firewall para que permita SSH"
  value = google_compute_firewall.con_ssh.name
}

output "con_http" {
  description = "Regla del firewall para que permita http/https"
  value = google_compute_firewall.con_http.name
}