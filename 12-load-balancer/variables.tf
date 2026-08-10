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
  default     = "app-balanceada"
}

variable "tipo_vm" {
  description = "Tipo de máquina de las VMs"
  type        = string
  default     = "e2-micro"
}