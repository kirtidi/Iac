variable "app_service_name" {
  description = "The name of the Azure App Service"
  type        = string
}

variable "resource_group_id" {
  description = "The resource group ID where the App Service will be created"
  type        = string
}

variable "location" {
  description = "The Azure region where the App Service will be deployed"
  type        = string
}

variable "application_insights_key" {
  description = "The Application Insights key for monitoring the App Service"
  type        = string
}

variable "app_service_plan_id" {
  description = "The App Service Plan ID that defines the pricing tier for the App Service"
  type        = string
}
