provider "azurerm" {
  features = {}
}

# Resource Group
resource "azurerm_resource_group" "rg_raghav" {
  name     = "rg_raghav"
  location = "East US"
}

# Storage Account
resource "azurerm_storage_account" "excel_storage" {
  name                     = "excelraghavstorageacc"
  resource_group_name      = azurerm_resource_group.rg_raghav.name
  location                 = azurerm_resource_group.rg_raghav.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Storage Container
resource "azurerm_storage_container" "empdata_container" {
  name                  = "empdata"
  storage_account_name  = azurerm_storage_account.excel_storage.name
  container_access_type = "private"
}

# SQL Server
resource "azurerm_sql_server" "migratedbserver" {
  name                         = "migratedbserver"
  resource_group_name          = azurerm_resource_group.rg_raghav.name
  location                     = azurerm_resource_group.rg_raghav.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd!"
}

# SQL Database
resource "azurerm_sql_database" "employee_db" {
  name                = "EmployeeDB"
  resource_group_name = azurerm_resource_group.rg_raghav.name
  location            = azurerm_resource_group.rg_raghav.location
  server_name         = azurerm_sql_server.migratedbserver.name
  edition             = "Standard"
  requested_service_objective_name = "S0"
}

# Firewall Rule to Allow Azure Services
resource "azurerm_sql_firewall_rule" "allow_azure_ips" {
  name                = "AllowAzureIP"
  resource_group_name = azurerm_resource_group.rg_raghav.name
  server_name         = azurerm_sql_server.migratedbserver.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

# Firewall Rule to Allow Your IP
resource "azurerm_sql_firewall_rule" "allow_my_ip" {
  name                = "AllowMyIP"
  resource_group_name = azurerm_resource_group.rg_raghav.name
  server_name         = azurerm_sql_server.migratedbserver.name
  start_ip_address    = "223.185.24.237"
  end_ip_address      = "223.185.24.237"
}

# Data Factory
resource "azurerm_data_factory" "raghav_data_factory" {
  name                = "RaghavDataFactory"
  location            = azurerm_resource_group.rg_raghav.location
  resource_group_name = azurerm_resource_group.rg_raghav.name
}
