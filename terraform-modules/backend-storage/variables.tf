variable "resource_group_name" {
  type    = string
  default = "sandeep-rg-tfstate-dev-test"
}

variable "storage_account_name" {
  type    = string
  default = "mytesttfstatestorage"
}

variable "container_name" {
  type    = string
  default = "tfstate"
}

variable "location" {
  type    = string
  default = "Central India"
}
