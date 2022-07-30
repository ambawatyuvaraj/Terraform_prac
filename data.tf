
data "aws_subnet" "tf-data" {
  depends_on = [aws_subnet.tf-subnet]
  filter {
    name   = "tag:Name"
    values = ["tf-test-subnet"]
  }
}
