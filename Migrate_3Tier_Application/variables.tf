variable "vm_count" {
  description = "Number of VMs to create"
  default     = 3
}

variable "vm_size" {
  description = "The size of the virtual machine"
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  default     = "adminRaghav"
}

variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
}

variable "vm_names" {
  description = "List of VM names"
  type        = list(string)
  default     = ["vmFrontend", "vmApp", "vmDb"]
}
