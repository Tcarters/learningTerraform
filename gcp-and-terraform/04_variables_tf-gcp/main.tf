terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
    credentials = file(var.credentials_file)
    project = var.project
    region = var.region
    zone = var.zone

 
}

resource "google_compute_network" "vpc_network" {
  name = "ed-vpc-network02"
}

resource "google_compute_instance" "vm_instance" {
  name = "linux-instance"
  machine_type = "e2-micro"
  tags         = ["web", "dev"] # added tags to the linux machine

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name  # Reference the VPC network correctly
    access_config {
      
    }
  }

}

