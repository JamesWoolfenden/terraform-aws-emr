

resource "aws_emr_security_configuration" "examplea" {
  name = "${var.cluster_name}-config"

  configuration = <<EOF
{
  "EncryptionConfiguration": {
    "EnableAtRestEncryption": true,
    "AtRestEncryptionConfiguration": {
      "S3EncryptionConfiguration": {
        "EncryptionMode": "SSE-KMS",
        "AwsKmsKey": "${aws_kms_key.emr.arn}"
      },
      "LocalDiskEncryptionConfiguration": {
        "EncryptionKeyProviderType": "AwsKms",
        "AwsKmsKey": "${aws_kms_key.emr.arn}"
      }
    },
    "EnableInTransitEncryption": true,
    "InTransitEncryptionConfiguration": {
			"TLSCertificateConfiguration": {
				"CertificateProviderType": "PEM",
				"S3Object": "s3://MyConfigStore/artifacts/MyCerts.zip"
			}
		}
  }
}
EOF
}

resource "aws_kms_key" "emr" {
  # checkov:skip=CKV2_AWS_64: For example only, key policy managed via IAM
  enable_key_rotation = true
}
