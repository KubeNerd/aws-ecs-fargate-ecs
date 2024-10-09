locals {

  namespaced_departament_name = "${var.departament_name}-${var.environment}"
  namespaced_service_name = "${var.service_name}-${var.environment}"

  common_tags = {
    Project     = "AWS ECS Fargate com Terraform"
    Component   = "DYNAMO DATABASE"
    CreatedAt   = "2024-10-08"
    ManagedBy   = "Terraform"
    Owner       = "Vinicius P"
    Env         = var.environment
    Repository = "git@github.com:KubeNerd/aws-ecs-fargate-ecs.git"
  }


  vpc = data.terraform_remote_state.network.outputs.vpc

  subnets = data.terraform_remote_state.network.outputs.subnets
  bastion_host_sg_id = lookup(data.terraform_remote_state.bastion_host.outputs, "security_group_id", "")

}
