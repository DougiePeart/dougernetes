provider "hcloud" {
    token = var.hcloud_token 
}

data "template_file" "server_init" {
  template = file("${path.module}/templates/init.sh")
  vars = {
  }
}


resource "hcloud_network" "private" {
    name = var.cluster_name
    ip_range = "10.0.0.0/8"
}

resource "hcloud_network_subnet" "subnet" {
    network_id = hcloud_network.private.id
    type = "cloud"
    network_zone = "eu-central"
    ip_range = "10.0.0.0/24"
}

resource "hcloud_server" "tycho-01" {
    count = var.server_count
    name = "tycho-${count.index}"
    server_type = var.server_type
    datacenter = var.datacenter
    image = var.image
    ssh_keys = var.ssh_keys
    user_data = data.template_file.server_init.rendered
}
