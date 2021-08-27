terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../../"

  name     = "testrg"
  location = "North Europe"
  tags = {
    "environment" = "test"
  }

  create_resource_group = true
}

output "resource_group_details" {
  value = {
    id       = module.resource_group.id
    name     = module.resource_group.name
    location = module.resource_group.location
    tags     = module.resource_group.tags
  }
}