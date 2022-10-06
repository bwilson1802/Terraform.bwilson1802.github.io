###################################
# Dev Test script,                #
# Passwords hardcoded             #
#                                 #
###################################

################
#  Base Setup  #
################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

##########################
# East V-Net            #
##########################

resource "azurerm_resource_group" "East_US_RG" {
  name     = "East_US_RG"
  location = "East US"
}

resource "azurerm_virtual_network" "VNET" {
for_each = var.virtual_network 
  
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space
}


