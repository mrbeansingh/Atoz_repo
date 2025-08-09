terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.39.0"
    }
  }
   backend "azurerm" {
    resource_group_name   = ""        
    storage_account_name  = "rajstorage"     
    container_name        = "tfstate"             
    key                   = "terraform.tfstate"    
  }

  }


provider "azurerm" {
  features {}
  subscription_id = "febef730-8d0e-4e87-b84a-70939f0ce0e0"
}