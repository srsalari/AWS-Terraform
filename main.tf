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
  region = "ca-central-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-04479848f66ed1eb4"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-088a38b5caf54ea8d"]
  subnet_id              = "subnet-0c03ab023bf0a7ccf"
  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_instance" "web_server" {
  ami                    = "ami-04479848f66ed1eb4"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-088a38b5caf54ea8d"]
  subnet_id              = "subnet-0c03ab023bf0a7ccf"
  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "saeedmetrocollege14jan2024"

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