locals {

  namespaced_departament_name = "${var.departament_name}-${var.environment}"
  common_tags = {
    Project     = "AWS ECS Fargate com Terraform"
    Component   = "Bastion Host"
    CreatedAt   = "2024-10-08"
    ManagedBy   = "Terraform"
    Owner       = "Vinicius P"
    Env         = var.environment
    Repository = "git@github.com:KubeNerd/aws-ecs-fargate-ecs.git"
  }


  vpc = data.terraform_remote_state.network.outputs.vpc

  subnets = data.terraform_remote_state.network.outputs.subnets

}


