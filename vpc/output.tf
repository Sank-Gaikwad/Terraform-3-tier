output "vpc_id" {
    value = aws_vpc.custom_vpc.id
}

output "websubnet_id" {
    value = aws_subnet.websubnet.id
}

output "appsubnet_id" {
    value = aws_subnet.appsubnet.id
}

output "dbsubnet_id" {
    value = aws_subnet.dbsubnet.id
}

output "aws_db_subnet_group_name" {
    value = aws_db_subnet_group.default.name
  
}
