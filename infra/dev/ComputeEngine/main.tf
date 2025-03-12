module "google_compute_instance" {
  source  = "tonnyluiz00/module-compute_engine/gcp"
  version = "1.0.1"
  instances = [
    {
      compute_name = "instance-springdockops"
      machine_type = "t2a-standard-1"
      zone         = "us-central1-a"
      image        = "centos-stream-9-arm64-v20250123"
      network      = "default"
      metadata_key = var.metadata_key
      metadata_startup_script = "sudo dnf -y install dnf-plugins-core ; sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo;  sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin; sudo systemctl enable --now docker ; sudo service docker start ; sudo docker run -p 80:8080 tonnyluiz00/springdockops-api:latest"
    }
    ,
    {
      compute_name = "instance-springdockops2"
      machine_type = "t2a-standard-1"
      zone         = "us-central1-b"
      image        = "centos-stream-9-arm64-v20250123"
      network      = "default"
      metadata_key = var.metadata_key
      metadata_startup_script = "sudo dnf -y install dnf-plugins-core ; sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo;  sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin; sudo systemctl enable --now docker ; sudo service docker start ; sudo docker run -p 80:8080 tonnyluiz00/springdockops-api:latest"
    },
#    {
#      compute_name = "instance-springdockops3"
#      machine_type = "t2a-standard-1"
#      zone         = "us-central1-b"
#      image        = "centos-stream-9-arm64-v20250123"
#      network      = "default"
#      metadata_key = var.metadata_key
#    }
  ]

}
# data "google_compute_instance" "default" {
#   project      = "curso-terraform-tonny" # Replace with your project ID. If the project is setted in your provider, you can remove this property.
#   zone         = "us-central1-b" # The zone where your instance is deployed.
#   name         = "instance-springdockops2" # The name of your compute instance.
# }

# output "instance_internal_ip_data" {
#   value       = data.google_compute_instance.default.network_interface.0.network_ip
#   description = "The internal IP address of the instance retrieved via data source."
# }

# output "instance_external_ip_data" {
#   value       = data.google_compute_instance.default.network_interface.0.access_config.0.nat_ip
#   description = "The external IP address of the instance retrieved via data source."
# }

