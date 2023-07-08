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

locals {
  user_data_script = <<-SCRIPT
    #!/bin/bash
    curl -sfL https://get.k3s.io | sh -
  SCRIPT
}

resource "hcloud_server" "tycho-01" {
  name        = "tycho-01"
  datacenter  = "fsn1-dc14"
  image       = "debian-12"
  server_type = "cax11"
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  ssh_keys = [
    "dougie"
  ]  
  user_data = base64encode(local.user_data_script)
}
