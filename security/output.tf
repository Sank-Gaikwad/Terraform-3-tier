output "web_sg_id" {
  value = aws_security_group.websg.id
}
output "app_sg_id" {
  value = aws_security_group.appsg.id
}
output "db_sg_id" {
  value = aws_security_group.dbsg.id
}
