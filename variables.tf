variable "hcloud_token" {
  description = "Hetzner cloud auth token"
  type = string
}

variable "cluster_name" {
  description = "Cluster name (prefix for all resource names)"
  default     = "tycho"
}

variable "datacenter" {
  description = "Hetzner datacenter where resources resides, hel1-dc2 (Helsinki 1 DC 2) or fsn1-dc14 (Falkenstein 1 DC14)"
  default     = "fsn1-dc14"
}

variable "image" {
  description = "Node boot image"
  default     = "debian-12"
}

variable "master_type" {
  description = "Master node type (size)"
  default     = "cax11"
}

variable "ssh_keys" {
  description = "ssh keys"
  default = [
        "dougie"
        ]
}

variable "k3s_channel" {
  default = "stable"
}

variable "node_groups" {
  description = "Map of worker node groups, key is server_type, value is count of nodes in group"
  type        = map(string)
  default = {
    "cax11" = 2
  }
}
