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