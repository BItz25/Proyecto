terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "proyecto" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "proyecto01"
  }
  
  
  resource "docker_image" "proyecto02" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "josue"
  ports {
    internal = 84
    external = 8000
  }
}
}
