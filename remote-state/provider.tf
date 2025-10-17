terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket       = "believe-remote-state-86s-inyou"
    key          = "remote-state-demo" #with which name state file can be stored
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }

}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
