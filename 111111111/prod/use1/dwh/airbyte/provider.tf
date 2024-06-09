terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }

  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.22.0"
    }
    mongodb = {
      source  = "Kaginari/mongodb"
      version = "0.1.7"
    }
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.4.0"
    }
  }
}

