module "firewall_rules" {
  source = "../../modules/FirewallRules"

  firewall_rules = {
    rule1 = {
      description = "Allow HTTP and HTTPS traffic"
      allow = [
        {
          protocol = "tcp"
          ports    = ["80", "443"]
        }
      ]
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["web"]
  
    }
    rule2 = {
      description = "Allow SSH traffic"
      allow = [
        {
          protocol = "tcp"
          ports    = ["22"]
        }
      ]
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["ssh"]
    }
  }
}