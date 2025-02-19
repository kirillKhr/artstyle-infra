terraform{
    required_version = ">= 0.13.0"
    required_providers{
        openstack = {
            source  = "terraform-provider-openstack/openstack"
            version = "1.51.1"
        }
    }
}

provider "openstack" {
    auth_url    = var.openstack_auth_url
    user_name   = var.openstack_username
    password    = var.openstack_password
    domain_name = var.openstack_domain_name
}