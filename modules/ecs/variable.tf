variable "ecr_repository_url" {}
variable "cluster_name" {}
variable "service_name" {}
variable "container_port" {}

variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs where ECS should run"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for ECS tasks"
  type        = string
}
