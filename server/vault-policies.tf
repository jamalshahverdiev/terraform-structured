resource "vault_policy" "iac_service_policy" {
  for_each = {
    for combo in local.account_region_combinations :
    "${combo.account_id}_${combo.env}_${combo.region}" => combo
  }

  name   = "iac_service_policy_${each.value.account_id}_${each.value.env}_${each.value.region}"
  policy = <<-EOT
path "${local.vault_code_dir}/data/${each.value.account_id}/${each.value.env}/${each.value.region}/${local.iac_path}/${local.services_secret_path}/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "${local.vault_code_dir}/metadata/${each.value.account_id}/${each.value.env}/${each.value.region}/${local.iac_path}/${local.services_secret_path}/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "${local.vault_code_dir}/data/${each.value.account_id}/${each.value.env}/${each.value.region}/${local.infra_path}/*" {
  capabilities = ["read", "list"]
}

path "${local.vault_code_dir}/metadata/${each.value.account_id}/${each.value.env}/${each.value.region}/${local.infra_path}/*" {
  capabilities = ["read", "list"]
}

path "auth/token/create" {
  capabilities = ["update"]
}
EOT
}
