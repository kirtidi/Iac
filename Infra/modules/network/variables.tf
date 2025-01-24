variable "resource_group_name" {
  description = "The name of the resource group where the network resources will be created"
  type        = string
}

variable "location" {
  description = "The Azure region where the network resources will be located"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "frontend_subnet_prefix" {
  description = "The prefix for the frontend subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "backend_subnet_prefix" {
  description = "The prefix for the backend subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "db_subnet_prefix" {
  description = "The prefix for the database subnet"
  type        = string
  default     = "10.0.3.0/24"
}
