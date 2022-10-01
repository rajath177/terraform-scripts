provider "aws" {
    access_key = ""
    secret_key = ""
    region = ""
}
variable "bucket_name" {
    default = "s3-bucket-07987969"
}
resource "aws_s3_bucket" "test_bucket" {
    bucket = var.bucket_name
}
resource "aws_s3_bucket_versioning" "versioning_bucket" {
    bucket = aws_s3_bucket.test_bucket.bucket
    versioning_configuration {
      status = "Enabled"
    }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_sse" {
    bucket = aws_s3_bucket.test_bucket.bucket
    rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
    }
}