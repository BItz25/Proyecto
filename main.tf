terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}



provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "proyecto" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  security_groups= ["launch-wizard-1","default"]
  key_name= "josueproyecto"

  tags = {
    Name = "proyecto02"
  }
}
output "instance_public_ip" {
  description = "Obtener la IP publica de mi instancia"
  value = aws_instance.proyecto.public_ip  // aws_instance.$NOMBRE-RECURSO-TIPO-aws_instance$.public_ip
}



  
