output "attachment_ids" {
  value       = { for k, v in tencentcloud_ccn_attachment.vpc : k => v.id }
  description = "Map of attachment key to attachment ID."
}
