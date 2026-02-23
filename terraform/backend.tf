terraform {
  backend "s3" {
    bucket         = "task-9-terraform-state-12345"
    key            = "task-9/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}