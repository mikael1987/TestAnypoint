terraform {
  required_version = "~> 1.0"

  backend "s3" {
    bucket         = "terraform-remote-state-vault"
    key            = "mulesoft/corp/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform_statelock"
  }

  required_providers {

    aws = {
      source = "hashicorp/aws"
      # default_tags {} requires 3.38.0
      version = ">= 3.38.0, < 4.0.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 4.16"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "~> 2.0"
    }

  }

}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  default_tags {
    tags = {
      repo  = "euw1-mes-corp-mulesoft"
      app   = "Mulesoft Corp"
      owner = "Corporativo"
      iac   = "terraform"
    }
  }
}



provider "github" {
  owner    = data.terraform_remote_state.github.outputs.github_owner
  base_url = data.terraform_remote_state.github.outputs.github_url
}

provider "vault" {
  # se puede usar la variable de entorno $VAULT_ADDR
  address = "https://awsvault.mediaset.es:8200"

  # mejor dejar sin poner, para que busque la variable
  # de entorno $VAULT_TOKEN o el fichero ~/.vault-token
  #token
}

