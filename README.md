# Terraform AzureRm Resource Group

![Format and validate terraform workflow](https://github.com/PureGymGroup/terraform-azurerm-resource-group/actions/workflows/validate.yml/badge.svg)

This Terraform module creates or discovers an Azure Resource Group. The consumer must define a predicate to indicate whether they expect the resource group to already exist.

## Usage

Reference the module using the github URL and revision tag

```terraform
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
```

The `create_resource_group` parameter indicates whether the module should create the resource group. If `false`, it will use a data source to discover it.

A typical example might be checking the environment. For example:

```
create_resource_group = !contains(["staging", "production"], var.environment)
```

## Contributing

Fork and raise a PR to contribute to this project.

On merging, a version tag will automtically be created for consumers to reference. By default, this will be a `minor` version bump. To override this, one of your commit messages must contain `#major`, `#minor`, `#patch`, or `#none`.
