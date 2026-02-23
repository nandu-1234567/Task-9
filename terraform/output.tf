output "alb_dns" {
  value = aws_lb.alb.dns_name
}

output "ecr_repo_url" {
  value = aws_ecr_repository.strapi_repo.repository_url
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}