# tencentcloud_ccn_route_table

Route table of CCN in TencentCloud.

CCN route table:

Reference: https://www.tencentcloud.com/document/product/1003/34259

## usage

```terraform
terraform {
  source = "../.."
}
inputs =  {

  ccn_id = "ccn-g40gu753"
  name = "test-rtb"
  description = "test"

  # these vpcs must be attached to the CCN
  associate_instances = {
    vpc1 = {
      instance_id = "vpc-h788plj3"
    }
    vpc2 = {
      instance_id = "vpc-m121o0fv"
    }
  }
  
  input_policies = [
    {
      action = "accept"
      description = "vpc"
      route_conditions = [
        {
          # This vpc instance must attached to the CCN
          name = "instance-id"
          values = ["vpc-m121o0fv"]
          match_pattern = 1 # 1 precise matching, 0 fuzzy matching.
        }
      ]

    },
    {
      action = "accept"
      description = "cidr"
      route_conditions = [
        {
          name = "cidr-block"
          values = ["10.0.0.0/16"]
          match_pattern = 0 # 1 precise matching, 0 fuzzy matching.
        }
      ]

    }
  ]
  broadcast_policies = [
    {
      action      = "accept" # "accept" Routing behavior, accept allows, drop rejects.
      description = "vpc1" # "desc."
      route_conditions = [
        {
          name          = "cidr-block"
          values        = ["10.0.0.0/16"]
          match_pattern = 1

        }
      ]
      broadcast_conditions = [
        {
          name          = "instance-id"
          # This vpc instance must associated to this route table
          values        = ["vpc-m121o0fv"]
          match_pattern = 1
        }
      ]

    }]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | >= 1.81.106 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | >= 1.81.106 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tencentcloud_ccn_route_table.ccn_rtb](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/ccn_route_table) | resource |
| [tencentcloud_ccn_route_table_associate_instance_config.instances](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/ccn_route_table_associate_instance_config) | resource |
| [tencentcloud_ccn_route_table_broadcast_policies.broadcast_policies](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/ccn_route_table_broadcast_policies) | resource |
| [tencentcloud_ccn_route_table_input_policies.input_policies](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/ccn_route_table_input_policies) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_instances"></a> [associate\_instances](#input\_associate\_instances) | see `tencentcloud_ccn_route_table_associate_instance_config` | `any` | `{}` | no |
| <a name="input_broadcast_policies"></a> [broadcast\_policies](#input\_broadcast\_policies) | see `tencentcloud_ccn_route_table_broadcast_policies` | `any` | `[]` | no |
| <a name="input_ccn_id"></a> [ccn\_id](#input\_ccn\_id) | ccn id | `string` | n/a | yes |
| <a name="input_create"></a> [create](#input\_create) | create or not | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `""` | no |
| <a name="input_input_policies"></a> [input\_policies](#input\_input\_policies) | see `tencentcloud_ccn_route_table_input_policies` | `any` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | name of route table | `string` | `"ccn-rtb"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ccn_route_table_id"></a> [ccn\_route\_table\_id](#output\_ccn\_route\_table\_id) | n/a |
