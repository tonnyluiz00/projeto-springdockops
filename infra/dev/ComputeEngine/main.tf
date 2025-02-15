module "google_compute_instance" {
  source = "../../modules/ComputeEngine"
  instances = [
    {
      compute_name = "instance-springdockops"
      machine_type = "t2a-standard-1"
      zone         = "us-central1-a"
      image        = "centos-stream-9-arm64-v20250123"
      network      = "default"
      metadata_key = var.metadata_key
    }
#    ,
#    {
#      compute_name = "instance-springdockops2"
#      machine_type = "t2a-standard-1"
#      zone         = "us-central1-b"
#      image        = "centos-stream-9-arm64-v20250123"
#      network      = "default"
#      metadata_key = var.metadata_key
#    },
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

