resource "keycloak_realm" "services" {
  realm             = local.services_secret_path
  enabled           = true
  display_name      = local.services_secret_path
  display_name_html = "<b>${local.services_secret_path}</b>"
  remember_me       = true
  login_theme       = "base"
}
