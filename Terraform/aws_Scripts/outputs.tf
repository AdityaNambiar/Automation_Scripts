output "ec2_inst_id" {
    value = aws_instance.k8s-learn-master.arn
    description = "Show created Instance ARN"
}
output "ec2_inst_ip" {
    value = aws_instance.k8s-learn-master.public_ip
    description = "IPv4 address of the newly provisioned Instance"
}