terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60.0"
    }
  }

  required_version = ">= 1.9.0"
}

provider "aws" {
  region = "us-west-2"
}

module "rds-ryokosuge" {
  source  = "app.terraform.io/MIXI/rds-ryokosuge/aws"
  version = "1.0.0"
  # insert required variables here
  db_name     = "Handson_ryokosuge"
  db_password = "test1234"
  db_username = "root"
}

resource "aws_instance" "app_server" {
  ami           = "ami-05134c8ef96964280"
  instance_type = "t2.micro"

  tags = {
    Name        = "Handson_ryokosuge"
    TED         = "20240829_Handson"
    Project     = "Handson"
    Environment = "test"
  }
}
