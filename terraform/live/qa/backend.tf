# Example S3 backend
terraform {
  backend "s3" {
    bucket         = "MY-TF-STATE-BUCKET"
    key            = "eks/qa/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "MY-TF-LOCK-TABLE"
  }
}
