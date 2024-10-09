data "aws_caller_identity" "current" {}

data "terraform_remote_state" "network" {
    backend = "s3"

    config = {
      bucket = "tfstate-2024-871055234888"
      key = "aws-ecs-fargate-ecs/${var.environment}/network/terraform.tfstate"
      region = var.aws_region
    }
}


data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name = ""
        values = []
    }
}