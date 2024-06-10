module "common_modules" {
  # source               = "./common_modules"
  # source               = "git::https://github.com/jamalshahverdiev/terraform-common-modules.git?ref=main"
  source               = "git::https://github.com/jamalshahverdiev/terraform-common-modules.git?ref=0.3.0"  
  env                  = local.env
  team                 = local.team
  service_name         = local.service_name
  scope                = local.scope
  category             = local.category
  ad_ou_dn             = local.ad_ou_dn
  callback_url         = local.callback_url
  vault_mount_path     = local.vault_mount_path
  region               = local.region
  infra_path           = local.infra_path
  account_id           = local.account_id
  path                 = local.path
  pg_path              = local.pg_path
  mongo_path           = local.mongo_path
  keycloak_path        = local.keycloak_path
  services_secret_path = local.services_secret_path
  secret               = local.secret
  SERVICES_TOKEN       = var.SERVICES_TOKEN
  postgres_enabled     = true
  mongodb_enabled      = true
  keycloak_enabled     = true
}

