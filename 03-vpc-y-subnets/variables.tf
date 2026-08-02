variable "project_id" {
  description = "ID del proyecto en GCP"
  type = string
  default = "southern-field-472712-j3"
}

variable "region" {
  description = "Región en GCP"
  type = string
  default = "europe-southwest1"
}

variable "vpc_nombre" {
  description = "Nombre de la VPC"
  type = string
  default = "vpc-con-terraform-en-gcp"
}

variable "subnet_nombre" {
  description = "Nombre de la subnet"
  type = string
  default = "subnet-con-terraform"
}

variable "subnet_cidr" {
  description = "Rango CIDR de la subnet"
  type = string
  default = "10.0.1.0/24"
}