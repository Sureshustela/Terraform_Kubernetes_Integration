resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = aws_instance.ec2.availability_zone
  size              = 50
  type              = "gp3"

  tags = {
    Name = "ebs-volume-terraform-demo"
  }
}

resource "aws_volume_attachment" "ebc_volume_attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.ec2.id
}