
resource "aws_instance" "tf-instance" {
  ami           = 	"ami-0b9f1f81cfd27caad"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.tf-data.id
  key_name = var.ec2_key

  tags = {
    Name = "tf-Test-EC2"
  }
}

resource "aws_vpc" "tf-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "tf-test-vps"
  }
}

resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.tf-vpc.id

  tags = {
    Name = "tf-test-igw"
  }
}

resource "aws_subnet" "tf-subnet" {
  vpc_id     = aws_vpc.tf-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "tf-test-subnet"
  }
}

resource "aws_route_table" "tf-route-table" {
  vpc_id = aws_vpc.tf-vpc.id

  route = []

  tags = {
    Name = "tf-test-route-table"
  }
}

resource "aws_route_table_association" "tf-rt-association" {
  subnet_id      = aws_subnet.tf-subnet.id
  route_table_id = aws_route_table.tf-route-table.id
}

resource "aws_route" "tf-route" {
  route_table_id            = aws_route_table.tf-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id =  aws_internet_gateway.tf-igw.id
  depends_on                = [aws_route_table.tf-route-table]
}

resource "aws_security_group" "tf-sg" {
  name        = "tf-test-sg"
  description = "Allow All inbound traffic"
  vpc_id      = aws_vpc.tf-vpc.id

  ingress {
    description = "All Trafiic from VPC"
    from_port   = 0 #All ports
    to_port     = 0 #All ports
    protocol    = "-1" #All traffic
    cidr_blocks = [aws_vpc.tf-vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf-test-sg"
  }
}