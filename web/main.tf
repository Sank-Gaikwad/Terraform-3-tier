resource "aws_instance" "webec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id  = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = var.key_name // Use the variable passed from root module
tags = {
    Name = "web-instance"
}
}
