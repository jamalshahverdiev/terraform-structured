resource "vault_kv_secret_v2" "pg_superuser_credentials" {
  for_each = {
    for combo in local.account_region_combinations :
    "${combo.account_id}_${combo.env}_${combo.region}" => combo
  }

  depends_on          = [vault_mount.vss1]
  mount               = vault_mount.vss1.path
  name                = "${each.value.account_id}/${each.value.env}/${each.value.region}/${local.infra_path}/${local.pg_svc_path}/${local.secret_key_name}"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode({
    "pg_password" = var.pg_admin_password,
    "pg_username" = var.pg_username,
    "pg_host"     = var.pg_host,
    "pg_port"     = var.pg_port
  })
  custom_metadata {
    max_versions = 5
    data = {
      db_super_user = "password"
    }
  }
}

resource "vault_kv_secret_v2" "mongo_superuser_credentials" {
  for_each = {
    for combo in local.account_region_combinations :
    "${combo.account_id}_${combo.env}_${combo.region}" => combo
  }

  depends_on          = [vault_mount.vss1]
  mount               = vault_mount.vss1.path
  name                = "${each.value.account_id}/${each.value.env}/${each.value.region}/${local.infra_path}/${local.mongo_svc_path}/${local.secret_key_name}"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode({
    "mongo_password" = var.mongo_admin_password,
    "mongo_username" = var.mongo_username,
    "mongo_host"     = var.pg_host,
    "mongo_port"     = var.mongo_port,
    "auth_database"  = var.mongo_auth_db
  })
  custom_metadata {
    max_versions = 5
    data = {
      db_super_user = "password"
    }
  }
}

resource "vault_kv_secret_v2" "keycloak_superuser_credentials" {
  for_each = {
    for combo in local.account_region_combinations :
    "${combo.account_id}_${combo.env}_${combo.region}" => combo
  }

  depends_on          = [vault_mount.vss1]
  mount               = vault_mount.vss1.path
  name                = "${each.value.account_id}/${each.value.env}/${each.value.region}/${local.infra_path}/${local.keycloak_path}/${local.secret_key_name}"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode({
    "client_id"     = "admin-cli",
    "keycloak_user" = var.keycloak_admin_user,
    "keycloak_pass" = var.keycloak_admin_pass,
    "keycloak_url"  = var.keycloak_url
  })
  custom_metadata {
    max_versions = 5
    data = {
      db_super_user = "password"
    }
  }
}

resource "vault_kv_secret_v2" "ad_credentials" {
  for_each = {
    for combo in local.account_region_combinations :
    "${combo.account_id}_${combo.env}_${combo.region}" => combo
  }

  depends_on          = [vault_mount.vss1]
  mount               = vault_mount.vss1.path
  name                = "${each.value.account_id}/${each.value.env}/${each.value.region}/${local.infra_path}/${local.ad_path}/${local.secret_key_name}"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode({
    "winrm_hostname" = var.ad_host,
    "winrm_username" = var.ad_user,
    "winrm_password" = var.ad_pass,
    "winrm_port"     = var.ad_port,
    "winrm_proto"    = var.ad_protocol,
    "winrm_insecure" = var.winrm_insecure
  })
  custom_metadata {
    max_versions = 5
    data = {
      ad_user_pass = "password"
    }
  }
}

resource "vault_kv_secret_v2" "iac_rw_secret" {
  for_each = {
    for combo in local.account_region_combinations :
    "${combo.account_id}_${combo.env}_${combo.region}" => combo
  }

  depends_on          = [vault_mount.vss1]
  mount               = vault_mount.vss1.path
  name                = "${each.value.account_id}/${each.value.env}/${each.value.region}/${local.infra_path}/${local.services_secret_path}/${local.secret_key_name}"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode({
    "token" = vault_token.iac_rw_token[each.key].client_token
  })
  custom_metadata {
    max_versions = 5
    data = {
      iac_services = "token"
    }
  }
}



