resource "aws_security_group" "emr" {
  # checkov:skip=CKV_AWS_382: Unrestricted outbound access required for resource functionality
  //todo
  name        = "block_access"
  description = "Block all traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "All local In"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "All Local Out"
    cidr_blocks = ["10.0.0.0/16"]
  }
}
