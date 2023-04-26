provider "aws" {
  region  = "eu-west-2"
  profile = "personal"
  default_tags {
    tags = {
      createdby = "Terraform"
      module    = "terraform-aws-emr"
    }
  }
}
