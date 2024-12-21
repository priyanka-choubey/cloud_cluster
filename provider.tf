terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

locals {
    aws_config = yamldecode(file("./config.yaml"))
}

provider "aws" {
    region = local.aws_config.region
    access_key = local.aws_config.access_key
    secret_key = local.aws_config.secret_key
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}