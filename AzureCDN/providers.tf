# ------------------------------------- Azure -------------------------------------#


# terraform {
#   # backend "azurerm" {
#   #   resource_group_name  = "tutorial_RG"
#   #   storage_account_name  = "mf37"
#   #   container_name        = "<your-container-name>"
#   #   key                   = "data.tfstate"
#   # }
#   required_providers {
    
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "4.2.0"
#     }
#   }
# }

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "064b2bea-3fc1-4bf7-b067-3d942c23e4dd"    // find this in the subscription overview
  tenant_id = "16983dae-9f48-4a35-b9f5-0519bf3cdf09"          // find this in the entra overview
  client_id = "3728e04a-d9d3-4d3c-b503-b287b1aaa666"          // find in entra -> manage -> app registrations -> all applications -> use terraform client ID
  client_secret = "KSB8Q~VJGcVoz-k8nATIMhZJuBxXRU2s-xfFTc5P"      // find in entra -> manage -> app registrations -> all applications -> terraform -> manage -> certificates & secrets -> client secrets
}




# ------------------------------------- AWS -------------------------------------#

provider "aws" {

}