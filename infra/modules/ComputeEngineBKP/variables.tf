variable "compute_name" {
    type = string
    description = "Nome da Instancia"
}

variable "machine_type" {
  type = string
  description = "Tipo da instancia"
}

variable "zone" {
  type = string
  description = "Localização do instancia"
}

variable "imagem" {
  type = string
  description = "Imagem do Tipo do S.O"
}

variable "network" {
  type = string
  description = "Tipo de Rede"
}

variable "metadata_startup_script" {
  type = string
  description = "Metadata para inicialização da instancia"
}

variable "metadata_key" {
  type = string
  description = "Chave Key"
}

variable "tags" {
  type        = set(string)
  description = "(Optional)"
  default     = []
}


#variable "instances" {
#  type        = any
#  description = "Variavel que habilita a criação de varios instancias de uma vez"
#  default     = []
#}