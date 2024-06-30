locals {
  # Define the production and development environment variables
  accounts = {
    "111111111" = {
      "prod" = ["us-east-1", "us-west-1"]
    }
    "222222222" = {
      "dev"    = ["eu-central-1", "eu-central-2"]
      "stable" = ["eu-central-1", "eu-central-2"]
    }
  }

  # Dynamically set environment based on the account ID
  account_region_combinations = flatten([
    for account_id, env_regions in local.accounts : [
      for env, regions in env_regions : [
        for region in regions : {
          account_id = account_id
          env        = env
          region     = region
        }
      ]
    ]
  ])
  account_id           = "111111111"
  env                  = "dev"
  region               = "us-east-1"
  pg_svc_path          = "postgresql"
  mongo_svc_path       = "mongodb"
  keycloak_path        = "keycloak"
  ad_path              = "ad"
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
