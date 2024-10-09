resource "aws_security_group" "this" {
    name = "${local.namespaced_departament_name}-bastion-host"
    description = "Allows SSH connections from my local machine"
    vpc_id = local.vpc.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ var.allowed_ip ]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = [ var.allowed_ip ]
    }


    tags = merge(
        local.common_tags,
        {
            "Name" = local.namespaced_departament_name
        }
    )
}


resource "aws_instance" "this" {
    ami = "ami-0346fd83e3383dcb4"
    instance_type = "t2.micro"
    key_name =  "var.key_name"
    subnet_id = local.subnets.public.id[0]
    vpc_security_group_ids =  [ aws_security_group.this.id]

    tags = {
      "Name" = local.namespaced_departament_name
    }


}