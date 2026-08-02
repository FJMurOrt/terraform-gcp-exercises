variable "project_id" {
  description = "ID del proyecto donde se aplica"
  type = string
  default = "southern-field-472712-j3"
}

variable "region" {
  description = "Región en GCP"
  type = string
  default = "europe-southwest1"
}

variable "sa_nombre" {
  description = "ID del Service Account"
  type = string
  default = "service-account-desde-terraform"
}

variable "sa_descrip" {
  description = "Nombre descriptivo del Serice Account"
  type = string
  default = "Creación de Service Account con Terraform"
}