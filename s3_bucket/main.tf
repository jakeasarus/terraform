resource "aws_s3_bucket" "b" {
  bucket_prefix = var.bucket_prefix
  acl    = var.acl

    versioning {
        enabled = var.versioning
    }

    logging {
        target_bucket = var.target_bucket
        target_prefix = var.target_prefix
    }

    server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_master_key_id
        sse_algorithm     = var.sse_algorithm
      }
    }
  }

    tags = var.tags
}