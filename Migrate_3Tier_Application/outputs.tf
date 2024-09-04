output "ssh_private_key" {
  description = "The private SSH key to connect to the VMs"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}

output "vm_public_ip_addresses" {
  value = azurerm_public_ip.pip[*].ip_address
}

output "vm_private_ip_addresses" {
  value = azurerm_linux_virtual_machine.vm[*].private_ip_address
}
