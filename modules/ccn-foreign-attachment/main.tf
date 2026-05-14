resource "tencentcloud_ccn_attachment" "vpc" {
  for_each = var.vpc_attachments

  ccn_id          = var.ccn_id
  instance_type   = "VPC"
  instance_id     = each.value.vpc_id
  instance_region = try(each.value.region, var.region)
  ccn_uin         = var.ccn_owner_uin

  lifecycle {
    ignore_changes = [route_ids]
  }
}
