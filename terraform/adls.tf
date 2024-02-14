resource "azurerm_storage_account" "terra-demo" {
  name                     = "terrademostorageacc"
  resource_group_name      = azurerm_resource_group.terra-demo.name
  location                 = azurerm_resource_group.terra-demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true
}

resource "azurerm_storage_data_lake_gen2_filesystem" "terra-demo" {
  name               = "terra-ad"
  storage_account_id = azurerm_storage_account.terra-demo.id
  properties = {
    hello = "aGVsbG8="
  }
}
