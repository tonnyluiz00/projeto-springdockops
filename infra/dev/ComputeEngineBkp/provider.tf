provider "google" {
  #credentials = file("key.json")

  project = "curso-terraform-tonny"
  region  = "us-central1"
  zone    = "us-central1-c"
}

terraform {
  backend "gcs" {
    bucket = "bucket-tonny"
    prefix = "projetospringdockops"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}