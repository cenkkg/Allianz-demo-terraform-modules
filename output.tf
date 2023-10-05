output "resource_group_name" {
  value = azure_aks.allianz-demo-aks-rg.name
}

output "acr_name" {
  value = azure_aks.allianz-demo-acr.name
}

output "aks_name" {
  value = azure_aks.allianz-demo-aks.name
}

output "aks_ra_principal_id" {
  value = azure_aks.allianz-demo-aks-ra.principal_id
}

output "aks_nodepool_name" {
  value = azure_aks.allianz-demo-nodepool.name
}