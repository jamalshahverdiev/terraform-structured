terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}

