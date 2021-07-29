resource "aws_emr_cluster" "cluster" {
  name                   = var.cluster_name
  release_label          = var.release_label
  security_configuration = aws_emr_security_configuration.examplea.name

  ec2_attributes {
    subnet_id                         = var.subnet_id
    emr_managed_master_security_group = aws_security_group.emr.id
    emr_managed_slave_security_group  = aws_security_group.emr.id
    instance_profile                  = aws_iam_instance_profile.examplea.arn
  }

  service_role = aws_iam_role.emr_service.arn
}





