terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    docker = {
      source  = "kreuzwerker/docker"
      //version = "2.20.2"
    }
  }

  required_version = ">= 1.2.0"
}



provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "proyecto" {
  ami           = "ami-0d70546e43a941d70"
  instance_type = "t2.micro"
  security_groups= ["launch-wizard-1","default"]
  key_name= "josueriocampos"

  tags = {
    Name = "proyecto02"
  }
}
output "instance_public_ip" {
  description = "Obtener la IP publica de mi instancia"
  value = aws_instance.proyecto.public_ip  // aws_instance.$NOMBRE-RECURSO-TIPO-aws_instance$.public_ip
}



variable "reponame" {}
variable "container_port" {}

provider "docker" {}
registry_auth {
    username = "josuercb"
    password = "Harvey001."
  }
}

resource "docker_image" "proyecto" {
  name         = "proyecto:latest"
  keep_locally = true
}

resource "docker_container" "proy" {
  image = docker_image.proyecto.latest
  name  = var.reponame
  ports {
    internal = 80
    external = var.container_port
  }
}


  
