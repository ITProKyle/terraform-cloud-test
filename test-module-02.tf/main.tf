terraform {

  backend "remote" {}
}

provider "aws" {
  version = "~> 2.0"
  region = var.aws_region
}

resource "aws_sqs_queue" "terraform_queue" {
  delay_seconds = 90

  tags = {
    Variable1Value = var.tag1_value
  }
}
