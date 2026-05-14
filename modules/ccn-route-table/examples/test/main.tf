module "ccn_rtb" {
  source = "../.."
  ccn_id = "ccn-g40gu753"
  name = "test-rtb"
  description = "test"

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
      action      = "accept" # "accept"
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
          values        = ["vpc-m121o0fv"]
          match_pattern = 1
        }
      ]

    }]
}

output "id" {
  value = module.ccn_rtb.ccn_route_table_id
}