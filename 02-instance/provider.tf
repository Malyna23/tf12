provider "aws" {
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
}

terraform {
  backend "s3" {
    bucket                  = "consultfstate"
    region                  = "eu-central-1"
    key                     = "02-terraform.tfstate"
    shared_credentials_file = "~/.aws/credentials"
  }
}
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket                  = "consultfstate"
    region                  = "eu-central-1"
    key                     = "01-terraform.tfstate"
    shared_credentials_file = "~/.aws/credentials"
  }
}
