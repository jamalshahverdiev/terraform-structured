resource "vault_mount" "vss1" {
  path        = local.vault_code_dir
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

