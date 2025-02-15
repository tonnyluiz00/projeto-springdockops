variable "instances" {
  type = list(object({
    compute_name = string
    machine_type = string
    zone         = string
    image        = string
    network      = string
    metadata_key = string
  }))
}