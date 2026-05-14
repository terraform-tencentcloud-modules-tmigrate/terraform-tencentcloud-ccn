locals {
  ccn_route_table_id = var.create ? concat(tencentcloud_ccn_route_table.ccn_rtb.*.id, [""])[0] : ""
}
resource "tencentcloud_ccn_route_table" "ccn_rtb" {
  count = var.create ? 1 : 0
  ccn_id      = var.ccn_id
  // TODO: naming convention
  name        = var.name
  description = var.description
}


resource "tencentcloud_ccn_route_table_associate_instance_config" "instances" {
  count = length(var.associate_instances) > 0 ? 1 : 0
  ccn_id         = var.ccn_id
  route_table_id = local.ccn_route_table_id
  dynamic "instances" {
    for_each = var.associate_instances
    content {
      instance_id   = instances.value.instance_id
      instance_type = try(instances.value.instance_type, "VPC")  # "VPC"
    }
  }
}


resource "tencentcloud_ccn_route_table_input_policies" "input_policies" {
  depends_on = [tencentcloud_ccn_route_table_associate_instance_config.instances]
  count = length(var.input_policies) > 0 ? 1 : 0
  ccn_id         = var.ccn_id
  route_table_id = local.ccn_route_table_id
  dynamic "policies" {
    for_each = var.input_policies
    content {
      action      = policies.value.action # "accept"
      description = try(policies.value.description, "desc") # "desc."
      dynamic "route_conditions" {
        for_each = policies.value.route_conditions
        content {
          name          = route_conditions.value.name # "instance-region"
          values        = route_conditions.value.values # [var.region]
          match_pattern = route_conditions.value.match_pattern # 1
        }
      }
    }
  }
}


resource "tencentcloud_ccn_route_table_broadcast_policies" "broadcast_policies" {
  depends_on = [tencentcloud_ccn_route_table_associate_instance_config.instances]
  count = length(var.broadcast_policies) > 0 ? 1 : 0
  ccn_id         = var.ccn_id
  route_table_id = local.ccn_route_table_id
  dynamic "policies" {
    for_each = var.broadcast_policies
    content {
      action      = policies.value.action # "accept"
      description = policies.value.description # "desc."
      dynamic "route_conditions" {
        for_each = policies.value.route_conditions
        content {
          name          = route_conditions.value.name # "instance-region"
          values        = route_conditions.value.values # ["ap-guangzhou"]
          match_pattern = try(route_conditions.value.match_pattern, 1) # 1
        }
      }

      dynamic "broadcast_conditions" {
        for_each = policies.value.broadcast_conditions
        content {
          name          = broadcast_conditions.value.name # "instance-region"
          values        = broadcast_conditions.value.values # ["ap-shanghai"]
          match_pattern = try(broadcast_conditions.match_pattern, 1)
        }
      }
    }
  }
}