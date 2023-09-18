variable "client_id" {
  type = string
  description = "used to authenticate to Azure"
}

variable "client_secret" {
  type = string
  description = "used to authenticate to Azure"
}

variable "subscription_id" {
  type = string
  description = "used to authenticate to Azure"
}

variable "tenant_id" {
  type = string
  description = "used to authenticate to Azure"
}

variable "location" {
  type    = string
  description = "azure resources location"
  default = "eastus"
}

variable "hub_net_name" {
  type = string
  description = "workload/application name. e.g hub/sharedServices, spoke/application"
  default = "hub"
}

variable "spoke_net_name" {
  type = string
  description = "network name. E.g hub/sharedServices, spoke/application"
  default = "spoke"
}

variable "env" {
  type = string
  description = "environment for all the resources in this setup. e.g dev/prod/qa"
  default = "sandbox"
}

variable "hub_snet_gw" {
  type = string
  description = "type of resouces hosted within subnet"
  default = "gateway"
}

variable "spoke_snet_workload" {
  type = string
  description = "type of resouces hosted within subnet"
  default = "app"
}

variable "hub_cidr" {
  type = list(string) 
  description = "address space for hub vnet"
  default = ["10.0.0.0/16"]
}

variable "gw_snet_cidr" {
  type = list(string) 
  description = "address space for gw subnet in hub vnet"
  default = ["10.0.0.0/27"]
}

variable "spoke1_cidr" {
  type = list(string) 
  description = "address space for spoke 1 vnet"
  default = ["11.0.0.0/16"]
}

variable "spoke1_snet_cidr" {
  type = list(string) 
  description = "address space for subnet in spoke vnet"
  default = ["11.0.0.0/24"]
}

variable "spoke2_cidr" {
  type = list(string) 
  description = "address space for spoke 2 vnet"
  default = ["12.0.0.0/16"]
}

variable "spoke2_snet_cidr" {
  type = list(string) 
  description = "address space for subnet in spoke vnet"
  default = ["12.0.0.0/24"]
}

variable "default_tags" {
  type        = map(string)
  description = "Default Tags"
  default = {
    Owner = "pVerify"
    Environment = "sandbox"
    Workload = "infra-networking"
    CostAndUsage = "finOps"
    ManagedByTerraform = "True"
    }
}
