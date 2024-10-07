terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "tcp://192.168.236.188:2375"  # use the remote host IP address

}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false # keep the image locally after terraform creation ?
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id  #Utilise l'ID de l'image récupérée ci-dessus
  name  = "tutorial" # name of the container

  ports {
    internal = 80
    external = 8000
  }
}
