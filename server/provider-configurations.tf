provider "vault" {
  address = "http://10.100.100.100:8200"
  token   = var.VAULT_TOKEN
}

provider "keycloak" {
  client_id = "admin-cli"
  username  = var.keycloak_admin_user
  password  = var.keycloak_admin_pass
  url       = var.keycloak_url
}

provider "ad" {
  winrm_hostname = var.ad_host
  winrm_username = var.ad_user
  winrm_password = var.ad_pass
  winrm_port     = var.ad_port
  winrm_proto    = var.ad_protocol
  winrm_insecure = var.winrm_insecure
}