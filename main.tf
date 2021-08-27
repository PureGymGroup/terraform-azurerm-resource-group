resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
  tags     = var.tags

  count = var.create_resource_group ? 1 : 0
}

data "azurerm_resource_group" "this" {
  name = var.name

  count = var.create_resource_group ? 0 : 1
}

locals {
  resource_group = var.create_resource_group ? azurerm_resource_group.this[0] : data.azurerm_resource_group.this[0]
}

output "id" {
  value = local.resource_group.id
}

output "name" {
  value = local.resource_group.name
}

output "location" {
  value = local.resource_group.location
}

output "tags" {
  value = local.resource_group.tags
}
