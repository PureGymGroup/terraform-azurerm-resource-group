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

module "test" {
  source = "../../"

  name     = "testrg"
  location = "North Europe"
  tags = {
    "environment" = "test"
  }

  create_resource_group = false
}