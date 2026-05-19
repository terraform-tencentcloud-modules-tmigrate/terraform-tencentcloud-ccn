data "tencentcloud_user_info" "this" {}

resource "tencentcloud_ccn_attachment" "vpc_attachment" {
  for_each = var.vpc_attachments
  ccn_id          = var.ccn_id
  instance_type   = "VPC"
  instance_id     = each.value.vpc_id
  instance_region = coalesce(each.value.region, var.region)
  ccn_uin         = data.tencentcloud_user_info.this.owner_uin
  lifecycle {
    ignore_changes = [
      route_ids
    ]
  }
}

resource "tencentcloud_ccn_attachment" "vpn_gateway_attachments" {
  for_each = var.vpn_gateway_attachments
  ccn_id          = var.ccn_id
  instance_type   = "VPNGW"
  instance_id     = each.value.vpn_id
  instance_region = coalesce(each.value.region, var.region)
}

resource "tencentcloud_ccn_attachment" "direct_connect_attachments" {
  for_each = var.direct_connect_attachments
  ccn_id          = var.ccn_id
  instance_type   = "DIRECTCONNECT"
  instance_id     = each.value.dc_id
  instance_region = coalesce(each.value.region, var.region)
}
