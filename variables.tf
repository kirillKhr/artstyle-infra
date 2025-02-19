variable "openstack_auth_url" {
  description = "Openstack auth URL"
}

variable "openstack_username" {
  description = "Openstack username"
}

variable "openstack_password" {
  description = "Openstack password"
}

variable "openstack_domain_name" {
  description = "Openstack domain name"
  default     = "Default"
}

variable "instance_name" {
  description = "Name of the instance"
  default     = "khrustalyov_infra_terra_ansible"
}

variable "key_name" {
  description = "Name of the ssh key"
}

variable "image_name" {
  description = "Image to use"
  default     = "ubuntu-20.04"
}

variable "flavor_name" {
  description = "Flavor of the instance"
  default     = "m1.small"
}

variable "network_name" {
  description = "Network to attach"
}

variable "security_groups" {
  description = "Security groups to use"
  type        = list(string)
  default     = ["default"]
}