
variable "subnet_name" {
  type         = string
  default          = "tf-test-subnet"
  description  = "Creating a varianble for subnet name"
}


variable "ec2_key" {
  type = string
  default = "devacc2"
  description  = "variable for ec2 key "
}