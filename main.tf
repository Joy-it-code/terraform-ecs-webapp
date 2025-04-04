provider "aws" {
  region = "us-east-1"  
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = "my-webapp-repo"
}

module "ecs" {
  source             = "./modules/ecs"
  ecr_repository_url = module.ecr.repository_url  
  cluster_name       = "my-ecs-cluster"  
  service_name       = "my-webapp-service" 
  container_port     = 3000 
}