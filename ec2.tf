resource "aws_instance" "ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.ssh22.id]
  key_name = "practice"
  tags = {
    Name = "suresh"
    Project = "Roboshop"
    Environment = "Dev"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file(var.private_key_path)
    host = self.public_ip
  }

  provisioner "file" {
    source = "Docker_kubectl_eksctl_Install.sh"
    destination = "/tmp/Docker_kubectl_eksctl_Install.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /tmp/Docker_kubectl_eksctl_Install.sh",
      "sudo /tmp/Docker_kubectl_eksctl_Install.sh"  
    ]
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"  
    ]
    when = create
    }  

  provisioner "remote-exec" {
    inline = [ 
      "sudo systemctl stop nginx"   
    ]
    when = destroy
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

