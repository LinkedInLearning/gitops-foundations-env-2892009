resource "random_pet" "prefix" {}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.42.0"
    }
  }

  required_version = "~> 0.14"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "k8s" {
  name     = "${random_pet.prefix.id}-rg"
  location = "West US 2"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  dns_prefix          = "${random_pet.prefix.id}-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.id
    client_secret = var.password
  }

  role_based_access_control {
    enabled = true
  }
 
}
