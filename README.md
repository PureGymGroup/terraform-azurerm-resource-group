# Terraform AzureRm Resource Group

![Format and validate terraform workflow](https://github.com/PureGymGroup/terraform-azurerm-resource-group/actions/workflows/validate.yml/badge.svg)

This Terraform module creates or discovers an Azure Resource Group. The consumer must define a predicate to indicate whether they expect the resource group to already exist.

## Usage
```
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
  source = "github.com/PureGymGroup/terraform-azurerm-resource-group"

  name     = "testrg"
  location = "North Europe"
  tags = {
    "environment" = "test"
  }

  create_resource_group = false
}
```

The `create_resource_group` parameter indicates whether the module should create the resource group. If `false`, it will use a data source to discover it.

A typical example might be checking the environment. For example:

```
create_resource_group = !contains(["staging", "production"], var.environment)
```
