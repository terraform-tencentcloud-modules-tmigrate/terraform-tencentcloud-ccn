# tencentcloud_ccn_routes

Enable or Disable a ccn route of CCN in TencentCloud.

CCN route :

Reference: 

https://www.tencentcloud.com/document/product/1003/30069?lang=en&pg=

https://www.tencentcloud.com/document/product/1003/30068

## usage

```terraform
terraform {
  source = "../.."
}
inputs =  {
  ccn_id = "ccn-xxxx"
  routes = {
    route1 = {
      filters = {
        f1 = {
          name = "cidr-block"
          values = ["172.28.0.0/24"]
        }
      }
      switch = "off"
    }
  }
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
| [tencentcloud_ccn_routes.example](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/ccn_routes) | resource |
| [tencentcloud_ccn_routes.routes](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/data-sources/ccn_routes) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ccn_id"></a> [ccn\_id](#input\_ccn\_id) | ccn id for the routes | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"ap-jakarta"` | no |
| <a name="input_routes"></a> [routes](#input\_routes) | n/a | `any` | `{}` | no |

## Outputs

No outputs.
