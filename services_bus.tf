# Creación del Service Bus Namespace
resource "azurerm_servicebus_namespace" "sbnamespace" {
  name  = "sbnamespace-${var.name_Project}-${var.enviroment}"
  location  = var.location
  resource_group_name = azurerm_resource_group.rgproyecto.name
  sku = "Standard"
  tags= var.tags  # ✅ tags SÍ está permitido en Namespace
}

# Creación de la cola en el Service Bus (versión actualizada)
resource "azurerm_servicebus_queue" "sbqueue" {
  name         = var.queue_name
  namespace_id = azurerm_servicebus_namespace.sbnamespace.id
  
  max_size_in_megabytes  = 1024
  dead_lettering_on_message_expiration = true
}