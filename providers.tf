terraform{
    required_version = ">= 0.13.0"
    required_providers{
        yandex = {
            source = "yandex-cloud/yandex"
        }
        openstack = {
            source  = "terraform-provider-openstack/openstack"
            version = "1.51.1"
        }
    }
}

provider "yandex" {
  zone = "ru-central1-a"
}

provider "openstack"{
    auth_url    = var.openstack_auth_url
    user_name   = var.openstack_username
    password    = var.openstack_password
    domain_name = var.openstack_domain_name
}

resource "openstack_compute_instance_v2" "khrustalyov_infra_terraform_ansible" {
  name        = var.instance_name
  image_name  = var.image
  flavor_name = var.flavor
  key_pair    = var.key_name

  block_device {
    source_type           = "image"
    destination_type      = "volume"
    //uuid                  = "253a6ce9-fd9d-4a14-bbac-097a6eb8fb10"
    volume_size           = 20
    boot_index            = 0
    delete_on_termination = true
  }

  network {
    name = var.network_name
  }

  security_groups = [var.security_group]
}