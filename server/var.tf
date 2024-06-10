variable "VAULT_TOKEN" {
  description = "The Vault token"
  type        = string
}

variable "pg_host" {
  description = "The address for the PostgreSQL server."
  type        = string
  default     = "10.100.100.100"
}

variable "pg_port" {
  description = "The port of the PostgreSQL server."
  default     = 5432
  type        = number
}

variable "pg_username" {
  description = "The username for the PostgreSQL connection."
  type        = string
  default     = "postgres"
}

variable "pg_admin_password" {
  description = "The superuser password for the PostgreSQL database"
  default     = "complex_password"
  type        = string
  sensitive   = true
}


variable "mongo_admin_password" {
  description = "The superuser password for the MongoDB database"
  type        = string
  sensitive   = true
  default     = "mongoadmin"
}

variable "mongo_username" {
  description = "The username for the MongoDB connection."
  type        = string
  default     = "mongoadmin"
}

variable "mongo_auth_db" {
  description = "The authentication database for the MongoDB connection."
  type        = string
  default     = "admin"
}

variable "mongo_port" {
  description = "The port of the MongoDB server."
  default     = 27017
  type        = number
}

variable "keycloak_admin_user" {
  description = "The username for the Keycloak admin user."
  type        = string
  sensitive   = true
  default     = "admin"
}

variable "keycloak_admin_pass" {
  description = "The password for the Keycloak admin user."
  type        = string
  default     = "freebsd"
  sensitive   = true
}

variable "keycloak_url" {
  description = "The URL for the Keycloak server."
  type        = string
  default     = "http://10.100.100.100:8080"
}

variable "ad_user" {
  default     = "vagrant"
  type        = string
  description = "AD username"
}

variable "ad_pass" {
  default     = "vagrant"
  type        = string
  description = "AD password"
}

variable "ad_host" {
  default     = "example.local"
  type        = string
  description = "AD hostname"
}

variable "ad_port" {
  default     = 5986
  type        = number
  description = "AD port"
}

variable "ad_protocol" {
  default     = "https"
  type        = string
  description = "AD protocol"
}

variable "winrm_insecure" {
  default = true
  type    = bool
}

variable "ou_name" { 
  default = "company" 
  type = string
  description = "value for the ou_name"
}

variable "path" { 
  default = "ou=company,dc=example,dc=local"
  type = string
  description = "value for the AD path" 
}

variable "description" { 
  default = "Company OUT for all Teams"
  description = "Description for the OU"
  type = string 
}

variable "protected" { 
  default = false 
  description = "Protected OU or not"
  type = bool
}
