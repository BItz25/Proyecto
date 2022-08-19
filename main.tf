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
  region  = "us-eats-2"
}

resource "aws_instance" "proyecto" {
  ami           = "ami-02f3416038bdb17fb"
  instance_type = "t2.micro"
  security_groups= ["jospro","default"]
  key_name= "josuepro"

  tags = {
    Name = "proyecto02"
  }
}
output "instance_public_ip" {
  description = "Obtener la IP publica de mi instancia"
  value = aws_instance.proyecto.public_ip  // aws_instance.$NOMBRE-RECURSO-TIPO-aws_instance$.public_ip
}



  
