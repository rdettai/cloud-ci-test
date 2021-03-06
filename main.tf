terraform {
  required_version = ">=1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

  }
}

terraform {
  cloud {
    organization = "PbstckTest"

    workspaces {
      name = "vast-test"
    }
  }
}


provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      module      = "ci-test"
      provisioner = "terraform"
    }
  }
}

resource "aws_ecs_cluster" "fargate_cluster" {
  name = "test-ci-dummy-resource"
}
