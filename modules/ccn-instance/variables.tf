variable "create" {
  type        = bool
  default     = true
  description = "Whether to create CCN resource"
}

variable "name" {
  type        = string
  default     = ""
  description = "Name of the CCN, maximum length does not exceed 60 bytes."
}

variable "description" {
  type        = string
  default     = ""
  description = "Description of CCN, maximum length does not exceed 100 bytes."
}

variable "qos" {
  type        = string
  default     = "AU"
  description = "Service quality of CCN. Valid values: PT, AU, AG. Default is AU."
}

variable "charge_type" {
  type        = string
  default     = "POSTPAID"
  description = "Billing mode. Valid values: PREPAID, POSTPAID. Default is POSTPAID."
}

variable "bandwidth_limit_type" {
  type        = string
  default     = "OUTER_REGION_LIMIT"
  description = "Speed limit type. Valid values: INTER_REGION_LIMIT, OUTER_REGION_LIMIT. Default is OUTER_REGION_LIMIT."
}

variable "instance_metering_type" {
  type        = string
  default     = "BANDWIDTH"
  description = "Instance metering type. Valid values: BANDWIDTH, TRAFFIC. Default is BANDWIDTH."
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "bandwidth_limit_regions" {
  type        = list(string)
  default     = []
  description = "Bandwidth limit region list. Not needed if all resources are in the same region."
}

variable "bandwidth_limit" {
  type        = number
  default     = 100
  description = "Bandwidth limitation in Mbps."
}

variable "route_ecmp_flag" {
  type        = bool
  default     = false
  description = "Whether to enable ECMP routing. true: enabled, false: disabled."
}

variable "route_overlap_flag" {
  type        = bool
  default     = false
  description = "Whether to enable routing overlap. true: enabled, false: disabled."
}

variable "region" {
  type        = string
  description = "Region where attached instances are located. Used as default region for attachments."
  default = ""
}

variable "vpc_attachments" {
  type        = any
  default     = {}
  description = "VPC instances to attach to CCN. Map key is attachment name, value has vpc_id and optional region."
}

variable "vpn_gateway_attachments" {
  type = map(object({
    vpn_id = string
  }))
  default     = {}
  description = "VPN gateway instances to attach to CCN."
}

variable "direct_connect_attachments" {
  type = map(object({
    dc_id = string
  }))
  default     = {}
  description = "Direct connect instances to attach to CCN."
}
