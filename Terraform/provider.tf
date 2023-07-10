terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.51.0"
    }
  }
  backend "s3" {
    bucket         = "next-js-assignment"
    key            = "state/terraform.state"
    region         = "us-east-1"
    dynamodb_table = "next"
  }
}


provider "aws" {

  region = "us-east-1"

}
