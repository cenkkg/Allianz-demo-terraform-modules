output "resource_group_name" {
  value = azurerm_resource_group.allianz-demo-aks-rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.allianz-demo-aks-rg.location
}

output "acr_name" {
  value = azurerm_container_registry.allianz-demo-acr.name
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.allianz-demo-aks.name
}

output "aks_ra_principal_id" {
  value = azurerm_role_assignment.allianz-demo-aks-ra.principal_id
}

output "aks_nodepool_names" {
  value = var.additional_nodepool_names
}