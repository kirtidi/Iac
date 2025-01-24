resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "app" {
  name                      = var.app_service_name
  location                  = var.location
  resource_group_name       = var.resource_group_id
  app_service_plan_id       = azurerm_app_service_plan.plan.id
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = var.application_insights_key
  }
}

output "app_service_url" {
  value = azurerm_app_service.app.default_site_hostname
}
