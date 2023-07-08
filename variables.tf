variable "hcloud_token" {
    description = "Hetzner cloud auth token"
    type = string
}

variable "datacenter" {
  description = "Hetzner datacenter"
  default     = "fsn1-dc14"
}

variable "image" {
  description = "server boot image"
  default     = "debian-12"
}

variable "ssh_keys" {
    description = "ssh keys to install"
    default = [
    "dougie"
    ]
}

variable "server_type" {
  description = "Server type (size)"
  default     = "cax11"
  validation {
    condition     = can(regex("^cax11$|^cax21$|cax31$", var.server_type))
    error_message = "Only smaller ARM nodes allowed! I'm not made of money."
  }
}

variable "server_count" {
    description = "Number of servers"
    default = 2
}

variable "cluster_name" {
    description = "Name of the cluster"
    default = "tycho"
}
