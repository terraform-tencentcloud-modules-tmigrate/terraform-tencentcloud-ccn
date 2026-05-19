data "tencentcloud_user_info" "this" {}


resource "tencentcloud_ccn" "main" {
  count = var.create ? 1 : 0
  name                 = var.name
  description          = var.description
  qos                  = var.qos
  charge_type          = var.charge_type
  bandwidth_limit_type = var.bandwidth_limit_type
  route_ecmp_flag = var.route_ecmp_flag
  route_overlap_flag = var.route_overlap_flag
  tags = var.tags
}

locals {
  ccn_id = var.create ? join("", tencentcloud_ccn.main.*.id) : var.ccn_id
  bandwidth_limit_region_map = { for region in var.bandwidth_limit_regions: region => region}
}

resource "tencentcloud_ccn_bandwidth_limit" "ccn_limit" {
  for_each = local.bandwidth_limit_region_map
  ccn_id          = local.ccn_id
  region          = each.key
  bandwidth_limit = var.bandwidth_limit
}