variable "ccn_id" {
  type        = string
  description = "ID of the CCN instance to attach resources to."
}

variable "region" {
  type        = string
  default     = ""
  description = "Region where attached instances are located. Used as default region for VPC attachments and required for VPN/DC attachments."
}

variable "vpc_attachments" {
  type = map(object({
    vpc_id = string
    region = optional(string, null)
  }))
  default     = {}
  description = "VPC instances to attach to CCN. Map key is attachment name, value has vpc_id and optional region."
}

variable "vpn_gateway_attachments" {
  type = map(object({
    vpn_id = string
    region = optional(string, null)
  }))
  default     = {}
  description = "VPN gateway instances to attach to CCN. Map key is attachment name, value has vpn_id and optional region."
}

variable "direct_connect_attachments" {
  type = map(object({
    dc_id   = string
    region  = optional(string, null)
  }))
  default     = {}
  description = "Direct connect instances to attach to CCN. Map key is attachment name, value has dc_id and optional region."
}
