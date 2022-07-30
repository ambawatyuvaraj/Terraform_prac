
data "aws_subnet" "tf-data" {
  depends_on = [aws_subnet.tf-subnet]
  filter {
    name   = "tag:Name"
    values = [var.subnet_name] #reference from variables.tf
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}