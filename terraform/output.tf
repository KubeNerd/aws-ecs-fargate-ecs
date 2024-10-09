output "vpc" {
  value = {
    id         = aws_vpc.this.id
    arn        = aws_vpc.this.arn
    cidr_block = aws_vpc.this.cidr_block
  }
}

output "subnets" {
  value = {
    private = {
      id         = aws_subnet.private.*.id
      cidr_block = aws_subnet.private.*.cidr_block
    }
    public = {
      id         = aws_subnet.public.*.id
      cidr_block = aws_subnet.public.*.cidr_block
    }
  }
}


output "remote_state_bucket" {
  value = {
    arn = aws_s3_bucket.remote_state.arn
    name = aws_s3_bucket.remote_state.bucket
  }
}


output "remote_state_lock_table" {
  value = {
    arn = aws_dynamodb_table.remote_state.arn
    name = aws_dynamodb_table.remote_state.name
  }
}