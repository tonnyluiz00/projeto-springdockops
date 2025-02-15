variable "firewall_rules" {
  type = map(object({
    description = string
    allow       = list(object({
      protocol = string
      ports    = list(string)
    }))
    source_ranges = list(string)
    target_tags   = list(string)
  }))
}