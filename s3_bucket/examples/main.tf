module s3_bucket {
  source = "github.com/jakeasarus/terraform/s3_bucket"
  bucket_prefix = "this-is-only-a-test-bucket-delete-me-123"
  target_bucket = "this-is-the-target-bucket"
}