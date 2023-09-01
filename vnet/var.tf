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

variable "public1" {
  type = list(string)
  default = ["10.0.0.0/18"]
}

variable "public2" {
  type = list(string)
  default = ["10.0.64.0/18"]
}

variable "app1" {
  type = list(string)
  default = ["10.0.128.0/19"]
}

variable "app2" {
  type = list(string)
  default = ["10.0.160.0/19"]
}

variable "db1" {
  type = list(string)
  default = ["10.0.224.0/19"]
}

variable "db2" {
  type = list(string)
  default = ["10.0.192.0/19"]
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
