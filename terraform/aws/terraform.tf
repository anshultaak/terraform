
# which version used this terraform required 
terraform {
  required_version = "1.1.8"
  
  # which plugin verion required 
  required_providers { 
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }
}
