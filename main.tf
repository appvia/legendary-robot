terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tjs-testing"
    storage_account_name = "legendaryrobot"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "legendary-robot"
  location = "eastus"

  tags = {
    Environment = "Tim Stahl - Testing GitHub Actions w/ TF v3"
    Team        = "Sales"
  }
}
