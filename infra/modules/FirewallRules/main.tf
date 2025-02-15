resource "google_compute_firewall" "rules" {
  for_each = var.firewall_rules
  name        = each.key
  network     = "default"
  description = each.value.description
  dynamic "allow" {
    for_each = each.value.allow
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }
  source_ranges = each.value.source_ranges
  target_tags   = each.value.target_tags
}