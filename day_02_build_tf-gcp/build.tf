terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "qwiklabs-gcp-01-3c28a98c8e98"
}

resource "google_compute_network" "vpc_network" {
  name = "ed-vpc-network01"
}