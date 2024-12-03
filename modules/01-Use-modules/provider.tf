terraform {
  
  cloud {
    organization        = "prod-tdmund-tf"
    workspaces {
      name              = "module01"
    }
  }

  required_providers {
    aws = {
        source          = "hashicorp/aws"
        version         = "~> 5.46"
    }
  }

  required_version      = ">= 1.1.0"
}