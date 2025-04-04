# keyvault.tf
resource "azurerm_key_vault" "basic_kv" {
  name                       = "kv-${var.name_Project}-${var.enviroment}"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.rgproyecto.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7 # Mínimo requerido

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id # Usa el usuario actual

    key_permissions = [
      "Get", "List"
    ]

    secret_permissions = [
      "Get", "List", "Set", "Delete"
    ]
  }

  tags = {
    Environment = var.enviroment
  }
}

# Obtiene automáticamente la información del contexto actual
data "azurerm_client_config" "current" {}