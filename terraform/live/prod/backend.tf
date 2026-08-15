# Example S3 backend for prod. Create bucket and DynamoDB table first.
terraform {
  backend "s3" {
    bucket         = "MY-TF-STATE-BUCKET"
    key            = "eks/prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "MY-TF-LOCK-TABLE"
  }
}
