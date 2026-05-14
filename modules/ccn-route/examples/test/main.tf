locals {
  valid_cidrs = {
    route1 = "0.0.0.0/0",
    route2 = "10.0.250.0/24",
    route3 = "172.31.0.0/24",
    route4 = "192.168.0.0/25",
    route5 = "192.168.0.0/24",
  }
}

module "ccn-route" {
  source = "../.."
  ccn_id = "ccn-ef3tqm3z"
  routes = {
    for k, cidr in local.valid_cidrs: k => {
      filters = {
        f1 = {
          name = "cidr-subnet"
          values = [cidr]
        }
      }
      switch = "on"
    }
  }
#  routes = {
#    route1 = {
#      filters = {
#        f1 = {
#          name = "cidr-block"
#          values = ["0.0.0.0/0"]
#        }
#      }
#      switch = "on"
#    }
#    route2 = {
#      filters = {
#        f1 = {
#          name = "cidr-block"
#          values = ["192.168.0.0/25"]
#        }
#      }
#      switch = "on"
#    }
#  }
}