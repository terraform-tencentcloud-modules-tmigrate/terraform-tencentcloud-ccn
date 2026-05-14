variable "ccn_id" {
  type        = string
  description = "ID of the CCN to accept attachments on."
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
  description = "Foreign VPC attachments to accept. Map key is an arbitrary unique name."
}
