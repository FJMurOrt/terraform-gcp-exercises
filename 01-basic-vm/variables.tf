variable "project_id" {
    description = "ID del proyecto"
    type = string
    default = "southern-field-472712-j3"
}

variable "region" {
    description = "Región de la infraestructura"
    type = string
    default = "europe-southwest1"
}

variable "vm_nombre" {
    description = "Nombre de la VM"
    type = string
    default = "vm-sencilla-con-terraform-en-GCP"
}