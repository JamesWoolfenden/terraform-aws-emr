

resource "aws_emr_security_configuration" "examplea" {
  name = "${var.cluster_name}-config"

  configuration = <<EOF
{
  "EncryptionConfiguration": {
    "EnableAtRestEncryption": true,
    "AtRestEncryptionConfiguration": {
      "S3EncryptionConfiguration": {
        "EncryptionMode": "SSE-KMS"
      },
      "LocalDiskEncryptionConfiguration": {
        "EncryptionKeyProviderType": "AwsS3"
      }
    }
  }
}
EOF
}