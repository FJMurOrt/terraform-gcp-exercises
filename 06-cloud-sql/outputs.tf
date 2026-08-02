output "instancia_nombre" {
  description = "Nombre de la instancia que se creó"
  value = google_sql_database_instance.instancia.name
}

output "instancia_ip" {
  description = "IP pública de la instancia"
  value = google_sql_database_instance.instancia.ip_address[0].ip_address
}

output "base_de_datos" {
  description = "Nombre de la base de datos que se creó"
  value = google_sql_database.base_de_datos.name
}

output "nombre_conexion" {
  description = "Nombre de la conexión de la instancia"
  value = google_sql_database_instance.instancia.connection_name
}