variable "project_id" {
  description = "ID del projecto que se usa en GCP"
  type = string
  default = "southern-field-472712-j3"
}

variable "region" {
  description = "Región de los recursos"
  type = string
  default = "europe-southwest1"
}

variable "vpc_nombre" {
  description = "Nombre de la VPC"
  type = string
  default = "vpc-con-firewall-con-terraform-en-gcp"
}