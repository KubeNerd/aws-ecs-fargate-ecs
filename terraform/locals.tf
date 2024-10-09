locals {

      namespaced_departament_name = "${var.departament_name}-${var.environment}"

      use_nat_gateway = var.use_nat_gateway

      use_nat_instance = var.use_nat_instance && local.use_nat_gateway == false

      enable_dns_support = (var.use_nat_instance || var.create_vpc_endpoint) ? true : var.network.enable_dns_support

      enable_dns_hostnames = (var.use_nat_instance || var.create_vpc_endpoint) ? true : var.network.enable_dns_hostnames



      common_tags = {
          Project = "AWS ECS Fargate com Terraform"
          Component = "Remote State"
          CreatedAt = "2024-10-08"
          ManagedBy = "Terraform"
          Owner = "Vinicius P"
          Env = env.enviroment
          Repository = "git@github.com:KubeNerd/aws-ecs-fargate-ecs.git"
      }


      sorted_availability_zones = sort(data.aws_availability_zones.all.names)
      selected_availability_zones = slice(local.sorted_availability_zones, 0, var.network.az_count)




}