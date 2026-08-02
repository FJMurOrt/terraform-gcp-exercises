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

variable "servicio_nombre" {
  description = "Nombe del servicio de Cloud Run"
  type = string
  default = "servicio-cloud-run-desde-terraform"
}

variable "imagen_docker" {
  description = "Imagen que se despliega en Cloud Run"
  type = string
  default = "docker.io/fjmurort/cliniko:latest"
}