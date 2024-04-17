

### Add Google Cloud provider

- Create main file: *touch main.tf*

```bash
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {

  project = "qwiklabs-gcp-02-b765aebfc8ce"
  region  = "europe-west4"
  zone    = "europe-west4-c"
}
```

- Initialize: *terraform init*

![image](https://github.com/Tcarters/learningTerraform/assets/71230412/4504820f-b0fc-4cf4-9845-e0670738f310)


### Build the infrastructure
Final code:

```tf
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {

  project = "qwiklabs-gcp-02-b765aebfc8ce"
  region  = "europe-west4"
  zone    = "europe-west4-c"
}

resource "google_compute_instance" "terraform" {
  name         = "terraform"
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}

```

- Plan *terraform plan*

![image](https://github.com/Tcarters/learningTerraform/assets/71230412/ca79e1ef-265e-445b-b1e2-923de7a652db)
![image](https://github.com/Tcarters/learningTerraform/assets/71230412/76d2e532-b3d5-45df-99be-daa8fa44aa6d)

- Apply the desired changes by running the following command: *terraform apply*

View instance created:
![image](https://github.com/Tcarters/learningTerraform/assets/71230412/8f042203-0bd2-4de3-90a7-4063d1233bd4)


### Change the infrastructure

- Adding network tags
- Editing the machine-type

```tf
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {

  project = "qwiklabs-gcp-02-b765aebfc8ce"
  region  = "europe-west4"
  zone    = "europe-west4-c"
}

resource "google_compute_instance" "terraform" {
  name         = "terraform"
  machine_type = "e2-micro"
  tags         = ["web", "dev"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}

```
Output:
![image](https://github.com/Tcarters/learningTerraform/assets/71230412/2bb3c17b-6442-4215-8bea-7198729107cd)

**The prefix ~ means that Terraform will update the resource in-place.**

![image](https://github.com/Tcarters/learningTerraform/assets/71230412/ba4d276c-0e34-4a4e-a063-7ac1cb3424d8)

- Editing the machine type without stopping the VM

```tf
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {

  project = "qwiklabs-gcp-02-b765aebfc8ce"
  region  = "europe-west4"
  zone    = "europe-west4-c"
}

resource "google_compute_instance" "terraform" {
  name         = "terraform"
  machine_type = "e2-medium"
  tags         = ["web", "dev"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
allow_stopping_for_update = true
}
```
Output: 
![image](https://github.com/Tcarters/learningTerraform/assets/71230412/90c1a03e-a67a-42b3-a2d4-ecf5e2e0e6ee)

### Destroy the infrastructure
- *terraform destroy*
