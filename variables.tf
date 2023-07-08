variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name (prefix for all resource names"
  defaults  = "hetzner"
}

variable "datacenter" {
  description = "Hetzner datacenter where resources resides, hel1-dc2 (Helsinki 1 DC 2) or fsn1-dc14 (Falkenstein 1 DC14)"
  default     = "fsn1-dc14"
}

variable "image" {
  description = "Node boot image"
  default     = "debian-12"
}

variable "server_type" {
    description = "Server type (e.g cax11)"
    default = "cax11"
}

variable "ssh_keys" {
  type        = list
  description = "List of public ssh_key ids"
}

