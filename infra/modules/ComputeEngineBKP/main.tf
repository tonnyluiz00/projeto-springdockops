resource "google_compute_instance" "primary" {
  
  name         = var.compute_name 
  machine_type = var.machine_type 
  zone         = var.zone 

  boot_disk {
    initialize_params {
      image = var.imagem 
    }
  }

  network_interface {
    network = var.network 

    access_config {
      # Ephemeral IP
    }
  }

  metadata_startup_script = "sudo dnf -y install dnf-plugins-core ; sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo;  sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin; sudo systemctl enable --now docker ; sudo service docker start ; sudo docker run -p 80:8080 tonnyluiz00/springdockops-api:latest"

  metadata = {
    ssh-keys = var.metadata_key 
  }

  tags = ["web", "dev", "ssh"] 

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}