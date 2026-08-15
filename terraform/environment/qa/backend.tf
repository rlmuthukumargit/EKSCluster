# Example S3 backend for remote state. Edit and create the bucket + DynamoDB table before running init.
# If you don't want remote state, delete this file and Terraform will use the local backend.
terraform {
  backend "s3" {
    bucket         = "MY-TF-STATE-BUCKET"  # <-- replace with your bucket
    key            = "eks/qa/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "MY-TF-LOCK-TABLE"    # <-- replace with your table for state locking
  }
}
