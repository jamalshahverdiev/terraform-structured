variable "SERVICES_TOKEN" {
    type = string
}

data "vault_kv_secret_v2" "pg_credentials" {
  mount = local.vault_mount_path
  name  = "${local.account_id}/${local.env}/${local.region}/${local.infra_path}/${local.pg_path}/${local.secret}"
}

data "vault_kv_secret_v2" "mongo_credentials" {
  mount = local.vault_mount_path
  name  = "${local.account_id}/${local.env}/${local.region}/${local.infra_path}/${local.mongo_path}/${local.secret}"
}

data "vault_kv_secret_v2" "keycloak_credentials" {
  mount = local.vault_mount_path
  name  = "${local.account_id}/${local.env}/${local.region}/${local.infra_path}/${local.keycloak_path}/${local.secret}"
}

data "vault_kv_secret_v2" "ad_credentials" {
  mount = local.vault_mount_path
  name  = "${local.account_id}/${local.env}/${local.region}/${local.infra_path}/${local.ad_path}/${local.secret}"
}