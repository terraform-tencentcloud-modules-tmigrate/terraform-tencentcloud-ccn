locals {
  route_ids = {
    for k, route in data.tencentcloud_ccn_routes.routes: k => route.route_list[0].route_id
  }
}


data "tencentcloud_ccn_routes" "routes" {
  for_each = var.routes
  ccn_id = var.ccn_id
  dynamic "filters" {
    for_each = each.value.filters
    content {
      name = filters.value.name // Field to be filtered. Support route-id, cidr-block, instance-type, instance-region, instance-id, route-table-id
      values = filters.value.values
    }
  }
}

resource "tencentcloud_ccn_routes" "example" {
  for_each = var.routes
  ccn_id   = var.ccn_id
  route_id = local.route_ids[each.key]
  switch   = try(each.value.switch, "on")
}