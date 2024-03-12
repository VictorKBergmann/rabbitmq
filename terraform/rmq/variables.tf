variable "region" {
  description = "Define what region the instance will be deployed"
  default     = "us-east-1"
}

variable "name" {
  description = "RabbitMQ"
}

variable "env" {
  description = "Environment of the application"
  default     = "prod"
}

variable "instance_type" {
  description = "AWS Instance type defines the hardware configuration of the machine"
  default     = "t2.micro"
}

variable "repo" {
  description = "Repository of the application"
  default     = "https://github.com/VictorKBergmann/rabbitmq"
}

variable "vpc_id" {
  description = "VPC ID used to create the security group"
  default     = "vpc-0d8b2dfc0c019288f"
}

variable "group" {
  description = "the group tag to ansible to identify RMQ"
}

variable "profile" {
    description = "profile we will use for deploy"
}