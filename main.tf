terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.41.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_network" "private" {
    name = var.cluster_name
    ip_range = "10.0.0.0/8"
}

locals {
  user_data_script = <<-SCRIPT
    #!/bin/bash
    curl -sfL https://get.k3s.io | sh -
  SCRIPT
}

resource "hcloud_server" "tycho-01" {
  name        = "tycho-01"
  datacenter  = var.datacenter
  image       = var.image
  server_type = var.server_type
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  ssh_keys = [
    "dougie"
  ]  
  user_data = base64encode(local.user_data_script)
}
