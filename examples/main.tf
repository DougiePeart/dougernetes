variable "hcloud_token" {
  type = string
}

provider "hcloud" {
  token = var.hcloud_token
}

module "cluster" {
  source       = "cicdteam/k3s/hcloud"
  version      = "0.1.2"
  hcloud_token = var.hcloud_token
  ssh_keys     = [hcloud_ssh_key.default.id]

  master_type = "cax11"

  node_groups = {
    "cax11" = 2
  }
}

output "master_ipv4" {
  depends_on  = [module.cluster]
  description = "Public IP Address of the master node"
  value       = module.cluster.master_ipv4
}

output "nodes_ipv4" {
  depends_on  = [module.cluster]
  description = "Public IP Address of the worker nodes"
  value       = module.cluster.nodes_ipv4
}
