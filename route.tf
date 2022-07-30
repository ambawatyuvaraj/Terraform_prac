resource "aws_route" "tf-route" {
  route_table_id            = aws_route_table.tf-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id =  aws_internet_gateway.tf-igw.id
  depends_on                = [aws_route_table.tf-route-table]
}