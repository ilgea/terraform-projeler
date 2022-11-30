terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.39.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "github" {
    token = "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"
}