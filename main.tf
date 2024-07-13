
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  email   = "email-cloudflare@gmail.com"
  api_key = ""
}
resource "cloudflare_pages_project" "basic_project" {
  account_id        = ""
  name              = "devopslaboratory.com"
  production_branch = "main"
  source {

    type = "github"
    config {
      owner               = "fbrunoviana"
      repo_name           = "devopslaboratory-com"
      production_branch   = "main"
      deployments_enabled = true
    }

  }

  build_config {
    build_command   = "npm run build"
    destination_dir = "out"
  }
}
