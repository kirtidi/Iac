variable "resource_group_id" {
  description = "The resource group ID where the SQL Server and Database will be created"
  type        = string
}

variable "location" {
  description = "The Azure region where the SQL Server and Database will be located"
  type        = string
}

variable "db_admin_user" {
  description = "The administrator username for the SQL Server"
  type        = string
}

variable "db_admin_password" {
  description = "The administrator password for the SQL Server"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name of the SQL Database"
  type        = string
}

variable "db_server_name" {
  description = "The name of the SQL Server"
  type        = string
}
