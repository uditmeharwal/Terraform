resource "aws_security_group" "aws_security_group" {
    name        = "jaat-security-group"
    description = "use for demo purpose"
    vpc_id      = "vpc-063fa7514594a1ab6"
   
    
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      NAME = "instance_security_group_demo "
    }
}
