resource "aws_dynamodb_table" "s3_backend_locking" {
    name = var.dynamo_name
    hash_key = var.hash_key
    billing_mode = var.bill_mode
    attribute {
        name = var.hash_key
        type = "S"
    }
}
