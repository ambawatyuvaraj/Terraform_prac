resource "aws_route_table" "tf-route-table" {
  vpc_id = aws_vpc.tf-vpc.id

  route = []

  tags = {
    Name = "tf-test-route-table"
  }
}