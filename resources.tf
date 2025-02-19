resource "openstack_compute_instance_v2" "node" {
    name        = var.instance_name
    image_name  = var.image_name
    flavor_name = var.flavor_name
    key_pair    = var.key_name

    block_device {
        uuid                  = "0ef1546a-5df2-4581-8075-061bbbbe6a52"
        source_type           = "image"
        destination_type      = "volume"
        volume_size           = 20
        delete_on_termination = true
    }

    network {
        name = var.network_name
    }

    security_groups = var.security_groups
}