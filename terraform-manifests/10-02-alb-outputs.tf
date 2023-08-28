output "lb_id" {
  description = "Application Load Balancer ID."
  value       = module.alb.lb_id
}

output "lb_arn" {
  description = "Application Load Balancer ID ARN."
  value       = module.alb.lb_arn
}

output "lb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = module.alb.lb_dns_name
}

output "lb_arn_suffix" {
  description = "Application Load Balancer ARN Suffix"
  value       = module.alb.lb_arn_suffix
}

output "lb_zone_id" {
  description = "Application Load Balancer Zone ID"
  value       = module.alb.lb_zone_id
}

output "http_tcp_listener_arns" {
  description = "HTTP TCP Listener ARNs"
  value       = module.alb.http_tcp_listener_arns
}

output "http_tcp_listener_ids" {
  description = "HTTP TCP Listener IDs"
  value       = module.alb.http_tcp_listener_ids
}

output "https_listener_arns" {
  description = "HTTPS Listener ARNs"
  value       = module.alb.https_listener_arns
}

output "https_listener_ids" {
  description = "HTTPS Listener IDs"
  value       = module.alb.https_listener_ids
}

output "target_group_arns" {
  description = "Target Group ARNs"
  value       = module.alb.target_group_arns
}

output "target_group_arn_suffixes" {
  description = "Target Group ARN Suffixes"
  value       = module.alb.target_group_arn_suffixes
}

output "target_group_names" {
  description = "Target Group Names"
  value       = module.alb.target_group_names
}

output "target_group_attachments" {
  description = "Target Group Attachments"
  value       = module.alb.target_group_attachments
}
