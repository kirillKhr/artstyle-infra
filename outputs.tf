output "node_ip" { 
    value = openstack_compute_instance_v2.node.access_ip_v4
}