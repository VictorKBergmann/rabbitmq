provider "aws" {
  region = var.region
}




# Security Group 
resource "aws_security_group" "allow_tls" {
  name        = "security group using Terraform"
  description = "security group using Terraform"
  vpc_id      = var.vpc_id

  tags = {
    Name = "Terraform_SG"
  }

  
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "RabbitMQ"
    from_port        = 15672
    to_port          = 15672
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


# server

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}


resource "aws_instance" "server" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.allow_tls.name]
  key_name        = "rabbitmq"
  tags = {
    Name        = var.name
    group = var.group
    Environment = var.env
    Provisioner = "Terraform"
    Repo        = var.repo
  }
}


