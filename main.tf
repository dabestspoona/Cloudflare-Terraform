## Terraform goes here

locals {
  zone_domain = basename(abspath(path.root))
  account_id  = "account_id_here"
}

data "cloudflare_zone" "zone" {
  account_id = local.account_id
  name       = local.zone_domain
}
