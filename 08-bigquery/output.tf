output "dataset_id" {
  description = "ID del dataset que se ha creado"
  value = google_bigquery_dataset.dataset.id
}

output "tabla_id" {
  description = "ID de la tabla que se ha creado"
  value = google_bigquery_table.tabla.table_id
}

output "dataset_url" {
  description = "URL del dataset en Bigquery"
  value = "https://console.cloud.google.com/bigquery?project=${var.project_id}&dataset=${var.dataset_id}"
}