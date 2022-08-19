terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}


variable "reponame" {}
variable "container_port" {}

provider "docker" {}

resource "docker_image" "proyecto" {
  name         = "proyecto:latest"
  keep_locally = false
}

resource "docker_container" "proy" {
  image = docker_image.proyecto.latest
  name  = var.reponame
  ports {
    internal = 80
    external = var.container_port
  }
}
