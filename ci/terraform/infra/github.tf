module "repos" {
  source = "git@github.com:grupomediaset/tf_module_euw1_mes-sm_github_repo?ref=v0.1.3"

  providers = {
    github = github
    vault  = vault
  }

  name           = "euw1-mes-corp-mulesoft"
  description    = "Proyecto APIs Mulesoft"
  default_branch = "dev"

  access = {
    mediaset-mulesoft-corporativo             = "push"
    mediaset-aprobadores-mulesoft-corporativo = "push"
    mediaset-sistemas-multiplataforma         = "push"
  }

   use_pr = true
   patterns = ["main", "dev", "release"]
   can_push = [
     "mediaset-sistemas-multiplataforma",
     "mediaset-aprobadores-mulesoft-corporativo",
     "mediaset-mulesoft-corporativo"
   ]
}
