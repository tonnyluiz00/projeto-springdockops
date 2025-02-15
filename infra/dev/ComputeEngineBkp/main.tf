resource "google_compute_instance" "default" {
  name         = "instance-springdockops"
  machine_type = "t2a-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "centos-stream-9-arm64-v20250123"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral IP
    }
  }

  metadata_startup_script = "sudo dnf -y install dnf-plugins-core ; sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo;  sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin; sudo systemctl enable --now docker ; sudo service docker start ; sudo docker run -p 80:8080 tonnyluiz00/springdockops-api:latest"

  metadata = {
    ssh-keys = "TonnyLuiz:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4mC68kCXhObUOC3z5nkoXMYVbI080niAZBavzZsbwWWdbr0txtOmEbSv97SkIloH6XLX22gSoXsj9P0fgRmMfzUnoPIZWHFFMmtYo+ml+AHn8jPi+uc75gpj20ib6TCR675whsmQKB1rynxYDrzm0M8wbcqKLe+Fcr7dkTzMGwqHOCeX+4faRXu0+OJYFzb0EmsJM9OXj0w19riuZqDFhutgDV327Y5yOm2FpivCO8Xga6RMh8/qBhI63KgIcW+voMasCHcQK+tNlejSqTAJYsg5smBVs1Tg7QIT1CspVIBr9dxc8MjnTpKmtT8KQ69mHy+9oyyeUe5/FeBtPmEbJmSzrBLehwNAYuCLEvaLTfic0jG21jsB1RIyZ9APAL+azba3PHtEXiEihy0D2O4sxmwe4bqw9acVhPYq7hylamoRHRNoxGG2WgcHpfklZGc5elOFQXMVa1TZwdR0DFLFe5aNlXSQqXw9+gzE9reoCetXdqBKbgHc/RfLNl+7zR83SYq6KD4ZA1CHgZhYP8vQg5S27Lu0+hP8YLd9kDTCtws0b8R7Ur8nGVfDdcThR0WseOEez7syAU8/ZxwrD+dJQh465SAhmG+/gcwCfqwZHnytcD5v0BOkqDwCsBDpf8hQbnLwUfFuW8ZuJVeH8F1GssX1g8x9cybxtxagDx0zZcw== TonnyLuiz@MacBook-Air.local"
  }

  tags = ["web", "dev", "ssh"]

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

# [START compute_firewall_create HTTP]
resource "google_compute_firewall" "rule-http" {
  name        = "enabled-http"
  network     = "default"
  description = "Porta HTTP"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["189.114.42.66/32", "200.170.159.90/32"]
  target_tags   = ["web"]
}
# [START compute_firewall_create SSH]
resource "google_compute_firewall" "rule-ssh" {
  name        = "enabled-ssh"
  network     = "default"
  description = "Port SSH"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["189.114.42.66/32", "200.170.159.90/32"]
  target_tags   = ["ssh"]
}


