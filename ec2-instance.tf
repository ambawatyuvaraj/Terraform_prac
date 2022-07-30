
resource "aws_instance" "tf-instance" {
  ami           = 	"ami-0b9f1f81cfd27caad"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.tf-data.id
  key_name = var.ec2_key

  tags = {
    Name = "tf-Test-EC2"
  }
}
