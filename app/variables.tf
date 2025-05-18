variable "ami_id" {
    default = "ami-084568db4383264d4" 
  
}
variable "instance_type" {
    default = "t2.micro"
  
}
variable "subnet_id" {
  
}
variable "sg_id" {
  
}
variable "key_name" {
  type = string
}
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id      = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name       = var.key_name

  tags = {
    Name = "MyInstance"
  }
}
