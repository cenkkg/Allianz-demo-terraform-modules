resource "azurerm_resource_group" "allianz-demo-aks-rg" {
  name     = "allianz-demo-aks-rg"
  location = "westeurope"
}

resource "azurerm_container_registry" "allianz-demo-acr" {
  name                = "allianzdemoacr"
  resource_group_name = azurerm_resource_group.allianz-demo-aks-rg.name
  location            = azurerm_resource_group.allianz-demo-aks-rg.location
  sku                 = "Standard"
}

resource "azurerm_kubernetes_cluster" "allianz-demo-aks" {
  location            = azurerm_resource_group.allianz-demo-aks-rg.location
  name                = "allianz-demo-aks"
  resource_group_name = azurerm_resource_group.allianz-demo-aks-rg.name
  dns_prefix          = "allianz-demo-aks"
  identity {
    type = "SystemAssigned"
  }
  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_D2_v2"
  }
}

resource "azurerm_role_assignment" "allianz-demo-aks-ra" {
  principal_id                     = azurerm_kubernetes_cluster.allianz-demo-aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.allianz-demo-acr.id
  skip_service_principal_aad_check = true
}

resource "azurerm_kubernetes_cluster_node_pool" "allianz-demo-nodepool" {
  name                = "tesknodepool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.allianz-demo-aks.id
  vm_size             = "Standard_DS2_v2"
  node_count          = 1
  enable_auto_scaling   = true
  max_count             = 3
  min_count             = 0
  node_labels = {
    "purpose" = "jenkins-agents"
  }
}