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
  region = var.region
}

resource "aws_instance" "app_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_id]
  subnet_id              = var.subnet_id
  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_instance" "web_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_id]
  subnet_id              = var.subnet_id
  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
