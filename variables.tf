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

variable "nodepool_name" {
  description = "Name of Node Pool"
  type        = string
}