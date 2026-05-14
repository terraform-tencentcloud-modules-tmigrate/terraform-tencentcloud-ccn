resource "tencentcloud_ccn_instances_accept_attach" "this" {
  for_each = var.vpc_attachments

  ccn_id = var.ccn_id
  instances {
    instance_id     = each.value.vpc_id
    instance_region = try(each.value.region, var.region)
    instance_type   = "VPC"
  }
}
