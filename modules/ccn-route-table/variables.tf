variable "create" {
  type = bool
  default = true
  description = "create or not"
}

variable "ccn_id" {
  type = string
  description = "ccn id"
}
variable "name" {
  type = string
  default = "ccn-rtb"
  description = "name of route table"
}
variable "description" {
  type = string
  default = ""
}

variable "associate_instances" {
  type = any
  default = {}
  description = "see `tencentcloud_ccn_route_table_associate_instance_config`"
}

variable "input_policies" {
  type = any
  default = []
  description = "see `tencentcloud_ccn_route_table_input_policies`"
}
variable "broadcast_policies" {
  type = any
  default = []
  description = "see `tencentcloud_ccn_route_table_broadcast_policies`"
}