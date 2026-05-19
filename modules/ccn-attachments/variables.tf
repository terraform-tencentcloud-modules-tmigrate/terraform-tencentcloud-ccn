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
  type        = any
  default     = {}
  description = "VPC instances to attach to CCN. Map key is attachment name, value has vpc_id and optional region."
}

variable "vpn_gateway_attachments" {
  type        = any
  default     = {}
  description = "VPN gateway instances to attach to CCN. Map key is attachment name, value has vpn_id and optional region."
}

variable "direct_connect_attachments" {
  type        = any
  default     = {}
  description = "Direct connect instances to attach to CCN. Map key is attachment name, value has dc_id and optional region."
}
