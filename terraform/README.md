# Terraform EKS (multi-environment)

Structure:
- modules/vpc: wrapper around terraform-aws-modules/vpc/aws
- modules/eks: wrapper around terraform-aws-modules/eks/aws
- live/dev, live/qa, live/prod: per-environment config (state/backend, variables, and module wiring)

Quick start (per environment):
1. (Optional) Create S3 bucket & DynamoDB table for remote state:
   - aws s3 mb s3://MY-TF-STATE-BUCKET --region us-east-1
   - aws dynamodb create-table --table-name MY-TF-LOCK-TABLE --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST

2. Edit live/<env>/backend.tf and replace MY-TF-STATE-BUCKET and MY-TF-LOCK-TABLE with your values (or remove backend.tf to use local state).

3. Initialize:
   cd terraform/live/dev
   terraform init

4. Plan:
   terraform plan -var-file="terraform.tfvars"

5. Apply:
   terraform apply -var-file="terraform.tfvars"

6. Get kubeconfig:
   terraform output -raw kubeconfig > kubeconfig
   KUBECONFIG=./kubeconfig kubectl get nodes

Notes:
- Change node_groups and instance types to match your needs.
- For prod, tighten SSH and networking rules.
- I can convert these envs to use a single root codebase + var files (less duplication) or provide a Terragrunt setup.
