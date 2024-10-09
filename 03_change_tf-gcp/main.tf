terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "qwiklabs-gcp-00-6307b9e5b150"
  region  = "us-west1"  # Ensure the region is set
  zone    = "us-west1-a"  # Ensure the zone is set

}

resource "google_compute_network" "vpc_network" {
  name = "ed-vpc-network01"
}