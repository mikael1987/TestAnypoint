data "terraform_remote_state" "github" {
  backend = "s3"
  config = {
    bucket         = "terraform-remote-state-vault"
    key            = "github/PRO/github-pro.tfstate"
    region         = var.aws_region
    dynamodb_table = "terraform_statelock"
  }
}
