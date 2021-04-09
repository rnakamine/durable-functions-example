resource "azurerm_resource_group" "resource-group" {
  name     = "durable-sample"
  location = "japaneast"
}

resource "azurerm_storage_account" "storage-account" {
  name                     = "durablesample"
  resource_group_name      = azurerm_resource_group.resource-group.name
  location                 = azurerm_resource_group.resource-group.location
  account_tier             = "standard"
  account_replication_type = "LRS"
}
