# Salida del grupo de recursos creado
output "resource_group_name" {
  value       = azurerm_resource_group.rgproyecto.name
  description = "El nombre del grupo de recursos creado"
}

# Salida de la cuenta de almacenamiento
output "storage_account_name" {
  value       = azurerm_storage_account.sacount.name
  description = "El nombre de la cuenta de almacenamiento creada"
}

output "storage_account_primary_web_endpoint" {
  value       = azurerm_storage_account.sacount.primary_web_endpoint
  description = "La URL del sitio web estático habilitado en la cuenta de almacenamiento"
}

# Salida del namespace de Service Bus
output "servicebus_namespace_name" {
  value       = azurerm_servicebus_namespace.sbnamespace.name
  description = "El nombre del Service Bus Namespace creado"
}

# Salida de la cola del Service Bus
output "servicebus_queue_name" {
  value       = azurerm_servicebus_queue.sbqueue.name
  description = "El nombre de la cola creada en el Service Bus"
}
