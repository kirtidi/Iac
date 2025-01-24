variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "frontend_app_service_name" {
  description = "The name of the frontend App Service"
  type        = string
}

variable "backend_app_service_name" {
  description = "The name of the backend App Service"
  type        = string
}

# variable "allowed_frontend_ips" {
#   description = "A list of IP addresses allowed to access the frontend App Service"
#   type        = list(string)
#   default     = []
# }

variable "db_connection_string" {
  description = "Connection string for the database"
  type        = string
}

variable "db_name" {
  description = "The name of database"
  type        = string
}
 

 variable "db_admin_password" {
   description = "db_admin_password"
   type = string
 }

variable "db_server_name" {
  description = "db_server_name"
  type = string
}


variable "sql_admin_username" {
  description = "admin-user"
  type        = string
}

variable "sql_password" {
  description = "paswrd"
  type        = string
}

variable "db_admin_user"{
    description = "adminuser"
    type        = string
}

variable "db_user"{
    description = "dbuser"
    type        = string
}

