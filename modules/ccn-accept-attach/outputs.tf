output "accept_ids" {
  value       = { for k, v in tencentcloud_ccn_instances_accept_attach.this : k => v.id }
  description = "Map of attachment key to acceptance resource ID."
}
