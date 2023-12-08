# Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnet_ids
}

output "private_subnets" {
  value = module.vpc.private_subnet_ids
}

output "load_balancer_dns_name" {
  value = module.load_balancer.lb_dns_name
}

output "autoscaling_group_name" {
  value = module.autoscaling_group.autoscaling_group_name
}