resource "aws_ecr_repository" "strapi_repo" {
  name = "${var.project_name}-repo"
}