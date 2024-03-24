# Arquivo para configuração das versões dos providers que vamos usar, como a aws e a própria versão do terraform


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

provider "aws" {
    # Configuration options
    region = "us-east-1"
  
}