terraform {
  backend "s3" {
    bucket = "acs730-final-project-group2-staging"       // Bucket from where to GET Terraform State
    key    = "dev/webservers/terraform.tfstate" // Object name in the bucket to GET Terraform State
    region = "us-east-1"                        // Region where bucket created
  }
}
