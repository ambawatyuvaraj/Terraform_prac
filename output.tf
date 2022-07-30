output "ec2_arn" {
    value = aws_instance.tf-instance.arn
}
output "ec2_ami" {
    value = aws_instance.tf-instance.ami
}
output "ec2_dns" {
    value = aws_instance.tf-instance.public_dns
}
output "ec2_public_ip" {
    value = aws_instance.tf-instance.public_ip
}