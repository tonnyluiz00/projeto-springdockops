resource "google_compute_instance" "primary" {
  for_each = { for instance in var.instances : instance.compute_name => instance }

  name         = each.value.compute_name
  machine_type = each.value.machine_type
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network = each.value.network

    access_config {
      # Ephemeral IP
    }
  }

  metadata_startup_script = "sudo dnf -y install dnf-plugins-core ; sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo;  sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin; sudo systemctl enable --now docker ; sudo service docker start ; sudo docker run -p 80:8080 tonnyluiz00/springdockops-api:latest"

  metadata = {
    ssh-keys = each.value.metadata_key
  }

  tags = ["web", "dev", "ssh"]

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}