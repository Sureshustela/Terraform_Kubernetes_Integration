terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.19.0"
    }
  }

  backend "s3" {
    bucket = "suresh-practice-bucket"
    key = "remote-state"
    encrypt = true  
    use_lockfile = true
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
  
}


