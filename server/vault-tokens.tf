resource "vault_token" "iac_rw_token" {
  for_each = {
    for combo in local.account_region_combinations :
    "${combo.account_id}_${combo.env}_${combo.region}" => combo
  }

  policies  = [vault_policy.iac_service_policy[each.key].name]
  no_parent = true
  renewable = true
  ttl       = "0s"
  period    = "315360000s"
}


