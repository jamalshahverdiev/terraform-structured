
provider "vault" {
  address = local.vault_url
  token   = var.SERVICES_TOKEN
}

provider "postgresql" {
  host            = data.vault_kv_secret_v2.pg_credentials.data["pg_host"]
  port            = data.vault_kv_secret_v2.pg_credentials.data["pg_port"]
  username        = data.vault_kv_secret_v2.pg_credentials.data["pg_username"]
  password        = data.vault_kv_secret_v2.pg_credentials.data["pg_password"]
  sslmode         = "disable"
  connect_timeout = 15
}

provider "mongodb" {
  host          = data.vault_kv_secret_v2.mongo_credentials.data["mongo_host"]
  port          = data.vault_kv_secret_v2.mongo_credentials.data["mongo_port"]
  username      = data.vault_kv_secret_v2.mongo_credentials.data["mongo_username"]
  password      = data.vault_kv_secret_v2.mongo_credentials.data["mongo_password"]
  auth_database = data.vault_kv_secret_v2.mongo_credentials.data["auth_database"]   
}

provider "keycloak" {
  client_id = data.vault_kv_secret_v2.keycloak_credentials.data["client_id"]
  username  = data.vault_kv_secret_v2.keycloak_credentials.data["keycloak_user"]
  password  = data.vault_kv_secret_v2.keycloak_credentials.data["keycloak_pass"]
  url       = data.vault_kv_secret_v2.keycloak_credentials.data["keycloak_url"]
}


provider "ad" {
  winrm_hostname = data.vault_kv_secret_v2.ad_credentials.data["winrm_hostname"]
  winrm_username = data.vault_kv_secret_v2.ad_credentials.data["winrm_username"]
  winrm_password = data.vault_kv_secret_v2.ad_credentials.data["winrm_password"] 
  winrm_port     = data.vault_kv_secret_v2.ad_credentials.data["winrm_port"] 
  winrm_proto    = data.vault_kv_secret_v2.ad_credentials.data["winrm_proto"]
  winrm_insecure = data.vault_kv_secret_v2.ad_credentials.data["winrm_insecure"]
}