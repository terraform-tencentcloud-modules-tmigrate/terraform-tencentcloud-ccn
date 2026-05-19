output "vpc_attachment_ids" {
  value = {
    for k, v in tencentcloud_ccn_attachment.vpc_attachment : k => v.id
  }
}

output "vpn_gateway_attachment_ids" {
  value = {
    for k, v in tencentcloud_ccn_attachment.vpn_gateway_attachments : k => v.id
  }
}

output "direct_connect_attachment_ids" {
  value = {
    for k, v in tencentcloud_ccn_attachment.direct_connect_attachments : k => v.id
  }
}
