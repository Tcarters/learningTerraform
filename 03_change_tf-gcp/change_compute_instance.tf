resource "google_compute_instance" "vm_instance" {
  name = "linux-instance"
  machine_type = "e2-micro"
  zone         = "us-west1-a"  # Ensure the zone is set
  tags         = ["web", "dev"] # added tags to the linux machine

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
  # name = "ed-vpc-network01"
    network = google_compute_network.vpc_network.self_link  # Reference the VPC network correctly
    access_config {
      
    }
  }

}

