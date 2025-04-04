# Definición de la cuenta de almacenamiento
resource "azurerm_storage_account" "sacount" {
  name                     = "st${var.name_Project}${var.enviroment}proyecto"   # Usamos la variable para el nombre
  resource_group_name       = azurerm_resource_group.rgproyecto.name
  location                 = var.location   # Usamos la variable de ubicación
  account_tier              = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags   # Usamos las etiquetas definidas en variables.tf
}

# Configuración del sitio web estático
resource "azurerm_storage_account_static_website" "static_site" {
  storage_account_id       = azurerm_storage_account.sacount.id
  index_document           = "index.html"
  error_404_document       = "404.html"
}

# Creación de un contenedor en la cuenta de almacenamiento
resource "azurerm_storage_container" "contenedor1" {
  name                      = "imgs"   # Podrías también definir esto como una variable si lo deseas
  container_access_type      = "private"
  storage_account_id         = azurerm_storage_account.sacount.id
}

/*resource "azurerm_role_assignment" "webapp_storage_access" {
    scope = azurerm_storage_account.sacount.id
    role_definition_name = "Storage Blob Data Contributor"
    principal_id = azurerm_linux_web_app.webappui.identity[0].principal_id
}*/
