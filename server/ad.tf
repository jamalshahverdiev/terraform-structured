
resource "ad_ou" "o" {
  name        = var.ou_name
  path        = var.path
  description = var.description
  protected   = var.protected
}