variable "project_id" {
  description = "ID del proyecto"
  type        = string
  default     = "southern-field-472712-j3"
}

variable "region" {
  description = "Región"
  type        = string
  default     = "europe-southwest1"
}

variable "primer_nombre" {
  description = "Primer nombre con el que se crean los recursos"
  type        = string
  default     = "app-escalable"
}

variable "subnet_cidr" {
  description = "Rango CIDR de la subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "tipo_vm" {
  description = "Tipo de máquina de las VMs"
  type        = string
  default     = "e2-micro"
}

variable "min_vms" {
  description = "Mínimo de instancias del grupo"
  type        = number
  default     = 2
}

variable "max_vms" {
  description = "Máximo de instancias del grupo"
  type        = number
  default     = 5
}