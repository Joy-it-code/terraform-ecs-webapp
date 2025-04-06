provider "aws" {
  region = "us-east-1"  
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = "my-webapp-repo"
}

module "ecs" {
  source             = "./modules/ecs"
  repository_name    = "my-webapp-repo"             
  ecr_repository_url = module.ecr.repository_url
  cluster_name       = "my-ecs-cluster"
  service_name       = "my-webapp-service"
  container_port     = 3000
  public_subnet_ids  = ["subnet-05f028de633ab9751", "subnet-0cadb9f6fe9ad4229"]
  security_group_id  = "sg-0e52bdeddf0037bb8"
}

