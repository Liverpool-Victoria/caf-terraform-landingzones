
module "dynamic_keyvault_secrets" {
  source  = "git::https://github.com/Liverpool-Victoria/terraform-azurerm-caf.git//modules/security/dynamic_keyvault_secrets?ref=postgres18"

  for_each = try(var.dynamic_keyvault_secrets, {})

  settings = each.value
  keyvault = module.launchpad.keyvaults[each.key]
  objects  = module.launchpad
}
