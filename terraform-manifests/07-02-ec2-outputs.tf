output "ec2_bastion_public_instance_ids" {
  description = "EC2 Bastion Public Instance IDs"
  value       = module.ec2_public.id
}

output "ec2_bastion_public_ip" {
  description = "EC2 Bastion Public Instance IP"
  value       = module.ec2_public.public_ip 
}
