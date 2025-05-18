variable "username" {
    default = "admin" 
}
variable "password" {
  default = "Pass$123"
}
variable "db_subnet_group_name" {
  
}
variable "sg_ids" {
  type = list(string)
}
