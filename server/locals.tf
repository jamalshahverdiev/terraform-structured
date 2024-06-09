locals {
  # Define the production and development environment variables
  prod_account_id = "111111111"
  dev_account_id  = "222222222"
  prod_env        = "prod"
  dev_env         = "dev"

  accounts = {
    "111111111" = ["us-east-1", "us-west-1"]
    "222222222" = ["eu-central-1", "eu-central-2"]
  }

  # Dynamically set environment based on the account ID
  env_per_account = {
    for account_id, regions in local.accounts : account_id => (
      account_id == local.prod_account_id ? local.prod_env :
      account_id == local.dev_account_id ? local.dev_env :
      "default_env"
    )
  }

  # Flatten the combination of account_id and region
  account_region_combinations = flatten([
    for account_id, regions in local.accounts : [
      for region in regions : {
        account_id = account_id
        env        = lookup(local.env_per_account, account_id, "default_env")
        region     = region
      }
    ]
  ])
  account_id     = "111111111"
  env            = "dev"
  region         = "us-east-1"
  pg_svc_path    = "postgresql"
  mongo_svc_path = "mongodb"
  keycloak_path  = "keycloak"
  ad_path        = "ad"
  iac_path             = "iac"
  infra_path           = "infra"
  secret_key_name      = "secret"
  services_secret_path = "services"
  vault_code_dir       = "vss1"
}

# 111111111/us-east-1/dev/infra/postgresql/secret  
# 111111111/us-east-1/dev/iac/postgresql/secret
# 111111111/us-east-1/dev/iac/services
# 111111111/us-east-1/dev/infra/
