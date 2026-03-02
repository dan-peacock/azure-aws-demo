variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "UK South"
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
  default     = "tf-demo-vms"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_ssh_public_key" {
  description = "SSH public key string (ssh-rsa ...). Prefer setting via environment variable TF_VAR_admin_ssh_public_key or terraform.tfvars (do not commit)."
  type        = string
  sensitive   = true
}

variable "vnet_address_space" {
  description = "Virtual network CIDR"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefix" {
  description = "Subnet CIDR"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}