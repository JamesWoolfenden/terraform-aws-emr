provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      createdby = "Terraform"
      module    = "terraform-aws-emr"
    }
  }
}
