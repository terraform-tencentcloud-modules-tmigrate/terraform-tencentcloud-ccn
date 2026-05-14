variable "region" {
  type = string
  default = "ap-jakarta"
}
variable "routes" {
  type = any
  default = {}
}
variable "ccn_id" {
  type = string
  description = "ccn id for the routes"
}