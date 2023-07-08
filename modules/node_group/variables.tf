variable "cluster_name" {
  description = "Cluster name (prefix for all resource names)"
  default     = "hetzner"
}

variable "datacenter" {
  description = "Hetzner datacenter where resources resides, hel1-dc2 (Helsinki 1 DC 2) or fsn1-dc14 (Falkenstein 1 DC14)"
  default     = "fsn1-dc14"
}

variable "node_count" {
  description = "Count on nodes in group"
  default     = 2
}

variable "node_type" {
  description = "Node type (size)"
  default     = "cax11"
  validation {
    condition     = can(regex("^cax11$|^cax21$|cax31$", var.node_type))
    error_message = "Only smaller ARM nodes allowed! I'm not made of money."
  }
}

variable "image" {
  description = "Node boot image"
  default     = "debian-12"
}

variable "k3s_token" {
  description = "k3s initialization token"
}

variable "k3s_channel" {
  description = "k3s channel (stable, latest, v1.19 and so on)"
  default     = "stable"
}

variable "master_ipv4" {
  description = "IP address (v4) of master node"
}

variable "hcloud_subnet_id" {
  description = "IP Subnet id used to assign internal IP addresses to nodes"
}

variable "ssh_keys" {
    description = "ssh keys"
    default = [
        "dougie"
        ]
}
