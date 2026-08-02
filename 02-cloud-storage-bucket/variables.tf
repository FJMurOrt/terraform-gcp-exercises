variable "project_id" {
  description = "ID del projecto en GCP"
  type = string
  default = "southern-field-472712-j3"
}

variable "region" {
  description = "La región del bucket"
  type = string
  default = "europe-southwest1"
}

variable "bucket_nombre" {
  description = "Nombre del bucket"
  type = string
  default = "bucket-creado-con-terraform"
}