provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

resource "aws_s3_bucket" "prod_website" {
  bucket_prefix = var.bucket_prefix
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"

  }
}


resource "aws_s3_bucket_policy" "prod_website" {
  bucket = aws_s3_bucket.prod_website.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.prod_website.id}/*"
            ]
        }
    ]
}
POLICY
}

