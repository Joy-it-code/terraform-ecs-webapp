resource "aws_ecr_repository" "my_ecr_repo" {
  name = var.repository_name  

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "repository_url" {
  value = aws_ecr_repository.my_ecr_repo.repository_url
}
