# specifying the provider 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #Pessimistic Constraint Operator to make sure we are not changing major versions
      version = "~> 4.0"
    }
  }
}