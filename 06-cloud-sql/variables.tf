variable "project_id" {
  description = "ID del proyecto"
  type = string
  default = "southern-field-472712-j3"
}

variable "region" {
  description = "Región"
  type = string
  default = "europe-southwest1"
}

variable "instancia_nombre" {
  description = "Nombre de la instancia de Cloud SQL"
  type = string
  default = "instancia-sql-desde-terraform"
}

variable "db_nombre" {
  description = "Nombre de la base de datos"
  type = string
  default = "base-de-datos-cloud-sql"
}

variable "db_usuario" {
  description = "Usuario de la base de datos"
  type = string
  default = "adminGCP"
}

variable "db_contraseña" {
  description = "Contraseña del usuario"
  type = string
  sensitive = true
  default = "contradbgcp123"
}