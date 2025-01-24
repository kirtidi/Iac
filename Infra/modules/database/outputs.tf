output "sql_server_id" {
  description = "The ID of the SQL server"
  value       = azurerm_sql_server.main.id
}

output "sql_database_id" {
  description = "The ID of the SQL database"
  value       = azurerm_sql_database.main.id
}