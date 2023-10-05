variable "rg_name" {
  description = "Name of Resource Group"
  type        = string
}

variable "rg_location" {
  description = "Location of Resource Group"
  type        = string
}

variable "acr_name" {
  description = "Name of ACR"
  type        = string
}

variable "aks_name" {
  description = "Name of AKS"
  type        = string
}

variable "additional_nodepools" {
  description = "Name of Additional Node Pools"
  type        = map(object({
                    name = string
                    purpose = string
                    min_count = number
                    max_count = number
                }))
}