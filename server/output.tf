output "iac_rw_token" {
  value = {
    for key, token in vault_token.iac_rw_token :
    key => token.client_token
  }
  sensitive = true
}


output "vault_mount_path" {
  value = vault_mount.vss1.path
}

output "ad_ou_dn" {
  value = ad_ou.o.dn
}