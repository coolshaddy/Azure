variable "resource_group_name" {
  type        = string
  description = "Name of the resource group for backend storage."
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account."
}

variable "container_name" {
  type        = string
  description = "Name of the blob container."
}

variable "location" {
  type        = string
  description = "Azure region."
}
