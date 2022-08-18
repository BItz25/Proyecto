terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}


provider "docker"{
  host="unix:///var/run/docker.sock"
}

resource "docker_image" "juan" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_conytainer" "index"{
  name= "index"
  image = "josuercb/proyecto02"
  
  ports{
    internal=80
    external=84
  }
}







