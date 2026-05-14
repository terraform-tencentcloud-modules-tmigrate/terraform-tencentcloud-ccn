variable "ccn_id" {
  type        = string
  description = "ID of the CCN to attach instances to."
}

variable "ccn_owner_uin" {
  type        = string
  description = "Owner Uin of the CCN (the account that created the CCN)."
}

variable "region" {
  type        = string
  description = "Default region for attached instances."
}

variable "vpc_attachments" {
  type = map(object({
    vpc_id = string
    region = optional(string, null)
  }))
  default     = {}
  description = "VPC instances to attach to CCN from this account. Map key is attachment name."
}
