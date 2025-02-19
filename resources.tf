data "openstack_images_image_v2" "image"{
    name        = var.image_name
    most_recent = true
}

resource "openstack_blockstorage_volume_v3" "volume" {
  name      = var.node_volume_name
  image_id  = data.openstack_images_image_v2.image.id
  size      = 20
}

resource "openstack_compute_instance_v2" "node" {
    name        = var.node_name
    flavor_name = var.flavor_name
    key_pair    = var.key_name

    block_device {
        uuid                  = openstack_blockstorage_volume_v3.volume.id
        source_type           = "volume"
        destination_type      = "volume"
        volume_size           = 20
        delete_on_termination = true
    }

    network {
        name = var.network_name
    }

    security_groups = var.security_groups
}