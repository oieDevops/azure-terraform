variable "region" {
  default = "East US"
  type = string
}

variable "vnet_cidr" {
  type = list(string)
  default = ["10.0.0.0/16"]
}

variable "name" {
  type = string
  default = "oie"
}

variable "env" {
  type = string
  default = "dev"
}

variable "public_subnet" {
  type = list(string)
  default = ["10.0.0.0/18", "10.0.64.0/18"]
}

variable "app_subnet" {
  type = list(string)
  default = ["10.0.128.0/19","10.0.160.0/19"]
}

variable "db_subnet" {
  type = list(string)
  default = ["10.0.224.0/19", "10.0.192.0/19"]
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

# variable "" {
#   type = string
#   default = ""
# }

# variable "" {
#   type = string
#   default = ""
# }
