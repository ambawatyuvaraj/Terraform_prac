resource "aws_subnet" "tf-subnet" {
  vpc_id     = aws_vpc.tf-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "tf-test-subnet"
  }
}