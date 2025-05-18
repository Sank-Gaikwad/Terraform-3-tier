resource "aws_instance" "appec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = "tf-key-pair"

  tags = {
    Name = "app-instance"
  }
}
