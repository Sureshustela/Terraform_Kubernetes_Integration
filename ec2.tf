resource "aws_instance" "ec2" {
ami = var.ami_number
instance_type = "t3.micro"
vpc_security_group_ids = [aws_security_group.ssh22.id]
user_data = file ("Docker_kubectl_eksctl_Install.sh")
key_name = "practice"
tags = {
  Name = "suresh"
  Project = "Roboshop"
  Environment = "Dev"
}
}


resource "aws_security_group" "ssh22" {
name = "ssh22"
tags = {
  Name = "ssh22" 
}

ingress {
to_port = 22
from_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress  {
to_port = 0
from_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}

}

