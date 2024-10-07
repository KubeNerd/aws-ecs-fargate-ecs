locals {

      namespaced_dapartment_name = "${var.departament_name}-${var.enviroment}"
      use_nat_gateway = var.use_nat_gateway
      enable_dns_support = true
      enable_dns_hostnames = ""
      namespaced_dapartment_name = ""


    common_tags = {
        Project = "AWS ECS Fargate com Terrafomr"
        Component = "Remote State"
        CreatedAt = "2024-07-03"
        ManagedBy = "Terraform"
        Owner = "Vinicius P"
        Repository = "git@github.com:KubeNerd/aws-ecs-fargate-ecs.git"
    }



}