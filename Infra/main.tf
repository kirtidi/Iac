terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

# Provider Block
provider "azurerm" {
 features {}          
}

module "frontend" {
  source             = "./modules/app_service"
  app_service_name   = var.frontend_app_service_name
  resource_group_id  = azurerm_resource_group.main.id
  subnet_id          = module.network.frontend_subnet_id
  app_service_plan   = module.frontend_app_service_plan.app_service_plan_id
}

module "backend" {
  source             = "./modules/app_service"
  app_service_name   = var.backend_app_service_name
  resource_group_id  = azurerm_resource_group.main.id
  subnet_id          = module.network.backend_subnet_id
  app_service_plan   = module.backend_app_service_plan.app_service_plan_id
}

module "database" {
  source             = "./modules/database"
  resource_group_id = azurerm_resource_group.main.id
  location = var.location
  db_server_name = var.db_server_name
  db_admin_user = var.db_admin_user
  db_name = var.db_name
  db_admin_password = var.db_admin_password


}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_firewall" "frontend_firewall" {
  name                = "frontend-firewall"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  sku_tier                 = "Standard"  
   sku_name                 = "AzureFirewall"

  ip_configuration {
    name                 = "firewall-ip-config"
    subnet_id            = module.network.frontend_subnet_id
    public_ip_address_id = module.network.frontend_public_ip_id
  }
}

resource "azurerm_network_security_group" "frontend_nsg" {
  name                = "frontend-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_network_security_rule" "frontend_firewall_rule" {
  name                        = "frontend-allow-ip"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = ["192.168.1.100", "192.168.2.50"]
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.frontend_nsg.name
}
