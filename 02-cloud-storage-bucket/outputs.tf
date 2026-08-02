output "bucket_nombre" {
  description = "Nombre del bucket que se ha creado"
  value = google_storage_bucket.bucket.name
}

output "bucket_url" {
  description = "URL al bucket"
  value = google_storage_bucket.bucket.url
}

output "bucket_region" {
  description = "Ubicación del bucket"
  value = google_storage_bucket.bucket.location
}